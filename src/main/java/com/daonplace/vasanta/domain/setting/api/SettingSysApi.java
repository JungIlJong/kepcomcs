package com.daonplace.vasanta.domain.setting.api;

import com.daonplace.vasanta.domain.setting.dto.VstSetting;
import com.daonplace.vasanta.domain.setting.service.SettingSysService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
