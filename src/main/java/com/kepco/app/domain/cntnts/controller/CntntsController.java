package com.kepco.app.domain.cntnts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kepco.app.domain.cntnts.service.CntntsService;

import java.util.Objects;

/**
 * 사용자가 콘텐츠을 사용하기 위한 컨트롤러 클래스
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
 *   2024.03.30  김선홍         최초 생성
 * </pre>
 */
@Validated
@Controller
@RequestMapping("/mber/**/cntnts/{cntntsId}")
public class CntntsController {

    private final CntntsService cntntsService;

    public CntntsController(CntntsService cntntsService) {
        this.cntntsService = cntntsService;
    }

    /**
     * 콘텐츠를 조회한다.
     *
     * @param cntntsId 콘텐츠 ID
     * @param model
     * @return 콘텐츠 조회 화면
     */
    @GetMapping("/view")
    public String view(@PathVariable String cntntsId, Model model) {
        String cntnts = cntntsService.view(cntntsId);

        if(Objects.isNull(cntnts)) {
            return "cmmn/error404";
        }
        model.addAttribute("id", cntntsId);
        return "mber/cntnts/view";
    }
}
