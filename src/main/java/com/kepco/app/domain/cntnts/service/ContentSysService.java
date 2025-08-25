package com.kepco.app.domain.cntnts.service;

import org.egovframe.rte.fdl.cmmn.exception.FdlException;

import com.kepco.app.domain.cntnts.dto.Content;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 콘텐츠를 관리하기 위한 서비스 인터페이스
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
public interface ContentSysService {

    /**
     * 콘텐츠를 생성한다
     *
     * @param content 콘텐츠 DTO
     */
    void insertCntnts(Content content) throws FdlException;

    /**
     * 콘텐츠를 수정한다
     *
     * @param content 콘텐츠 DTO
     */
    void updateCntnts(Content content) throws FdlException;

    /**
     * 콘텐츠를 삭제한다.
     *
     * @param contentId 삭제할 콘텐츠 ID
     */
    void deleteById(String contentId, String mgrId) throws FdlException, IOException;

    /**
     * 콘텐츠 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 콘텐츠 목록
     */
    List<Map<String, Object>> selectContentList(Map<String, Object> paramMap);

    /**
     * 콘텐츠 총 갯수를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 콘텐츠 총 갯수
     */
    int selectContentTonCnt(Map<String, Object> paramMap);

    /**
     * 콘텐츠 상세정보를 조회한다.
     *
     * @param cntntId 콘텐츠 ID
     * @return 콘텐츠 상세정보
     */
    Map<String, Object> selectContentDetail(String cntntId);

    /**
     * 콘텐츠를 조회한다.
     *
     * @param cntntId 콘텐츠 ID
     * @return 콘텐츠
     */
    String getCntnt(String cntntId);
}
