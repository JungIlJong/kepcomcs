package com.kepco.app.domain.dashboard.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@AllArgsConstructor
@Getter
public class BoardStatisticsItem {
    private String date;
    private List<BoardResultItem> boardResultItems;

    @Getter
    public static class BoardResultItem {
        private Long postCount;
        private String bbsId;
        private String bbsNm;
    }
}
