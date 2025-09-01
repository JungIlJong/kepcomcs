package com.kepco.app.domain.ntt.mapper;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.ntt.dto.SearchMberNtt;
import com.kepco.app.domain.ntt.dto.SearchMberNtt.NttDetail;

import java.util.List;
import java.util.Map;

@Mapper
public interface NttQueryMapper {
    List<SearchMberNtt.NttInfo> selectList(SearchMberNtt.Search req);
    int selectTotCnt(SearchMberNtt.Search req);
    NttDetail selectDetail(@Param("nttId") Long nttId);
    List<SearchMberNtt.PreNext> selectPreAndNext(Long nttId, Long bbsId);
    void updateViewCount(Long nttId);
}
