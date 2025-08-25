package com.kepco.app.domain.notification.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.kepco.app.domain.authrt.dto.Authrt;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
public class InsertNotification {

    private Long ntfId;

    private String ntfTitle;

    private String ntfContent;

    private String ntfRedirectUrl;

    private Long ntfTargetId;

    private String ntfReadYn;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private String ntfRegistDt;
}
