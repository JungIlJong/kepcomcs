package com.kepco.app.domain.atchfile.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.core.exception.GlobalRestException;
import com.kepco.app.domain.atchfile.dto.Atchfile;
import com.kepco.app.domain.atchfile.dto.InsertAtchFile;
import com.kepco.app.domain.atchfile.mapper.AtchfileMapper;
import com.kepco.app.domain.atchfile.service.FileService;
import com.kepco.app.domain.atchfile.service.VtFileUtils;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 파일 서비스 구현체
 *
 * @author 기업부설연구소 김선홍
 * @since 2024.03.30
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
@Service("fileService")
public class FileServiceImpl extends EgovAbstractServiceImpl implements FileService {

    private final VtFileUtils fileUtils;
    private final AtchfileMapper fileMapper;
    private String enableImgExtensions;

    public FileServiceImpl(VtFileUtils fileUtils, AtchfileMapper fileMapper, Environment env) {
        this.fileUtils = fileUtils;
        this.fileMapper = fileMapper;
        this.enableImgExtensions = env.getProperty("Globals.fileUpload.Extensions.Images", String.class);
    }




    /**
     * 파일을 등록한다.
     *
     * @param insertAtchFile 파일 DTO
     * @return 파일 ID
     * @throws FdlException
     */
    @Override
    @Transactional
    public String insertAtchfile(InsertAtchFile insertAtchFile) {
        Atchfile atchfile = fileUtils.getFileInfo(insertAtchFile.getFile());

        atchfile = Atchfile.builder()
                .fileStreCours(insertAtchFile.getPath())
                .streFileNm(UUID.randomUUID().toString())
                .fileExtsn(atchfile.getFileExtsn())
                .orignlFileNm(atchfile.getOrignlFileNm())
                .fileSize(atchfile.getFileSize())
                .upperId(insertAtchFile.getUpperId())
                .frstRegisterId(insertAtchFile.getFrstRegisterId())
                .fileSe(insertAtchFile.getFileSe())
                .build();
        try {
            fileMapper.insertAtchfile(atchfile);
            fileUtils.upload(insertAtchFile.getFile(), atchfile);
        } catch (GlobalRestException | IOException e) {
            throw new GlobalRestException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        } finally {
            log.info("insertAtchfile End");
        }
        return atchfile.getAtchFileId();
    }

    /**
     * 이미지 파일을 등록한다.
     *
     * @param insertAtchFile 파일 DTO
     * @return 파일 ID
     * @throws FdlException
     */
    @Override
    public String insertImgAtchFile(InsertAtchFile insertAtchFile) throws FdlException {
        Atchfile atchfile = fileUtils.getFileInfo(insertAtchFile.getFile());

        atchfile = Atchfile.builder()
                .fileStreCours(insertAtchFile.getPath())
                .streFileNm(UUID.randomUUID().toString())
                .fileExtsn(atchfile.getFileExtsn())
                .orignlFileNm(atchfile.getOrignlFileNm())
                .fileSize(atchfile.getFileSize())
                .upperId(insertAtchFile.getUpperId())
                .frstRegisterId(insertAtchFile.getFrstRegisterId())
                .fileSe(insertAtchFile.getFileSe())
                .build();
        Atchfile finalAtchfile = atchfile;
        if(!enableImgExtensions.contains(finalAtchfile.getFileExtsn().toUpperCase())) {
            StringBuilder sb = new StringBuilder();
            throw new GlobalRestException(HttpStatus.BAD_GATEWAY, sb.append("파일 확장자 ").append(finalAtchfile.getFileExtsn()).append("는 허용하지 않습니다.\n허용하는 확장자는 다음과 같습니다.").append(enableImgExtensions).toString());
        }
        try {
            fileMapper.insertAtchfile(atchfile);
            fileUtils.upload(insertAtchFile.getFile(), atchfile);
        } catch (GlobalRestException | IOException e) {
            throw new GlobalRestException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        } finally {
            log.info("insertImgAtchFile End");
        }
        return atchfile.getAtchFileId();
    }

    /**
     * 파일을 삭제한다.
     *
     * @param fileId 삭제할 파일 ID
     */
    @Override
    @Transactional
    public void deleteAtchfileById(String fileId) {
        Atchfile atchfile = fileMapper.selectAtchfileDetail(fileId);
        fileUtils.delete(atchfile);
        fileMapper.deleteAtchfileById(fileId);
    }

    /**
     * 파일 상세정보를 조회한다.
     *
     * @param fileId 파일 ID
     * @return
     */
    @Override
    public Atchfile selectAtchfileDetail(String fileId) {
        return fileMapper.selectAtchfileDetail(fileId);
    }

    /**
     * 부모 ID의 파일 삭제한다.
     *
     * @param upperId 부모 ID
     */
    @Override
    @Transactional
    public void deleteAtchfileByUpperId(String upperId) {
        List<Atchfile> atchfileList = fileMapper.selectAtchfileByUpperId(upperId);
        fileMapper.deleteAtchfileByUpperId(upperId);
        for(Atchfile atchfile: atchfileList) {
            fileUtils.delete(atchfile);
        }
    }

    /**
     * CKEditor 이미지 파일 첨부
     *
     * @param insertAtchFile 파일 DTO
     * @return 파일 ID
     * @throws FdlException
     */
    @Override
    public String editor(InsertAtchFile insertAtchFile) throws FdlException {
        Atchfile atchfile = fileUtils.getFileInfo(insertAtchFile.getFile());
        atchfile = Atchfile.builder()
                .fileStreCours(insertAtchFile.getPath())
                .streFileNm(UUID.randomUUID().toString())
                .fileExtsn(atchfile.getFileExtsn())
                .orignlFileNm(atchfile.getOrignlFileNm())
                .fileSize(atchfile.getFileSize())
                .upperId(insertAtchFile.getUpperId())
                .frstRegisterId(insertAtchFile.getFrstRegisterId())
                .fileSe(insertAtchFile.getFileSe())
                .build();
        Atchfile finalAtchfile = atchfile;
        if(!enableImgExtensions.contains(finalAtchfile.getFileExtsn().toUpperCase())) {
            return null;
        }
        try {
            fileMapper.insertAtchfile(atchfile);
            fileUtils.upload(insertAtchFile.getFile(), atchfile);
        } catch (GlobalRestException | IOException e) {
            throw new GlobalRestException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        } finally {
            log.info("editor End");
        }
        return atchfile.getAtchFileId();
    }

    /**
     * 부모 ID의 특정 파일을 조회한다.
     *
     * @param upperId  부모 ID
     * @param fileSe 파일 구분
     * @return
     */
    @Override
    public List<Map<String, Object>> selectAtchFileList(String upperId, String fileSe) {
        return fileMapper.selectAtchFile(upperId, fileSe);
    }
}
