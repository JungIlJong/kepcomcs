package com.kepco.app.domain.dashboard.api;

import lombok.extern.slf4j.Slf4j;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.dashboard.dto.*;
import com.kepco.app.domain.dashboard.service.DashBoardSysService;

import java.time.LocalDate;
import java.util.List;

/**
 * 관리자 대시보드를 관리하기 위한 API 클래스
 * @author 기업부설연구소 박규영
 * @since 2024.03.28
 * @
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2024.03.28  박규영         최초 생성
 * </pre>
 */

@Slf4j
@RestController
@RequestMapping("/api/sys/dashBoard")
public class DashBoardSysApi {

    private final DashBoardSysService dashBoardSysService;

    public DashBoardSysApi(DashBoardSysService dashBoardSysService) {
        this.dashBoardSysService = dashBoardSysService;
    }

    @GetMapping("/visitors/weekly")
    public ResponseEntity<List<WeeklyVisitorItem>> getWeeklyVisitorsByDate(@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date) {
        return ResponseEntity.ok(dashBoardSysService.selectWeeklyVisitorsByDate(date));
    }

    @GetMapping("/users/ranking")
    public ResponseEntity<List<UserRankingItem>> getUserRankingsByDate(@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date) {
        return ResponseEntity.ok(dashBoardSysService.selectUserRankingsByDate(date));
    }

    @GetMapping("/users/count")
    public ResponseEntity<List<UserCountItem>> getUserCountByDate(@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date) {
        return ResponseEntity.ok(dashBoardSysService.selectUserCountByDate(date));
    }

    @GetMapping("/boards/statistics")
    public ResponseEntity<List<BoardStatisticsItem>> getBoardStatisticsByDate(@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date) {
        return ResponseEntity.ok(dashBoardSysService.selectBoardStatisticsItemsByDate(date));
    }

    @GetMapping("/approval-documents/inbox")
    public ResponseEntity<List<ApprovalInputItem>> getApprovalInputItems() {
        return ResponseEntity.ok(dashBoardSysService.selectApprovalDocumentsInputItems(UserDetailsUtil.getMbrId()));
    }
}
