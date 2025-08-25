package com.kepco.app.domain.accessip.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.accessip.dto.AccessIp;
import com.kepco.app.domain.accessip.dto.XlsxAccessIp;

/**
 * 접근IP를 관리하기 위한 서비스 인터페이스
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

public interface AccessIpService {

    /**
     * 접근IP 목록 정보를 조회한다.
     * @param searchMap
     * @return
     */
    List<Map<String, Object>> selectAccessIpList(Map<String, Object> searchMap);

    /**
     * 접근IP 총 갯수를 조회한다.
     * @param searchMap
     * @return
     */
    int selectAccessIpListTotCnt(Map<String, Object> searchMap);

    /**
     * 접근IP 상세 정보를 조회한다.
     * @param ipId
     * @return
     */
    AccessIp selectAccessIpDetail(String ipId);

    /**
     * 접근IP 정보를 등록한다.
     * @param accessIp
     */
    void insertAccessIp(AccessIp accessIp);

    /**
     * 접근IP 정보를 수정한다.
     * @param accessIp
     */
    void updateAccessIp(AccessIp accessIp);

    /**
     * 접근IP 정보를 삭제한다.
     * @param ipId
     */
    void deleteAccessIp(String ipId);

    /**
     * 접근IP 엑셀 정보를 조회한다.
     * @param paramMap
     * @return
     */
    List<XlsxAccessIp> selectAccessIpXlsx(Map<String, Object> paramMap);

    List<String> selectAllAccessIpList();
}
