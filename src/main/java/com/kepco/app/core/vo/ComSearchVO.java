package com.kepco.app.core.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Getter
@Setter
@ToString
public class ComSearchVO implements Serializable {

    /**
     * 검색조건
     */
    @Size(max = 255)
    private String searchCondition = "";

    /**
     * 검색키워드
     */
    @Size(max = 255)
    private String searchKeyword = "";

    /**
     * 검색사용여부
     */
    private String searchUseYn = "";

    /**
     * 현재페이지
     */
    @Min(1)
    private int pageIndex = 1;

    /**
     * 페이지개수
     */
    private int pageUnit = 10;

    /**
     * 페이지사이즈
     */
    private int pageSize = 10;

    /**
     * firstIndex
     */
    private int firstIndex = 1;

    /**
     * lastIndex
     */
    private int lastIndex = 1;

    /**
     * recordCountPerPage
     */
    private int recordCountPerPage = 10;

    /**
     * 시작일자
     */
    private String stDt;

    /**
     * 종료일자
     */
    private String endDt;

}
