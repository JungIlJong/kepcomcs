package com.kepco.app.domain.mapmarker.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.mapmarker.dto.DetailMapMarkerResponse;
import com.kepco.app.domain.mapmarker.dto.MapMarker;
import com.kepco.app.domain.mapmarker.dto.SearchMapMarkerRequest;
import com.kepco.app.domain.mapmarker.dto.SearchMapMarkerResponse;

import java.util.List;

@Mapper
public interface MapMarkerSysMapper {
    void insertMapMarker(MapMarker mapMarker);

    List<SearchMapMarkerResponse> searchMapMarkerList(SearchMapMarkerRequest searchMapMarkerRequest);

    int searchMapMarkerTotCnt(SearchMapMarkerRequest searchMapMarkerRequest);

    DetailMapMarkerResponse detailMapMarker(Long markerId);

    MapMarker findById(Long markerId);

    void updateMapMarker(MapMarker mapMarker);

    void updateMapMarkerUseYn(Long markerId, String useYn);

    void deleteMapMarker(Long markerId);
}
