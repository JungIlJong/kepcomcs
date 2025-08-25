package com.daonplace.vasanta.domain.mapmarker.mapper;

import com.daonplace.vasanta.domain.mapmarker.dto.DetailMapMarkerResponse;
import com.daonplace.vasanta.domain.mapmarker.dto.MapMarker;
import com.daonplace.vasanta.domain.mapmarker.dto.SearchMapMarkerRequest;
import com.daonplace.vasanta.domain.mapmarker.dto.SearchMapMarkerResponse;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

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
