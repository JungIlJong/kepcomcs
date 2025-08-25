package com.kepco.app.domain.progrm.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.progrm.dto.Progrm;

/**
 * 프로그램을 관리하기 위한 서비스 인터페이스
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

public interface ProgrmSysService {

    /**
     * 프로그램 목록 정보를 조회한다.
     * @param searchMap
     * @return
     */
    List<Progrm> selectProgrmList(Map<String, Object> searchMap);

    /**
     * 프로그램 총 갯수를 조회한다.
     * @param searchMap
     * @return
     */
    int selectProgrmListTotCnt(Map<String, Object> searchMap);

    /**
     * 프로그램 상세 정보를 조회한다.
     * @param progrmId
     * @return
     */
    Progrm selectProgrmDetail(String progrmId);

    /**
     * 프로그램 정보를 등록한다.
     * @param progrm
     * @throws Exception
     */
    void insertProgrm(Progrm progrm);

    /**
     * 프로그램 정보를 수정한다.
     * @param progrm
     */
    void updateProgrm(Progrm progrm);

    /**
     * 프로그램 정보를 삭제한다.
     * @param progrmId
     */
    void deleteProgrm(String progrmId);

}
