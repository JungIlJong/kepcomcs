package com.daonplace.vasanta.domain.ntt.api;

import com.daonplace.vasanta.common.CommonResponse;
import com.daonplace.vasanta.core.security.util.UserDetailsUtil;
import com.daonplace.vasanta.domain.ntt.dto.SearchMberNtt;
import com.daonplace.vasanta.domain.ntt.service.NttQueryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/mber/bbs/{bbsId}")
public class NttQueryApi {
    private final NttQueryService nttQueryService;

    @GetMapping
    public ResponseEntity selectList(SearchMberNtt.Search req, @PathVariable Long bbsId) {
        req.setBbsId(bbsId);
        if (!Objects.equals(UserDetailsUtil.getMbrId(), "null")) {
            req.setFrstRgstId(Long.parseLong(UserDetailsUtil.getMbrId()));
        }
        return CommonResponse.success(nttQueryService.selectList(req));
    }

    @GetMapping("/detail")
    public ResponseEntity selectDetail(@RequestParam Long nttId) {
        return CommonResponse.success(nttQueryService.selectNonSecretDetail(nttId));
    }

    // 비회원의 비밀글 확인
    @PostMapping("/detail")
    public ResponseEntity selectDetail(@RequestParam Long nttId, @RequestBody SearchMberNtt.Password password) {
        return CommonResponse.success(nttQueryService.selectSecretDetail(nttId, password.getPassword()));
    }

    @GetMapping("/side")
    public ResponseEntity selectPreAndNext(@RequestParam Long nttId) {
        return CommonResponse.success(nttQueryService.selectPreAndNext(nttId));
    }
}
