package com.kepco.app.domain.cntnts.service;

import java.util.List;
import java.util.Map;

/**
 * 관리자가 콘텐츠 이력을 조회하기 위한 서비스 인터페이스
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
public interface CntntsHistSysService {

    /**
     * 콘텐츠 이력 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 콘텐츠 목록
     */
    List<Map<String, Object>> selectCntntsHistList(Map<String, Object> paramMap);

    /**
     * 콘텐츠 이력 총 갯수를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 콘텐츠 목록
     */
    int selectCntntsHistTotCnt(Map<String, Object> paramMap);
}
