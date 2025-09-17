package com.kepco.app.domain.accesslog.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class AccessLog {

    private String acsrNm;

    private Long acsrId;

    private String acsrIpAddr;

    private String cntnSe;

    private String acsrOsNm;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime cntnDt;

}
