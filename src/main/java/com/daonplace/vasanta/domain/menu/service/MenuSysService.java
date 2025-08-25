package com.daonplace.vasanta.domain.menu.service;

import com.daonplace.vasanta.domain.menu.dto.Menu;

import java.util.List;
import java.util.Map;

public interface MenuSysService {
    List<Menu> selectMenuList(String menuSe);

    void deleteMenu(Map<String, Object> paramMap);

    void insertMenu(Menu menu) throws Exception;

    void updateMenu(Menu menu);

    Menu selectMenuById(String menuId);

    List<Menu> selectMenuListAll(String menuSe);
}
