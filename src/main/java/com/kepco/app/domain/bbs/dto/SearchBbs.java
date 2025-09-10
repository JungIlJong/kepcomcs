package com.kepco.app.domain.bbs.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;
import java.util.Map;

import com.kepco.app.core.vo.ComSearchVO;

@Getter
@Setter
@ToString
public class SearchBbs extends ComSearchVO {
    private Long bbsId;
    private int fileAtchSize;
    private int fileAtchCo;
    private String bbsNm;
    private String bbsTyCode;
    private String secretUseAt;
    private String answerAt;
    private String fileAt;
    private String cardAt;
    private String permExtsn;
    private String authorList;
}
