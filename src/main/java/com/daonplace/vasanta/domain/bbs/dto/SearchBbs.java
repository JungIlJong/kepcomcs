package com.daonplace.vasanta.domain.bbs.dto;

import com.daonplace.vasanta.core.vo.ComSearchVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;
import java.util.Map;

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
    private String permExtsn;
    private String authorList;
}
