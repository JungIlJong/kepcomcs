package com.kepco.app.domain.mbrOrg;

import lombok.Getter;

@Getter
public enum MBR_STTS_CD {

    PENDING("P", "신청상태"),
    APPROVED("A", "승인상태"),
    EXPIRED("E", "만료상태"),
    DROPPED("D", "탈퇴상태"),
    BLOCKED("B", "차단상태"),
    LOCKED("L", "잠금상태"),
    ;

    private final String sttsCd;

    private final String sttsExpln;

    MBR_STTS_CD(String sttsCd, String sttsExpln) {
        this.sttsCd = sttsCd;
        this.sttsExpln = sttsExpln;
    }

}
