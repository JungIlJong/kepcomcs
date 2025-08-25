package com.kepco.app.front.accessip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 접근IP를 관리하기 위한 컨트롤러 클래스
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

@Controller
@RequestMapping("/sys/**/accessip")
public class AccessIpController {

    /**
     * 접근IP 목록화면으로 이동한다.
     * @return
     */
    @GetMapping("/list")
    public String accessIpList() {
        return "sys/accessip/list";
    }

    /**
     * 접근IP 상세화면으로 이동한다.
     * @return
     */
    @GetMapping("/detail")
    public String accessIpDetail() {
        return "sys/accessip/detail";
    }

    /**
     * 접근IP 등록화면으로 이동한다.
     * @return
     */
    @GetMapping("/save")
    public String accessIpSave() {
        return "sys/accessip/save";
    }

}
