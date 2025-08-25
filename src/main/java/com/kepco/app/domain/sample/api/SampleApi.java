package com.kepco.app.domain.sample.api;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.domain.sample.dto.SampleSearchRequest;
import com.kepco.app.domain.sample.service.SampleService;

import javax.validation.Valid;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/samples")
public class SampleApi {
    private final SampleService sampleService;

    @GetMapping
    public ResponseEntity<?> List(@Valid SampleSearchRequest sampleSearchRequest) {
        return ResponseEntity.ok(SearchUtil.search(sampleSearchRequest, sampleService));
    }
}
