package com.daonplace.vasanta.core.service;

import com.daonplace.vasanta.core.vo.ComSearchVO;
import com.daonplace.vasanta.core.vo.ListResponseVO;

import java.util.List;

public interface ComSearchService {
    List<?> searchList(ComSearchVO comSearchVO);

    int searchTotCnt(ComSearchVO comSearchVO);
}
