package com.kepco.app.domain.menu.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Alias(value = "menu")
public class Menu {

    private Long menuId;

    private String id;

    private String menuNm;

    private Long upperMenuId;

    private int menuOrdr;

    private String menuTy;

    private int menuDp;

    private String url;

    private String cntcId;

    private String gnbAt;

    private String useAt;

    private List<String> roleList;

    private String menuSe;

    private String firstMatchUrl;

    private List<Menu> childList = new ArrayList<>();

    public String getFirstMatchUrl() {
        for (Menu childMenu : childList) {
            if (childMenu.getMenuTy().equals("DIR")) {
                return childMenu.getFirstMatchUrl();
            } else {
                return childMenu.getUrl();
            }
        }

        return "";
    }

}
