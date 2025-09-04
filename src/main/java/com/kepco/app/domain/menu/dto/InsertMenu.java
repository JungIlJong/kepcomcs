package com.kepco.app.domain.menu.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class InsertMenu {

    private String id;

    @NotBlank
    private String menuNm;

    private String menuSj;

    private Long upperMenuId;

    private int menuOrdr;

    private int menuDp;

    private String url;

    private String gnbAt;

    private String useAt;

    private String menuTy;

}
