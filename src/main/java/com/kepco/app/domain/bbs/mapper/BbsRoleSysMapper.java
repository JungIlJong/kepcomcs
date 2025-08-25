package com.kepco.app.domain.bbs.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 관리자가 게시판 권한를 관리하기 위한 Mapper 인터페이스
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
@Mapper("bbsRoleSysMapper")
public interface BbsRoleSysMapper {

    /**
     * 게시판 권한을 생성한다.
     *
     * @param bbsId 게시판 ID
     * @param roles ROLE ID와 권한 리스트
     */
    void insertBbsRole(String bbsId, List<Map<String, Object>> roles);

    /**
     * 헤당 게시판의 모든 권한을 삭제한다.
     *
     * @param bbsId 게시판 ID
     */
    void deleteBbsRole(String bbsId);

    /**
     * 회원의 게시판 권한을 조회한다.
     *
     * @param paramMap 조회할 게시판 ID, 회원의 작업, 회원의 ID
     * @return 권한이 존재할 경우 Y, 존재하지 않을 경우 N, 게시판이 존재하지 않으면 NULL
     */
    String checkBbsRole(Map<String, Object> paramMap);

    /**
     * 게시판의 권한 목록을 조회한다.
     *
     * @param bbsId 조회할 게시판 ID
     * @return 게시판의 권한 목록
     */
    List<Map<String, Object>> selectBbsRole(String bbsId);

    /**
     * 모든 권한 목록을 조회한다.
     *
     * @return 모든 권한 목록
     */
    List<Map<String, Object>> selectRoleListAll();
}
