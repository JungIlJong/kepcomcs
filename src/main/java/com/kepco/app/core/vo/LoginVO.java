package com.kepco.app.core.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

@Getter
@Setter
@Alias(value = "loginVO")
public class LoginVO {

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

    private int lgnFailNmtm;

    private String frstRgtrId;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime frstRegDt;

    private String lastMdfrId;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime lastMdfcnDt;

    private String sttsCd;

    private String dvcPushToken;
}
