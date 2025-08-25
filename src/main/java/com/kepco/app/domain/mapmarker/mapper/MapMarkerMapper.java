package com.kepco.app.domain.mapmarker.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.mapmarker.dto.SearchMapMarkerRequest;
import com.kepco.app.domain.mapmarker.dto.SearchMapMarkerResponse;

import java.util.List;

@Mapper
public interface MapMarkerMapper {
    List<SearchMapMarkerResponse> selectAllOnlyUseY(SearchMapMarkerRequest searchMapMarkerRequest);
}
