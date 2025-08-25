package com.kepco.app.domain.cntnts.service;

/**
 * 사용자가 콘텐츠을 조회하기 위한 서비스 인터페이스
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
 *   2024.03.30  김선홍         최초 생성
 * </pre>
 */
public interface CntntsService {
    /**
     * 콘텐츠를 조회한다.
     *
     * @param id 콘텐츠 ID
     * @return 콘텐츠
     */
    String view(String id);
}
