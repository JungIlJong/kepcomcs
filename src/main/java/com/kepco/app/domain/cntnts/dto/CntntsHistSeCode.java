package com.kepco.app.domain.cntnts.dto;

/**
 * 콘텐츠 이력 코드
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
 *   2024.03.28  김선홍         최초 생성
 * </pre>
 */
public enum CntntsHistSeCode {
    SAVE("SAVE"), UPDATE("UPDATE"), DELETE("DELETE");
    private final String action;

    CntntsHistSeCode(String action) {
        this.action = action;
    }

    public String getAction() {
        return this.action;
    }
}
