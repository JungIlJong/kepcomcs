package com.kepco.app.domain.bbs.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.bbs.dto.SysBbs;
import com.kepco.app.domain.bbs.mapper.BbsRoleSysMapper;
import com.kepco.app.domain.bbs.mapper.BbsSysMapper;
import com.kepco.app.domain.bbs.service.BbsSysService;
import com.kepco.app.domain.ntt.service.NttSysService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 게시판을 관리하기 위한 서비스 구현체
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
@Service("bbsSysService")
public class BbsSysServiceImpl extends EgovAbstractServiceImpl implements BbsSysService {
    private final BbsSysMapper bbsSysMapper;
    private final BbsRoleSysMapper bbsRoleSysMapper;

    private final NttSysService nttSysService;



    public BbsSysServiceImpl(BbsSysMapper bbsSysMapper, BbsRoleSysMapper bbsRoleSysMapper, NttSysService nttSysService) {
        this.bbsSysMapper = bbsSysMapper;
        this.bbsRoleSysMapper = bbsRoleSysMapper;
        this.nttSysService = nttSysService;
    }

    /**
     * 게시판을 생성한다.
     *
     * @param bbs 게시판 DTO
     * @throws FdlException
     */
    @Override
    @Transactional
    public void insertBbs(SysBbs bbs) throws FdlException {
        bbsSysMapper.insertBbs(bbs);
        bbsRoleSysMapper.insertBbsRole(bbs.getBbsId(), bbs.getRoles());
    }

    /**
     * 게시판을 수정한다.
     *
     * @param bbs 게시판 DTO
     */
    @Override
    @Transactional
    public void updateBbs(SysBbs bbs) {
        bbsSysMapper.updateBbs(bbs);
        bbsRoleSysMapper.deleteBbsRole(bbs.getBbsId());
        bbsRoleSysMapper.insertBbsRole(bbs.getBbsId(), bbs.getRoles());
    }

    /**
     * 게시판을 삭제한다.
     *
     * @param bbsId 삭제할 게시판 ID
     */
    @Override
    @Transactional
    public void deleteBbsById(String bbsId) throws IOException {
        nttSysService.deleteByBbsId(bbsId);
        bbsSysMapper.deleteBbsById(bbsId);
        bbsRoleSysMapper.deleteBbsRole(bbsId);
    }

    /**
     * 게시판 목록을 조회한다.
     *
     * @param paraMap 조회할 정보가 담긴 Map
     * @return 게시판 리스트
     */
    @Override
    public List<Map<String, Object>> selectBbsList(Map<String, Object> paraMap) {
        return bbsSysMapper.selectBbsList(paraMap);
    }

    /**
     * 게시판 총 갯수를 조회한다.
     *
     * @param paraMap 조회할 정보가 담긴 Map
     * @return 게시판 총 갯수
     */
    @Override
    public int selectBbsListTotCnt(Map<String, Object> paraMap) {
        return bbsSysMapper.selectBbsListTotCnt(paraMap);
    }

    /**
     * 게시판 상세정보를 조회한다.
     *
     * @param bbsId 조회할 게시판의 ID
     * @return 게시판 상세정보
     */
    @Override
    public Map<String, Object> selectBbsDetail(String bbsId) {
        return bbsSysMapper.selectBbsDetail(bbsId);
    }

    /**
     * 회원 권한에 따른 게시판 정보를 가져온다.
     *
     * @param bbsId 조회할 게시판 ID
     * @return 게시판 상세정보
     */
    @Override
    public Map<String, Object> selectBbsPermissionInfo(String bbsId) {
        return bbsSysMapper.selectBbsPermissionInfo(bbsId, UserDetailsUtil.getId());
    }

    /**
     * 사용가능한 모든 게시판 목록를 가져온다.
     *
     * @return 사용가능한 모든 게시판 목록
     */
    @Override
    public List<Map<String, Object>> selectAllEnabled() {
        return bbsSysMapper.selectAllEnabled();
    }
}
