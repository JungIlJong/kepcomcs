package com.daonplace.vasanta.domain.banner.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 관리자가 배너을 관리하기 위한 컨트롤러 클래스
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
@RequestMapping("/sys/**/banner")
public class BannserSysController {

    /**
     * 배너 목록화면으로 이동한다.
     *
     * @return 배너 목록화면
     */
    @GetMapping("/list")
    public String list() {
        return "/sys/banner/list";
    }

    /**
     * 배너 생성화면으로 이동한다.
     *
     * @return 배너 생성화면
     */
    @GetMapping("/save")
    public String save() {
        return "/sys/banner/insert";
    }

    /**
     * 배너 상세페이지로 이동한다.
     *
     * @return 배너 상세화면
     */
    @GetMapping("/detail")
    public String detail() {
        return "/sys/banner/detail";
    }
}
