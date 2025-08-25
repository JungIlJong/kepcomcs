package com.daonplace.vasanta.domain.banner.api;

import com.daonplace.vasanta.domain.banner.service.BannerService;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.Banner;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "배너", description = "배너 API")
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/banners")
public class BannerApi {
    private final BannerService bannerService;

    @ApiResponse(responseCode = "200", content = @Content(schema = @Schema(implementation = Banner.class)))
    @GetMapping
    public ResponseEntity index() {
        return ResponseEntity.ok(bannerService.selectBannerListMain());
    }
}

