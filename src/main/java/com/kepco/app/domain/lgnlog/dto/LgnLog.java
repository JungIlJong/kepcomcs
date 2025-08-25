package com.kepco.app.domain.lgnlog.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class LgnLog {

    private String acsrNm;

    private Long acsrId;

    private String acsrIpAddr;

    private String cntnSe;

    private String acsrOsNm;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime cntnDt;

}
