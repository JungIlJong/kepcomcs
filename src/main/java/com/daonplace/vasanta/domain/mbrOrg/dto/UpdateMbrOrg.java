package com.daonplace.vasanta.domain.mbrOrg.dto;

import com.daonplace.vasanta.domain.authrt.dto.Authrt;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class UpdateMbrOrg {

    private String uuid;

    private Long mbrId;

    private String id;

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

    private Long upperOrgId;

    private int orgOrdr;
}
