package com.daonplace.vasanta.core.vo;

import lombok.Getter;
import lombok.Setter;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import java.util.List;

@Getter
@Setter
public class ListResponseVO {
    private List<? extends Object> data;
    private PaginationInfo paginationInfo;
}
