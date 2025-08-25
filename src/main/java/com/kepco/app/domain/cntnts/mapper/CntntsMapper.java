package com.kepco.app.domain.cntnts.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.Map;

/**
 * 사용자가 콘텐츠를 사용하기 위한 Mapper 인터페이스
 *
 * @author 기업부설연구소 김선홍
 * @since 2024.03.30
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
@Mapper("cntntsMapper")
public interface CntntsMapper {

    /**
     * 콘텐츠 상세정보를 조회한다.
     *
     * @param id 콘텐츠 ID
     * @return 콘텐츠 상세정보
     */
    Map<String, Object> selectContentDetail(String id);
}
