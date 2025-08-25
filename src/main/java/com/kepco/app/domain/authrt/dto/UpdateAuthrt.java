package com.kepco.app.domain.authrt.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

import com.kepco.app.domain.menu.dto.Menu;

@Getter
@Setter
public class UpdateAuthrt {

    private Long authrtId;

    private String authrtCd;

    private String authrtNm;

    private String authrtExpln;

    private List<Menu> menuList;

}
