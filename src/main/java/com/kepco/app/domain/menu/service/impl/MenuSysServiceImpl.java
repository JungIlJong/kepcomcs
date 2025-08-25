package com.kepco.app.domain.menu.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.domain.menu.dto.Menu;
import com.kepco.app.domain.menu.mapper.MenuSysMapper;
import com.kepco.app.domain.menu.service.MenuSysService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Slf4j
@Service("menuSysService")
public class MenuSysServiceImpl extends EgovAbstractServiceImpl implements MenuSysService {

    private final MenuSysMapper menuSysMapper;

    public MenuSysServiceImpl(MenuSysMapper menuSysMapper) {
        this.menuSysMapper = menuSysMapper;
    }

    @Override
    public List<Menu> selectMenuList(String menuSe) {
        return menuSysMapper.selectMenuList(menuSe);
    }

    @Override
    public void insertMenu(Menu menu) throws Exception {
        int menuOrdr = menuSysMapper.selectNextMenuOrdrByUpperMenuId(menu.getUpperMenuId());
        menu.setMenuOrdr(menuOrdr);
        menuSysMapper.insertMenu(menu);
    }

    @Override
    public void updateMenu(Menu menu) {
        menuSysMapper.updateMenu(menu);
    }

    @Override
    public Menu selectMenuById(String menuId) {
        return menuSysMapper.selectMenuById(menuId);
    }

    @Override
    public List<Menu> selectMenuListAll(String menuSe) {
        return menuSysMapper.selectMenuListAll(menuSe);
    }

    @Override
    @Transactional
    public void deleteMenu(Map<String, Object> paramMap) {
        String menuId = (String) paramMap.get("menuId");
        menuSysMapper.deleteMenu(Long.parseLong(menuId));
        if (paramMap.get("childrenList") != null) {
            List<String> childrenList = (ArrayList<String>) paramMap.get("childrenList");
            for (String childern : childrenList) {
                menuSysMapper.deleteMenu(Long.parseLong(childern));
            }
        }
    }
}
