package com.daonplace.vasanta.domain.mapmarker.service;

import com.daonplace.vasanta.domain.mapmarker.dto.DetailMapMarkerResponse;
import com.daonplace.vasanta.domain.mapmarker.dto.SearchMapMarkerRequest;
import com.daonplace.vasanta.domain.mapmarker.dto.SearchMapMarkerResponse;

import java.util.List;

public interface MapMarkerService {
    List<SearchMapMarkerResponse> selectAllOnlyUseY(SearchMapMarkerRequest searchMapMarkerRequest);
}
