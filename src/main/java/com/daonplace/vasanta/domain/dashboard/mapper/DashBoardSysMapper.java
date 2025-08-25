package com.daonplace.vasanta.domain.dashboard.mapper;

import com.daonplace.vasanta.domain.dashboard.dto.*;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper("dashBoardSysMapper")
public interface DashBoardSysMapper {
    WeeklyVisitorItem selectWeeklyVisitorsByDate(String date);

    List<UserRankingItem> selectUserRankingsByDate(String date);

    List<Long> selectTopBbs();

    List<BoardStatisticsItem.BoardResultItem> selectBoardStatisticsItemsByDate(String date, List<Long> bbses);

    List<ApprovalInputItem> selectApprovalDocumentsInputItems(String approverId);

    UserCountItem selectUserCountByDate(String date);
}
