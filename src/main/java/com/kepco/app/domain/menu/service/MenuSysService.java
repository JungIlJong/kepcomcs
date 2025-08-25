package com.kepco.app.domain.menu.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.menu.dto.Menu;

public interface MenuSysService {
    List<Menu> selectMenuList(String menuSe);

    void deleteMenu(Map<String, Object> paramMap);

    void insertMenu(Menu menu) throws Exception;

    void updateMenu(Menu menu);

    Menu selectMenuById(String menuId);

    List<Menu> selectMenuListAll(String menuSe);
}
