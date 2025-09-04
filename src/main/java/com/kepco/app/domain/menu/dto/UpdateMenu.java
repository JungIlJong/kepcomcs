package com.kepco.app.domain.menu.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateMenu {

    private Long menuId;

    private String id;

    private String menuNm;

    private String menuSj;

    private Long upperMenuId;

    private int menuOrdr;

    private String menuTy;

    private String url;

    private String gnbAt;

    private String useAt;

}
