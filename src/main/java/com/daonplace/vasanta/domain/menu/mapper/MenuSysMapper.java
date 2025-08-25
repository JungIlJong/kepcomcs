package com.daonplace.vasanta.domain.menu.mapper;

import com.daonplace.vasanta.domain.menu.dto.Menu;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

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
