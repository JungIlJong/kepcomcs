package com.kepco.app.domain.mapmarker.service;

import java.util.List;

import com.kepco.app.core.service.ComSearchService;
import com.kepco.app.domain.mapmarker.dto.*;

public interface MapMarkerSysService extends ComSearchService {
    void insertMapMarker(InsertMapMarker insertMapMarker);
    void updateMapMarker(Long markerId, UpdateMapMarkerRequest updateMapMarkerRequest);
    void updateMapMarkerUseYn(Long markerId, String useYn);

    void deleteMapMarker(Long markerId);
//    List<SearchMapMarkerResponse> searchMapMarkerList(SearchMapMarkerRequest searchMapMarkerRequest);
//    int searchMapMarkerTotCnt(SearchMapMarkerRequest searchMapMarkerRequest);
    DetailMapMarkerResponse detailMapMarker(Long markerId);
}
