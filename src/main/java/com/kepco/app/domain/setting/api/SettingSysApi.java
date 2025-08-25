package com.kepco.app.domain.setting.api;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.kepco.app.domain.setting.dto.VstSetting;
import com.kepco.app.domain.setting.service.SettingSysService;

import java.util.Collections;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/sys/settings")
public class SettingSysApi {

    private final SettingSysService settingSysService;

    @PostMapping
    public ResponseEntity<?> insert(@RequestBody List<VstSetting> list) {
        settingSysService.insert(list);
        return ResponseEntity.ok(Collections.EMPTY_LIST);
    }
}
