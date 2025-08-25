package com.daonplace.vasanta.domain.mapmarker.service;

import com.daonplace.vasanta.core.service.ComSearchService;
import com.daonplace.vasanta.domain.mapmarker.dto.*;

import java.util.List;

public interface MapMarkerSysService extends ComSearchService {
    void insertMapMarker(InsertMapMarker insertMapMarker);
    void updateMapMarker(Long markerId, UpdateMapMarkerRequest updateMapMarkerRequest);
    void updateMapMarkerUseYn(Long markerId, String useYn);

    void deleteMapMarker(Long markerId);
//    List<SearchMapMarkerResponse> searchMapMarkerList(SearchMapMarkerRequest searchMapMarkerRequest);
//    int searchMapMarkerTotCnt(SearchMapMarkerRequest searchMapMarkerRequest);
    DetailMapMarkerResponse detailMapMarker(Long markerId);
}
