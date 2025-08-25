package com.kepco.app.domain.atchfile.service;

import org.egovframe.rte.fdl.cmmn.exception.FdlException;

import com.kepco.app.domain.atchfile.dto.Atchfile;
import com.kepco.app.domain.atchfile.dto.InsertAtchFile;

import java.util.List;
import java.util.Map;

/**
 * 파일 서비스 인터페이스
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
public interface FileService {

    /**
     * 파일을 등록한다.
     *
     * @param insertAtchFile 파일 DTO
     * @return 파일 ID
     * @throws FdlException
     */
    String insertAtchfile(InsertAtchFile insertAtchFile);

    /**
     * 이미지 파일을 등록한다.
     *
     * @param insertAtchFile 파일 DTO
     * @return 파일 ID
     * @throws FdlException
     */
    String insertImgAtchFile(InsertAtchFile insertAtchFile) throws FdlException;

    /**
     * 파일을 삭제한다.
     *
     * @param fileId 삭제할 파일 ID
     */
    void deleteAtchfileById(String fileId);

    /**
     * 파일 상세정보를 조회한다.
     *
     * @param fileId 파일 ID
     * @return
     */
    Atchfile selectAtchfileDetail(String fileId);

    /**
     * 부모 ID의 파일 삭제한다.
     *
     * @param upperId 부모 ID
     */
    void deleteAtchfileByUpperId(String upperId);

    /**
     * CKEditor 이미지 파일 첨부
     *
     * @param insertAtchFile 파일 DTO
     * @return 파일 ID
     * @throws FdlException
     */
    String editor(InsertAtchFile insertAtchFile) throws FdlException;

    /**
     * 부모 ID의 특정 파일을 조회한다.
     *
     * @param upperId  부모 ID
     * @param fileSe 파일 구분
     * @return
     */
    List<Map<String, Object>> selectAtchFileList(String upperId, String fileSe);
}
