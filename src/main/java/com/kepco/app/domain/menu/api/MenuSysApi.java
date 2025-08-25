package com.kepco.app.domain.menu.api;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kepco.app.common.CommonResponse;
import com.kepco.app.domain.menu.dto.InsertMenu;
import com.kepco.app.domain.menu.dto.Menu;
import com.kepco.app.domain.menu.dto.UpdateMenu;
import com.kepco.app.domain.menu.service.MenuSysService;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@RequestMapping("/api/sys/**/{menuSe}menu")
@RestController
public class MenuSysApi {

    private final MenuSysService menuSysService;

    private final ModelMapper modelMapper;

    private static final String MBER = "mber";

    private static final String MNGR = "mngr";

    public MenuSysApi(MenuSysService menuSysService, ModelMapper modelMapper) {
        this.menuSysService = menuSysService;
        this.modelMapper = modelMapper;
    }

    @GetMapping("/list")
    public ResponseEntity sysMenuList(@PathVariable("menuSe") String menuSe) {
        List<Menu> menuList = menuSysService.selectMenuListAll(convertMenuSe(menuSe));
        return CommonResponse.success(menuList);
    }

    @PostMapping("/save")
    public ResponseEntity saveMenu(@PathVariable("menuSe") String menuSe, @RequestBody @Valid InsertMenu insertMenu) throws Exception {
        Menu menu = modelMapper.map(insertMenu, Menu.class);
        menu.setMenuSe(convertMenuSe(menuSe));
        menuSysService.insertMenu(menu);
        return CommonResponse.success(menu);
    }

    @PostMapping("/update")
    public ResponseEntity updateMenu(@PathVariable("menuSe") String menuSe, @RequestBody @Valid UpdateMenu updateMenu) throws Exception {
        Menu menu = modelMapper.map(updateMenu, Menu.class);
        menuSysService.updateMenu(menu);
        return CommonResponse.success(1);
    }

    @PostMapping("/delete")
    public ResponseEntity deleteMenu(@PathVariable("menuSe") String menuSe, @RequestBody Map<String, Object> paramMap) {
        menuSysService.deleteMenu(paramMap);
        return CommonResponse.success(1);
    }

    @GetMapping("/duplicateMenuId")
    public ResponseEntity apiSysMngrDuplicateMenuId(@RequestParam("id") String id) {
        if (menuSysService.selectMenuById(id) == null) {
            return CommonResponse.success(0);
        }
        return CommonResponse.success(1);
    }

    private String convertMenuSe(String menuSe) {
        if (menuSe.equals(MBER)) {
            return "MBER";
        } else if (menuSe.equals(MNGR)) {
            return "MNGR";
        }
        return "";
    }

}
