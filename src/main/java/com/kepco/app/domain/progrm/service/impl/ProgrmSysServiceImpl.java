package com.kepco.app.domain.progrm.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.progrm.dto.Progrm;
import com.kepco.app.domain.progrm.mapper.ProgrmSysMapper;
import com.kepco.app.domain.progrm.service.ProgrmSysService;

import java.util.List;
import java.util.Map;

/**
 * 프로그램을 관리하기 위한 서비스 구현 클래스
 * @author 기업부설연구소 박규영
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
 *   2024.03.28  박규영         최초 생성
 * </pre>
 */

@Slf4j
@Service("progrmSysService")
public class ProgrmSysServiceImpl extends EgovAbstractServiceImpl implements ProgrmSysService {

    private final ProgrmSysMapper progrmSysMapper;

    public ProgrmSysServiceImpl(ProgrmSysMapper progrmSysMapper) {
        this.progrmSysMapper = progrmSysMapper;
    }

    /**
     * 프로그램 목록 정보를 조회한다.
     * @param searchMap
     * @return
     */
    @Override
    public List<Progrm> selectProgrmList(Map<String, Object> searchMap) {
        return progrmSysMapper.selectProgrmList(searchMap);
    }

    /**
     * 프로그램 총 갯수를 조회한다.
     * @param searchMap
     * @return
     */
    @Override
    public int selectProgrmListTotCnt(Map<String, Object> searchMap) {
        return progrmSysMapper.selectProgrmListTotCnt(searchMap);
    }

    /**
     * 프로그램 상세 정보를 조회한다.
     * @param progrmId
     * @return
     */
    @Override
    public Progrm selectProgrmDetail(String progrmId) {
        return progrmSysMapper.selectProgrmDetail(progrmId);
    }

    /**
     * 프로그램 정보를 등록한다.
     * @param progrm
     * @throws Exception
     */
    @Override
    public void insertProgrm(Progrm progrm) {
        progrm.setFrstRegisterId(UserDetailsUtil.getMbrId());
        progrmSysMapper.insertProgrm(progrm);
    }

    /**
     * 프로그램 정보를 수정한다.
     * @param progrm
     */
    @Override
    public void updateProgrm(Progrm progrm) {
        progrm.setLastUpdusrId(UserDetailsUtil.getMbrId());
        progrmSysMapper.updateProgrm(progrm);
    }

    /**
     * 프로그램 정보를 삭제한다.
     * @param progrmId
     */
    @Override
    public void deleteProgrm(String progrmId) {
        progrmSysMapper.deleteProgrm(progrmId);
    }

}
