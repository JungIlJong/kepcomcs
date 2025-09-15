package com.kepco.app.domain.ntt.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kepco.app.domain.atchfile.dto.InsertAtchFile;
import com.kepco.app.domain.atchfile.service.FileService;
import com.kepco.app.domain.ntt.dto.SysNtt;
import com.kepco.app.domain.ntt.mapper.NttSysMapper;
import com.kepco.app.domain.ntt.service.NttSysService;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 관리자가 게시글을 관리하기 위한 서비스 구현체
 *
 * @author 기업부설연구소 김선홍
 * @since 2024.03.28
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
@Service("nttSysService")
public class NttSysServiceImpl extends EgovAbstractServiceImpl implements NttSysService {
    private final NttSysMapper nttSysMapper;

    private final FileService fileService;


    private final String path;

    public NttSysServiceImpl(NttSysMapper nttSysMapper, FileService fileService, Environment env) {
        this.nttSysMapper = nttSysMapper;
        this.fileService = fileService;
        this.path = env.getProperty("Globals.fileStorePath", String.class);
    }

    /**
     * 게시글을 등록한다.
     *
     * @param ntt 게시글 DTO
     */
    @Override
    @Transactional
    public void insertNtt(SysNtt ntt) throws FdlException {
        nttSysMapper.insertNtt(ntt);
        fileUpload(ntt, ntt.getFrstRegisterId());
    }

    /**
     * 게시글을 수정한다.
     *
     * @param ntt 게시글 DTO
     */
    @Override
    @Transactional
    public void updateNtt(SysNtt ntt) throws FdlException {
        fileUpload(ntt, ntt.getLastUpdusrId());
        if(Objects.nonNull(ntt.getRemoveFileList())) {
            for(String fileId: ntt.getRemoveFileList()) {
                fileService.deleteAtchfileById(fileId);
            }
        }
        nttSysMapper.updateNtt(ntt);
    }

    /**
     * 게시글을 삭제한다.
     *
     * @param nttId 삭제될 게시글 ID
     */
    @Override
    @Transactional
    public void deleteNtt(String nttId) {
        Map<String, Object> reply = nttSysMapper.selectReplyDetail(nttId);
        if(reply != null) {
            String replyId = reply.get("nttId").toString();
            fileService.deleteAtchfileByUpperId(replyId);
            nttSysMapper.deleteNtt(replyId);
        }
        fileService.deleteAtchfileByUpperId(nttId);
        nttSysMapper.deleteNtt(nttId);
    }

    /**
     * 게시글 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 조회 결과
     */
    @Override
    public List<Map<String, Object>> selectNttList(Map<String, Object> paramMap) {
        return nttSysMapper.selectNttList(paramMap);
    }

    /**
     * 게시글 총 갯수를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 총 갯수
     */
    @Override
    public int selectNttListTotCnt(Map<String, Object> paramMap) {
        return nttSysMapper.selectNttListTotCnt(paramMap);
    }

    /**
     * 게시글 상세 정보를 조회한다.
     *
     * @param nttId 게시글 ID
     * @return 상세 정보
     */
    @Override
    public Map<String, Object> selectNttDetail(String nttId) {
        return nttSysMapper.selectNttDetail(nttId);
    }

    /**
     * 조회수를 증가한다.
     *
     * @param nttId 게시글 ID
     */
    @Override
    public void increseRdcnt(String nttId) {
        nttSysMapper.increseRdcnt(nttId);
    }

    @Override
    @Transactional
    public void deleteByBbsId(String bbsId) throws IOException {
        nttSysMapper.deleteByBbsId(bbsId);
        FileUtils.deleteDirectory(new File(path + File.separator + "bbs" + File.separator + bbsId));
    }

    @Override
    public void updateNttReportIds(String nttId) {
        nttSysMapper.updateNttReportIds(nttId);
    }

    /**
     * 파일을 업로드한다.
     *
     * @param ntt 게시글 DTO
     * @throws FdlException
     */
    private void fileUpload(SysNtt ntt, String regId) throws FdlException {

        if(Objects.isNull(ntt.getFiles())) {
            return;
        }

        if(ntt.getFiles().length == 0) {
            return;
        }

        if(ntt.getFiles()[0].isEmpty()) {
            return;
        }

        for(MultipartFile file: ntt.getFiles()) {
            StringBuilder sb = new StringBuilder();
            InsertAtchFile insertAtchFile = InsertAtchFile.builder()
                    .file(file)
                    .path(sb.append(path).append(File.separator).append("bbs").append(File.separator).append(ntt.getBbsId()).append(File.separator).append(LocalDate.now().toString()).toString())
                    .frstRegisterId(regId)
                    .upperId(ntt.getNttId())
                    .fileSe("ntt")
                    .build();
            fileService.insertAtchfile(insertAtchFile);
        }
    }
    
    /**
     * 금칙어 조회
     */
    public List<HashMap<String, Object>> getProhibitiveWordList() {
		return nttSysMapper.getProhibitiveWordList();
	}
}
