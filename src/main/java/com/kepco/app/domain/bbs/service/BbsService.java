package com.kepco.app.domain.bbs.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.bbs.dto.SearchBbs;


/**
 * 사용자가 게시판을 조회하기 위한 서비스 인터페이스
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
public interface BbsService {

    /**
     * 게시판의 상세정보를 조회한다.
     *
     * @param bbsId 게시글 ID
     * @return 게시글 상세정보
     */
    SearchBbs selectBbsDetail(Long bbsId);
}
