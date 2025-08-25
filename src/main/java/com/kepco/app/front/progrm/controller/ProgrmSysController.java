package com.kepco.app.front.progrm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 프로그램을 관리하기 위한 컨트롤러 클래스
 * @author 기업부설연구소 박규영
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
 *   2024.03.28  박규영         최초 생성
 * </pre>
 */

@RequestMapping("/sys/**/progrm")
@Controller
public class ProgrmSysController {

    /**
     * 프로그램 목록화면으로 이동한다.
     * @return
     */
    @GetMapping("/list")
    public String sysProgrmList() {
        return "progrm/list";
    }

    /**
     * 프로그램 상세화면으로 이동한다.
     * @param progrmId
     * @return
     */
    @GetMapping("/detail")
    public String sysProgrmDetail(@RequestParam("progrmId") String progrmId) {
        if (progrmId == null || progrmId.equals(""))
            return "cmmn/error404";

        return "progrm/detail";
    }

    /**
     * 프로그램 등록화면으로 이동한다.
     * @return
     */
    @GetMapping("/save")
    public String sysProgrmSave() {
        return "progrm/save";
    }

}
