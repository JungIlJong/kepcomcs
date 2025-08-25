package com.kepco.app.domain.mapmarker.service;

import java.util.List;

import com.kepco.app.domain.mapmarker.dto.DetailMapMarkerResponse;
import com.kepco.app.domain.mapmarker.dto.SearchMapMarkerRequest;
import com.kepco.app.domain.mapmarker.dto.SearchMapMarkerResponse;

public interface MapMarkerService {
    List<SearchMapMarkerResponse> selectAllOnlyUseY(SearchMapMarkerRequest searchMapMarkerRequest);
}
