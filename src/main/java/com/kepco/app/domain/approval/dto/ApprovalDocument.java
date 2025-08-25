package com.kepco.app.domain.approval.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@Alias("approvalDocument")
public class ApprovalDocument {
    private Long approvalDocumentId;

    private String approvalTitle;

    private String approvalContent;

    private String approvalStatus;

    private Long creatorId;

    private String approvalYn;

    private Long approvalMyLineId;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime createdAt;

    private List<ApprovalLine> approvalLines;

}
