package com.kepco.app.domain.popup.service;

import org.egovframe.rte.fdl.cmmn.exception.FdlException;

import com.kepco.app.domain.popup.dto.SysPopup;

import java.util.List;
import java.util.Map;

/**
 * 관리자가 팝업을 관리하기 위한 서비스 인터페이스
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
public interface PopupSysService {

    /**
     * 팝업을 등록한다.
     *
     * @param popup 팝업 DTO
     * @throws FdlException
     */
    void insertPopup(SysPopup popup) throws FdlException;

    /**
     * 팝업을 수정한다.
     *
     * @param popup 팝업 DTO
     * @throws FdlException
     */
    void updatePopup(SysPopup popup) throws FdlException;

    /**
     * 팝업을 삭제한다.
     *
     * @param popupId 삭제할 팝업 ID
     */
    void deletePopup(String popupId);

    /**
     *  팝업 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 조회 결과
     */
    List<Map<String, Object>> selectPopupList(Map<String, Object> paramMap);

    /**
     * 팝업 상세 정보를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 총 갯수
     */
    int selectPopupListTotCnt(Map<String, Object> paramMap);

    /**
     * 팝업 상세 정보를 조회한다.
     *
     * @param popupId 팝업 ID
     * @return 상세 정보
     */
    Map<String, Object> selectPopupDetail(String popupId);

    /**
     * 게시 상태(Y)인 팝업 개수를 조회한다.
     *
     * @return 게시 중인 팝업 개수
     */
    int selectActivePopupCount();
}
