package com.daonplace.vasanta.domain.notification.dto;

import com.daonplace.vasanta.domain.authrt.dto.Authrt;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@Alias("notification")
public class Notification {

    private Long ntfId;

    private String ntfTitle;

    private String ntfContent;

    private String ntfRedirectUrl;

    private Long ntfTargetId;

    private String ntfReadYn;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private String ntfRegistDt;

}
