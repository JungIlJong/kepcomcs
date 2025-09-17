package com.kepco.app.domain.popup.api;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.util.CookieUtil;
import com.kepco.app.domain.popup.service.PopupService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/mber/popups")
public class PopupMberApi {

    private final PopupService popupService;
    private final String cookieName = "hidePopup";

    public PopupMberApi(PopupService popupService) {
        this.popupService = popupService;
    }

    /**
     * 게시 중인 팝업 목록을 조회한다.
     *
     * @return 게시 상태(Y)인 팝업 목록
     */
    @GetMapping("/active-list")
    public ResponseEntity getActivePopupList(HttpServletRequest request) throws UnsupportedEncodingException {
        return CommonResponse.success(popupService.selectActivePopupList());
    }

    @GetMapping("/stop")
    public ResponseEntity hidePopupToday(HttpServletResponse response) throws UnsupportedEncodingException {
        // 현재 시간
        LocalDateTime currentTime = LocalDateTime.now();

        // 다음날 자정 시간
        LocalDateTime midnight = currentTime.toLocalDate().plusDays(1).atStartOfDay();

        // 남은 시간 계산
        Duration duration = Duration.between(currentTime, midnight);
        long secondsUntilMidnight = duration.getSeconds();

        response.addCookie(CookieUtil.createCookie(cookieName, "Y", (int) secondsUntilMidnight, false));
        return CommonResponse.empty();
    }
}
