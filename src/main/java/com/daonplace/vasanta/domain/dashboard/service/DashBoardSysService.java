package com.daonplace.vasanta.domain.dashboard.service;

import com.daonplace.vasanta.domain.dashboard.dto.*;

import java.time.LocalDate;
import java.util.List;

/**
 * 관리자 대시보드를 관리하기 위한 서비스 인터페이스
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

public interface DashBoardSysService {
    List<WeeklyVisitorItem> selectWeeklyVisitorsByDate(LocalDate date);

    List<UserRankingItem> selectUserRankingsByDate(LocalDate date);

    List<BoardStatisticsItem> selectBoardStatisticsItemsByDate(LocalDate date);

    List<ApprovalInputItem> selectApprovalDocumentsInputItems(String approverId);

    List<UserCountItem> selectUserCountByDate(LocalDate date);
}
