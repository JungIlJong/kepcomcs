package com.kepco.app.domain.ntt.dto;

/**
 *  게시판 권한 코드
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
public enum BbsRole {
    LIST("LIST"), DETAIL("DETAIL"), SIDE("DETAIL"), SAVE("SAVE"), UPDATE("UPDATE"), ANSWER("ANSWER"), PASSWORD("DETAIL"), REPLY("DETAIL");

    String action;

    BbsRole(String action) {
        this.action = action;
    }

    public String getAction() {
        return action;
    }
}
