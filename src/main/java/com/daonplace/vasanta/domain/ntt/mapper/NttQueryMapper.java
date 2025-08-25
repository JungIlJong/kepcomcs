package com.daonplace.vasanta.domain.ntt.mapper;

import com.daonplace.vasanta.domain.ntt.dto.SearchMberNtt;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface NttQueryMapper {
    List<SearchMberNtt.NttInfo> selectList(SearchMberNtt.Search req);
    int selectTotCnt(SearchMberNtt.Search req);
    SearchMberNtt.NttDetail selectDetail(@Param("nttId") Long nttId,@Param("mbrId") String mbrId);
    SearchMberNtt.PreNext selectPreAndNext(Long nttId, Long frstRgstId);
    void updateViewCount(Long nttId);
}
