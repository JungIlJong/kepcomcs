package com.kepco.app.domain.bbs.service;


import java.util.List;
import java.util.Map;

import com.kepco.app.domain.ntt.dto.BbsRole;

/**
 * 관리자가 게시판 권한을 관리하기 위한 서비스 인터페이스
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
public interface BbsRoleSysService {

    /**
     * 회원의 게시판 권한을 조회한다.
     *
     * @param bbsId 조회할 게시판 ID
     * @param action 회원의 작업
     * @return 권한이 존재할 경우 Y, 존재하지 않을 경우 N, 게시판이 존재하지 않으면 NULL
     */
    String checkBbsRole(String bbsId, BbsRole action);

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
