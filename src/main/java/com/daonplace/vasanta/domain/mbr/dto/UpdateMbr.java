package com.daonplace.vasanta.domain.mbr.dto;

import com.daonplace.vasanta.domain.authrt.dto.Authrt;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class UpdateMbr {

    private String uuid;

    private String pswd;

    private String mbrNm;

    private String emlAddr;

    private String mblTelno;

    private String fxno;

    private String zip;

    private String addr;

    private String daddr;

    private String sttsCd;

    private List<Authrt> authrtList;

    private String dvcPushToken;
}
