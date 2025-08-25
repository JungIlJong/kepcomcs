package com.kepco.app.domain.cntnts.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.domain.cntnts.mapper.CntntsHistSysMapper;
import com.kepco.app.domain.cntnts.service.CntntsHistSysService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 콘텐츠 이력을 조회하기 위한 서비스 구현체
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
@Service("cntntsHistSysService")
public class CntntsHistSysServiceImpl extends EgovAbstractServiceImpl implements CntntsHistSysService {

    private final CntntsHistSysMapper cntntsHistSysMapper;

    public CntntsHistSysServiceImpl(CntntsHistSysMapper cntntsHistSysMapper) {
        this.cntntsHistSysMapper = cntntsHistSysMapper;
    }

    /**
     * 콘텐츠 이력 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 콘텐츠 목록
     */
    @Override
    public List<Map<String, Object>> selectCntntsHistList(Map<String, Object> paramMap) {
        return cntntsHistSysMapper.selectCntntsHistList(paramMap);
    }

    /**
     * 콘텐츠 이력 총 갯수를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 콘텐츠 목록
     */
    @Override
    public int selectCntntsHistTotCnt(Map<String, Object> paramMap) {
        return cntntsHistSysMapper.selectCntntsHistTotCnt(paramMap);
    }
}
