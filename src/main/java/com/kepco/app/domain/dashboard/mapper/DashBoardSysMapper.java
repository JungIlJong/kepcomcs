package com.kepco.app.domain.dashboard.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.dashboard.dto.*;

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
