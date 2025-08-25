package com.kepco.app.domain.mbr;

import com.kepco.app.common.CommonErrorCode;

import lombok.Getter;

@Getter
public enum mbrSttsCd {

    PENDING("P", "신청상태", CommonErrorCode.PENDING),
    APPROVED("A", "승인상태", null),
    EXPIRED("E", "만료상태", CommonErrorCode.EXPIRED),
    DROPPED("D", "탈퇴상태", CommonErrorCode.DROPPED),
    BLOCKED("B", "차단상태", CommonErrorCode.BLOCKED),
    LOCKED("L", "잠금상태", CommonErrorCode.LOCKED),
    ;

    private final String sttsCd;

    private final String sttsExpln;

    private final CommonErrorCode errorCode;

    mbrSttsCd(String sttsCd, String sttsExpln, CommonErrorCode errorCode) {
        this.sttsCd = sttsCd;
        this.sttsExpln = sttsExpln;
        this.errorCode = errorCode;
    }

}
