package com.kepco.app.domain.mbr.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.kepco.app.domain.authrt.dto.Authrt;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@Alias("mbr")
public class Mbr {

    private Long mbrId;

    private String uuid;

    private String id;

    private String pswd;

    private String mbrNm;

    private String emlAddr;

    private String mblTelno;

    private String fxno;

    private String zip;

    private String addr;

    private String daddr;

    private String lgnLckYn;

    private String lgnFailNmtm;

    private String frstRgtrId;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime frstRegDt;

    private String lastMdfrId;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime lastMdfcnDt;

    private String sttsCd;

    private List<Authrt> authrtList;

    private String dvcPushToken;

    private String reportIds;

    private String blockIds;
}
