package com.daonplace.vasanta.domain.sample.api;

import com.daonplace.vasanta.core.util.SearchUtil;
import com.daonplace.vasanta.domain.sample.dto.SampleSearchRequest;
import com.daonplace.vasanta.domain.sample.service.SampleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
