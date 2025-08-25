package com.kepco.app.domain.menu.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.menu.dto.Menu;

import java.util.List;

@Mapper("menuSysMapper")
public interface MenuSysMapper {
    List<Menu> selectMenuList(String menuSe);

    void deleteMenu(Long menuId);

    void insertMenu(Menu menu);

    void updateMenu(Menu menu);

    int selectNextMenuOrdrByUpperMenuId(Long upperMenuId);

    Menu selectMenuById(String menuId);

    List<Menu> selectMenuListByRole(List<String> authorityList);

    List<Menu> selectMenuListAll(String menuSe);
}
