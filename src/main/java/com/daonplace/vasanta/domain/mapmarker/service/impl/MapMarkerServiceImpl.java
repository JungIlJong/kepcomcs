package com.daonplace.vasanta.domain.mapmarker.service.impl;

import com.daonplace.vasanta.domain.mapmarker.dto.SearchMapMarkerRequest;
import com.daonplace.vasanta.domain.mapmarker.dto.SearchMapMarkerResponse;
import com.daonplace.vasanta.domain.mapmarker.mapper.MapMarkerMapper;
import com.daonplace.vasanta.domain.mapmarker.service.MapMarkerService;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@RequiredArgsConstructor
@Service
public class MapMarkerServiceImpl extends EgovAbstractServiceImpl implements MapMarkerService {
    private final MapMarkerMapper mapMarkerMapper;

    @Override
    public List<SearchMapMarkerResponse> selectAllOnlyUseY(SearchMapMarkerRequest searchMapMarkerRequest) {
        return mapMarkerMapper.selectAllOnlyUseY(searchMapMarkerRequest);
    }
}
