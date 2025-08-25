package com.daonplace.vasanta.domain.mapmarker.mapper;

import com.daonplace.vasanta.domain.mapmarker.dto.SearchMapMarkerRequest;
import com.daonplace.vasanta.domain.mapmarker.dto.SearchMapMarkerResponse;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface MapMarkerMapper {
    List<SearchMapMarkerResponse> selectAllOnlyUseY(SearchMapMarkerRequest searchMapMarkerRequest);
}
