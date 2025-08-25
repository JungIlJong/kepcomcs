package com.daonplace.vasanta.domain.mapmarker.api;

import com.daonplace.vasanta.domain.mapmarker.dto.SearchMapMarkerRequest;
import com.daonplace.vasanta.domain.mapmarker.dto.SearchMapMarkerResponse;
import com.daonplace.vasanta.domain.mapmarker.mapper.MapMarkerMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
