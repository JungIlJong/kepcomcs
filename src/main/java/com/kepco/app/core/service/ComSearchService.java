package com.kepco.app.core.service;

import java.util.List;

import com.kepco.app.core.vo.ComSearchVO;
import com.kepco.app.core.vo.ListResponseVO;

public interface ComSearchService {
    List<?> searchList(ComSearchVO comSearchVO);

    int searchTotCnt(ComSearchVO comSearchVO);
}
