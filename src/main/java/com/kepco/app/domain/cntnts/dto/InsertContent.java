package com.kepco.app.domain.cntnts.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@ToString
@Getter
@Setter
public class InsertContent {

    /**
     * 콘텐츠명
     */
    @NotBlank(message = "{content.cntntsNm.notblank}")
    @Size(min = 1, max = 100, message = "{content.cntntsNm.size}")
    private String cntntsNm;

    /**
     * 콘텐츠 내용
     */
    @NotBlank(message = "{content.cntntsCn.notblank}")
    private String cntntsCn;

    /**
     * 콘텐츠 설명
     */
    @Size(min = 0, max = 250, message = "{content.cntntsDc.size}")
    private String cntntsDc;
}
