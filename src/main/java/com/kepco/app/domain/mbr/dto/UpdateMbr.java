package com.kepco.app.domain.mbr.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

import com.kepco.app.domain.authrt.dto.Authrt;

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
