package com.kepco.app.domain.ntt.dto;

import lombok.Getter;

/**
 *  게시판 타입 코드
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
@Getter
public enum BbsTyCode {
    BBS_DEFAULT("BBS_DEFAULT",  "mber/bbs/list/default"),
    BBS_ALBUM("BBS_ALBUM", "mber/bbs/list/album"),
    BBS_QNA("BBS_QNA", "mber/bbs/list/qna");
    private final String code;
    private final String list;

    BbsTyCode(String code, String list) {
        this.code = code;
        this.list = list;
    }

    public static BbsTyCode selectCode(Object c) {
        String code = (String) c;
        for (BbsTyCode bbsTyCode : BbsTyCode.values()) {
            if (bbsTyCode.getCode().equals(code)) {
                return bbsTyCode;
            }
        }
        throw new IllegalArgumentException("Invalid BbsTyCode: " + code);
    }
}
