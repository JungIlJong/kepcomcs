package com.kepco.app.domain.bbs.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.bbs.mapper.BbsRoleMapper;
import com.kepco.app.domain.bbs.service.BbsRoleService;
import com.kepco.app.domain.ntt.dto.BbsRole;

/**
 * 사용자의 게시판 권한을 조회하기 위한 서비스 구현체
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
@Slf4j
@Service
public class BbsRoleServiceImpl extends EgovAbstractServiceImpl implements BbsRoleService {

    private final BbsRoleMapper bbsRoleMapper;

    public BbsRoleServiceImpl(BbsRoleMapper bbsRoleMapper) {
        this.bbsRoleMapper = bbsRoleMapper;
    }

    /**
     * 게시판 권한을 조회한다.
     *
     * @param bbsId 게시판 ID
     * @param bbsRole 게시판 권한
     * @return Y OR N OR NULL
     */
    @Override
    public String checkRole(String bbsId, BbsRole bbsRole) {
        log.info("mbrId: [{}], bbsId: [{}], action: [{}]", UserDetailsUtil.getMbrId(), bbsId, bbsRole.getAction());
        return bbsRoleMapper.checkRole(UserDetailsUtil.getMbrId(), bbsId, bbsRole.getAction());
    }
}
