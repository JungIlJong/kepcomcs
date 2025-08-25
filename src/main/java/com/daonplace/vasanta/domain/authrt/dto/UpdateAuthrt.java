package com.daonplace.vasanta.domain.authrt.dto;

import com.daonplace.vasanta.domain.menu.dto.Menu;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class UpdateAuthrt {

    private Long authrtId;

    private String authrtCd;

    private String authrtNm;

    private String authrtExpln;

    private List<Menu> menuList;

}
