package com.kepco.app.domain.popup.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 관리자가 팝업을 관리하기 위한 컨트롤러 클래스
 *
 * @author 기업부설연구소 김선홍
 * @since 2024.03.28
 * @
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2024.03.28  김선홍         최초 생성
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/sys/**/popup")
public class PopupSysController {

    /**
     * 팝업 생성화면으로 이동한다.
     *
     * @return 팝업 생성화면
     */
    @GetMapping("/save")
    public String insertPopup() {
        return "sys/popup/insert";
    }

    /**
     * 팝업 목록화면으로 이동한다.
     *
     * @return 팝업 목록화면
     */
    @GetMapping("/list")
    public String list() {
        return "sys/popup/list";
    }

    /**
     * 팝업 상세화면으로 이동한다.
     *
     * @return 팝업 상세화면
     */
    @GetMapping("/detail")
    public String detail() {
        return "sys/popup/detail";
    }
}
