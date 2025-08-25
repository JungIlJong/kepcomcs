package com.kepco.app.domain.atchfile.service;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.kepco.app.domain.atchfile.dto.Atchfile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * 공통 파일 클래스
 *
 * @author  김선홍
 * @version 1.0
 * @
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2024.03.28  김선홍         최초 생성
 * </pre>
 */
@Slf4j
@Component("vtFileUtils")
public class VtFileUtils {

    /**
     * 파일 정보 취득 메서드
     *
     * @param file 정보를 추출할 파일
     * @return 파일명, 확장자, 사이즈
     */
    public Atchfile getFileInfo(MultipartFile file) {
        return  Atchfile.builder()
                .orignlFileNm(FilenameUtils.getBaseName(file.getOriginalFilename()))
                .fileExtsn(FilenameUtils.getExtension(file.getOriginalFilename()))
                .fileSize(file.getSize())
                .build();
    }

    /**
     * 파일 업로드 메서드
     *
     * @param file 업로드 파일
     * @throws IOException 저장 에러
     */
    public void upload(MultipartFile file, Atchfile atchfile) throws IOException {
        File dir = new File(atchfile.getFileStreCours());
        if(!dir.exists()) {
            Files.createDirectories(Paths.get(atchfile.getFileStreCours()));
        }
        log.info("파일 업로드 경로: {}", atchfile.getFileStreCours());
        log.info("파일 업로드 명: {}", atchfile.getStreFileNm());
        File uploadFile = new File(atchfile.getFileStreCours(), atchfile.getStreFileNm());
        FileCopyUtils.copy(file.getBytes(), uploadFile);
    }

    /**
     * 파일 삭제 메서드
     *
     */
    public void delete(Atchfile atchfile) {
        log.info("파일 삭제: {}", atchfile.getFileStreCours() + File.separator + atchfile.getStreFileNm());
        File deleteFile = new File(atchfile.getFileStreCours() + File.separator + atchfile.getStreFileNm());
        deleteFile.deleteOnExit();
     }
}
