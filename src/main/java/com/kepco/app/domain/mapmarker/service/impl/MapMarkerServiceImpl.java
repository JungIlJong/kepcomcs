package com.kepco.app.domain.mapmarker.service.impl;

import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.domain.mapmarker.dto.SearchMapMarkerRequest;
import com.kepco.app.domain.mapmarker.dto.SearchMapMarkerResponse;
import com.kepco.app.domain.mapmarker.mapper.MapMarkerMapper;
import com.kepco.app.domain.mapmarker.service.MapMarkerService;

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
