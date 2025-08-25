package com.kepco.app.domain.accessip.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.domain.accessip.dto.AccessIp;
import com.kepco.app.domain.accessip.dto.XlsxAccessIp;
import com.kepco.app.domain.accessip.mapper.AccessIpMapper;
import com.kepco.app.domain.accessip.service.AccessIpService;

import java.util.List;
import java.util.Map;

/**
 * 접근IP를 관리하기 위한 서비스 구현 클래스
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

@Service("accessIpService")
public class AccessIpServiceImpl extends EgovAbstractServiceImpl implements AccessIpService {

    private final AccessIpMapper accessIpMapper;

    public AccessIpServiceImpl(AccessIpMapper accessIpMapper) {
        this.accessIpMapper = accessIpMapper;
    }

    /**
     * 접근IP 목록 정보를 조회한다.
     * @param searchMap
     * @return
     */
    @Override
    public List<Map<String, Object>> selectAccessIpList(Map<String, Object> searchMap) {
        return accessIpMapper.selectAccessIpList(searchMap);
    }

    /**
     * 접근IP 총 갯수를 조회한다.
     * @param searchMap
     * @return
     */
    @Override
    public int selectAccessIpListTotCnt(Map<String, Object> searchMap) {
        return accessIpMapper.selectAccessIpListTotCnt(searchMap);
    }

    /**
     * 접근IP 상세 정보를 조회한다.
     * @param ipId
     * @return
     */
    @Override
    public AccessIp selectAccessIpDetail(String ipId) {
        return accessIpMapper.selectAccessIpDetail(ipId);
    }

    /**
     * 접근IP 정보를 등록한다.
     * @param accessIp
     */
    @Override
    public void insertAccessIp(AccessIp accessIp) {
        accessIpMapper.insertAccessIp(accessIp);
    }

    /**
     * 접근IP 정보를 수정한다.
     * @param accessIp
     */
    @Override
    public void updateAccessIp(AccessIp accessIp) {
        accessIpMapper.updateAccessIp(accessIp);
    }

    /**
     * 접근IP 정보를 삭제한다.
     * @param ipId
     */
    @Override
    public void deleteAccessIp(String ipId) {
        accessIpMapper.deleteAccessIp(ipId);
    }

    /**
     * 접근IP 엑셀 정보를 조회한다.
     * @param paramMap
     * @return
     */
    @Override
    public List<XlsxAccessIp> selectAccessIpXlsx(Map<String, Object> paramMap) {
        return accessIpMapper.selectAccessIpXlsx(paramMap);
    }

    @Override
    public List<String> selectAllAccessIpList() {
        return accessIpMapper.selectAllAccessIpList2();
    }

}
