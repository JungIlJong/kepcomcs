package com.kepco.app.domain.bbs.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.bbs.mapper.BbsRoleSysMapper;
import com.kepco.app.domain.bbs.service.BbsRoleSysService;
import com.kepco.app.domain.ntt.dto.BbsRole;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 게시판 권한을 관리하기 위한 서비스 구현체
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
@Service("bbsRoleSysService")
public class BbsRoleSysServiceImpl extends EgovAbstractServiceImpl implements BbsRoleSysService {

    private final BbsRoleSysMapper bbsRoleSysMapper;

    public BbsRoleSysServiceImpl(BbsRoleSysMapper bbsRoleSysMapper) {
        this.bbsRoleSysMapper = bbsRoleSysMapper;
    }

    /**
     * 회원의 게시판 권한을 조회한다.
     *
     * @param bbsId 조회할 게시판 ID
     * @param action 회원의 작업
     * @return 권한이 존재할 경우 Y, 존재하지 않을 경우 N, 게시판이 존재하지 않으면 NULL
     */
    @Override
    public String checkBbsRole(String bbsId, BbsRole action) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("bbsId", bbsId);
        paramMap.put("action", action.getAction());
        paramMap.put("uuid", UserDetailsUtil.getUuid());
        return bbsRoleSysMapper.checkBbsRole(paramMap);
    }

    /**
     * 게시판의 권한 목록을 조회한다.
     *
     * @param bbsId 조회할 게시판 ID
     * @return 게시판의 권한 목록
     */
    @Override
    public List<Map<String, Object>> selectBbsRole(String bbsId) {
        return bbsRoleSysMapper.selectBbsRole(bbsId);
    }

    /**
     * 모든 권한 목록을 조회한다.
     *
     * @return 모든 권한 목록
     */
    @Override
    public List<Map<String, Object>> selectRoleListAll() {
        return bbsRoleSysMapper.selectRoleListAll();
    }
}
