package com.kepco.app.domain.bbs.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.bbs.dto.SysBbs;

import java.util.List;
import java.util.Map;

/**
 * 관리자가 게시판를 관리하기 위한 Mapper 인터페이스
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
@Mapper("bbsSysMapper")
public interface BbsSysMapper {

    /**
     * 게시판을 생성한다.
     *
     * @param bbs 게시판 DTO
     */
    void insertBbs(SysBbs bbs);

    /**
     * 게시판을 수정한다.
     *
     * @param bbs 게시판 DTO
     */
    void updateBbs(SysBbs bbs);

    /**
     * 게시판을 삭제한다.
     *
     * @param bbsId 삭제할 게시판 ID
     */
    void deleteBbsById(String bbsId);

    /**
     * 게시판 목록을 조회한다.
     *
     * @param paraMap 조회할 정보가 담긴 Map
     * @return 게시판 목록
     */
    List<Map<String, Object>> selectBbsList(Map<String, Object> paraMap);

    /**
     * 게시판 총 갯수를 조회한다.
     *
     * @param paraMap 조회할 정보가 담긴 Map
     * @return 게시판 총 갯수
     */
    int selectBbsListTotCnt(Map<String, Object> paraMap);

    /**
     * 게시판 상세정보를 조회한다.
     *
     * @param bbsId 조회할 게시판의 ID
     * @return 게시판 상세정보
     */
    Map<String, Object> selectBbsDetail(String bbsId);

    /**
     * 회원 권한에 따른 게시판 정보를 가져온다.
     *
     * @param bbsId 조회할 게시판 ID
     * @return 게시판 상세정보
     */
    Map<String, Object> selectBbsPermissionInfo(String bbsId, String mbrId);

    /**
     * 사용가능한 모든 게시판 목록를 가져온다.
     *
     * @return 사용가능한 모든 게시판 목록
     */
    List<Map<String, Object>> selectAllEnabled();
}
