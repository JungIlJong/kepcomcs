package com.kepco.app.domain.mapmarker.api;

import lombok.RequiredArgsConstructor;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.kepco.app.core.service.ComSearchService;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.domain.mapmarker.dto.InsertMapMarker;
import com.kepco.app.domain.mapmarker.dto.SearchMapMarkerRequest;
import com.kepco.app.domain.mapmarker.dto.UpdateMapMarkerRequest;
import com.kepco.app.domain.mapmarker.service.MapMarkerSysService;

import javax.validation.Valid;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/sys/mapmarkers")
public class MapMarkerSysApi {
    private final MapMarkerSysService mapMarkerSysService;

    @GetMapping
    public ResponseEntity<?> search(SearchMapMarkerRequest searchMapMarkerRequest) {
        return ResponseEntity.ok(SearchUtil.search(searchMapMarkerRequest, mapMarkerSysService));
    }

    @GetMapping("/{markerId}")
    public ResponseEntity<?> select(@PathVariable("markerId") Long markerId) {
        return ResponseEntity.ok(mapMarkerSysService.detailMapMarker(markerId));
    }

    @PostMapping
    public ResponseEntity<?> insert(@RequestBody @Valid InsertMapMarker insertMapMarker) {
        mapMarkerSysService.insertMapMarker(insertMapMarker);
        return ResponseEntity.ok(Collections.EMPTY_LIST);
    }

    @PostMapping("/{markerId}")
    public ResponseEntity<?> update(@PathVariable("markerId") Long markerId, @RequestBody @Valid UpdateMapMarkerRequest updateMapMarkerRequest) {
        mapMarkerSysService.updateMapMarker(markerId, updateMapMarkerRequest);
        return ResponseEntity.ok(Collections.EMPTY_LIST);
    }

    @PostMapping("/delete/{markerId}")
    public ResponseEntity<?> delete(@PathVariable("markerId") Long markerId) {
        mapMarkerSysService.deleteMapMarker(markerId);
        return ResponseEntity.ok(Collections.EMPTY_LIST);
    }

    @PostMapping("/useYn/{markerId}")
    public ResponseEntity<?> updateUseYn(@PathVariable("markerId") Long markerId, @RequestBody UpdateMapMarkerRequest updateMapMarkerRequest) {
        mapMarkerSysService.updateMapMarkerUseYn(markerId, updateMapMarkerRequest.getUseYn());
        return ResponseEntity.ok(Collections.EMPTY_LIST);
    }
}
