package com.kepco.app.domain.popup.service;

import java.util.List;
import java.util.Map;

/**
 * 사용자가 팝업을 조회하기 위한 서비스 인터페이스
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
 *   2024.03.30  김선홍         최초 생성
 * </pre>
 */
public interface PopupService {

    /**
     * 게시 상태(Y)인 팝업 목록을 조회한다.
     *
     * @return 게시 상태(Y)인 팝업 목록
     */
    List<Map<String, Object>> selectActivePopupList();
}
