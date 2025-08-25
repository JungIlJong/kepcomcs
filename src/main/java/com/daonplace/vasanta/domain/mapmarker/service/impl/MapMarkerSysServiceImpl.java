package com.daonplace.vasanta.domain.mapmarker.service.impl;

import com.daonplace.vasanta.core.service.ComSearchService;
import com.daonplace.vasanta.core.vo.ComSearchVO;
import com.daonplace.vasanta.domain.mapmarker.dto.*;
import com.daonplace.vasanta.domain.mapmarker.mapper.MapMarkerSysMapper;
import com.daonplace.vasanta.domain.mapmarker.service.MapMarkerSysService;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

@RequiredArgsConstructor
@Service
public class MapMarkerSysServiceImpl extends EgovAbstractServiceImpl implements MapMarkerSysService {
    private final MapMarkerSysMapper mapMarkerSysMapper;

    @Override
    @Transactional
    public void insertMapMarker(InsertMapMarker insertMapMarker) {
        mapMarkerSysMapper.insertMapMarker(MapMarker.builder()
                .name(insertMapMarker.getName())
                .description(insertMapMarker.getDescription())
                .latitude(insertMapMarker.getLatitude())
                .longitude(insertMapMarker.getLongitude())
                .iconUrl(insertMapMarker.getIconUrl())
                .roadAddress(insertMapMarker.getRoadAddress())
                .jibunAddress(insertMapMarker.getJibunAddress())
                .detailAddress(insertMapMarker.getDetailAddress())
                .categoryCode1(insertMapMarker.getCategoryCode1())
                .categoryCode2(insertMapMarker.getCategoryCode2())
                .useYn(insertMapMarker.getUseYn())
                .build());
    }

    @Override
    @Transactional
    public void updateMapMarker(Long markerId, UpdateMapMarkerRequest updateMapMarkerRequest) {
        // 마커 조회
        MapMarker mapMarker = mapMarkerSysMapper.findById(markerId);
        
        // 조회된 마커가 없을 경우 예외 처리
        if (mapMarker == null) {
            throw new IllegalArgumentException("존재하지 않는 마커입니다. ID: " + markerId);
        }
        
        // 마커 정보 업데이트
        mapMarker.update(updateMapMarkerRequest);
        
        // 데이터베이스 업데이트
        mapMarkerSysMapper.updateMapMarker(mapMarker);
    }

    @Override
    @Transactional
    public void updateMapMarkerUseYn(Long markerId, String useYn) {
        mapMarkerSysMapper.updateMapMarkerUseYn(markerId, useYn);
    }

    @Override
    @Transactional
    public void deleteMapMarker(Long markerId) {
        mapMarkerSysMapper.deleteMapMarker(markerId);
    }


    @Override
    public DetailMapMarkerResponse detailMapMarker(Long markerId) {
        return mapMarkerSysMapper.detailMapMarker(markerId);
    }

    @Override
    public List<?> searchList(ComSearchVO comSearchVO) {
        return mapMarkerSysMapper.searchMapMarkerList((SearchMapMarkerRequest) comSearchVO);
    }

    @Override
    public int searchTotCnt(ComSearchVO comSearchVO) {
        return mapMarkerSysMapper.searchMapMarkerTotCnt((SearchMapMarkerRequest) comSearchVO);
    }
}
