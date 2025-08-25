package com.kepco.app.domain.bbs.service;


import com.kepco.app.domain.ntt.dto.BbsRole;

/**
 * 사용자의 게시판 권한을 조회하기 위한 서비스 인터페이스
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
 *   2024.03.30  김선홍         최초 생성
 * </pre>
 */
public interface BbsRoleService {

    /**
     * 게시판 권한을 조회한다.
     *
     * @param bbsId 게시판 ID
     * @param bbsRole 게시판 권한
     * @return Y OR N OR NULL
     */
    String checkRole(String bbsId, BbsRole bbsRole);
}
