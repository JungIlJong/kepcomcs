package com.kepco.app.domain.bbs.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

/**
 * 사용자의 게시판 권한을 조회하기 위한 Mapper 인터페이스
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
@Mapper("bbsRoleMapper")
public interface BbsRoleMapper {

    /**
     * 게시판 권한을 조회한다.
     *
     * @param mbrId 회원 ID
     * @param bbsId 게시판 ID
     * @param action 게시판 권한
     * @return Y OR N OR NULL
     */
    String checkRole(String mbrId, String bbsId, String action);
}
