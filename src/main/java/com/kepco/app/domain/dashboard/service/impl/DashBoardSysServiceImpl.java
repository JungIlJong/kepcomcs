package com.kepco.app.domain.dashboard.service.impl;

import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.domain.dashboard.dto.*;
import com.kepco.app.domain.dashboard.mapper.DashBoardSysMapper;
import com.kepco.app.domain.dashboard.service.DashBoardSysService;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service("dashBoardSysService")
public class DashBoardSysServiceImpl extends EgovAbstractServiceImpl implements DashBoardSysService {

    private final DashBoardSysMapper dashBoardSysMapper;

    @Override
    public List<WeeklyVisitorItem> selectWeeklyVisitorsByDate(LocalDate date) {
        List<WeeklyVisitorItem> weeklyVisitorItems = new ArrayList<>();
        for(int i = 6; i >= 0; i--) {
            LocalDate pivot = LocalDate.now().minusDays(i);
            weeklyVisitorItems.add(dashBoardSysMapper.selectWeeklyVisitorsByDate(pivot.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))));
        }
        return weeklyVisitorItems;
    }

    @Override
    public List<UserRankingItem> selectUserRankingsByDate(LocalDate date) {
        return dashBoardSysMapper.selectUserRankingsByDate(date.format(DateTimeFormatter.ofPattern("yyyy-MM")));
    }

    @Override
    public List<BoardStatisticsItem> selectBoardStatisticsItemsByDate(LocalDate date) {
        List<BoardStatisticsItem> boardStatisticsItems = new ArrayList<>();
        List<Long> bbses = dashBoardSysMapper.selectTopBbs();
        for(int i = 6; i >= 0; i--) {
            LocalDate pivot = LocalDate.now().minusMonths(i);
            List<BoardStatisticsItem.BoardResultItem> boardResultItems = dashBoardSysMapper
                    .selectBoardStatisticsItemsByDate(pivot.format(DateTimeFormatter.ofPattern("yyyy-MM")), bbses);
            boardStatisticsItems.add(new BoardStatisticsItem(pivot.format(DateTimeFormatter.ofPattern("yyyy-MM")), boardResultItems));
        }
        return boardStatisticsItems;
    }

    @Override
    public List<ApprovalInputItem> selectApprovalDocumentsInputItems(String approverId) {
        return dashBoardSysMapper.selectApprovalDocumentsInputItems(approverId);
    }

    @Override
    public List<UserCountItem> selectUserCountByDate(LocalDate date) {
        List<UserCountItem> list = new ArrayList<>();
        for(int i = 6; i >= 0; i--) {
            LocalDate pivot = LocalDate.now().minusDays(i);
            list.add(dashBoardSysMapper.selectUserCountByDate(pivot.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))));
        }
        return list;
    }
}
