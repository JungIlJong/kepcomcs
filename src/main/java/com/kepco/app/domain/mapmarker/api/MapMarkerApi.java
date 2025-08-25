package com.kepco.app.domain.mapmarker.api;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kepco.app.domain.mapmarker.dto.SearchMapMarkerRequest;
import com.kepco.app.domain.mapmarker.dto.SearchMapMarkerResponse;
import com.kepco.app.domain.mapmarker.mapper.MapMarkerMapper;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/mber/mapmarkers")
public class MapMarkerApi {
    private final MapMarkerMapper mapMarkerMapper;
    @GetMapping
    public ResponseEntity<List<SearchMapMarkerResponse>> selectAllOnlyUseY(SearchMapMarkerRequest searchMapMarkerRequest) {
        return ResponseEntity.ok(mapMarkerMapper.selectAllOnlyUseY(searchMapMarkerRequest));
    }
}
