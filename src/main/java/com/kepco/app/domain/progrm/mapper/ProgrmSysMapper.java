package com.kepco.app.domain.progrm.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.progrm.dto.Progrm;

import java.util.List;
import java.util.Map;

/**
 * 프로그램을 관리하기 위한 Mapper 인터페이스
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

@Mapper("progrmSysMapper")
public interface ProgrmSysMapper {

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
