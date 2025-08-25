package com.daonplace.vasanta.domain.push.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

@Getter
@Setter
@Alias("pushLog")
public class PushLog {

    private Long pushLogId;

    private String messageTitle;

    private String messageBody;

    private String tokens;

    private Long sender;

    private int sentCount;

    private int successCount;

    private int failedCount;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime sentAt;

}
