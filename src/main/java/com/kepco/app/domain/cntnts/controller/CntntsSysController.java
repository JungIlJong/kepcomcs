package com.kepco.app.domain.cntnts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kepco.app.domain.cntnts.service.ContentSysService;

import javax.annotation.Resource;
import javax.validation.constraints.Size;
import java.util.Objects;

/**
 * 관리자가 컨텐츠을 관리하기 위한 컨트롤러 클래스
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
@Controller
@Validated
@RequestMapping("/sys/**/cntnts")
public class CntntsSysController {

    private final ContentSysService contentSysService;

    public CntntsSysController(ContentSysService contentSysService) {
        this.contentSysService = contentSysService;
    }

    /**
     * 콘텐츠 생성화면으로 이동한다.
     *
     * @return 콘텐츠 생성화면
     */
    @GetMapping("/save")
    public String save() {
        return "sys/cntnts/save";
    }


    /**
     * 콘텐츠 목록화면으로 이동한다.
     *
     * @return 콘텐츠 목록화면
     */
    @GetMapping("/list")
    public String list() {
        return "sys/cntnts/list";
    }


    /**
     * 콘텐츠 상세화면으로 이동한다.
     *
     * @return 콘텐츠 상세화면
     */
    @GetMapping("/detail")
    public String detail() {
        return "sys/cntnts/detail";
    }

    /**
     * 콘텐츠를 조회한다.
     *
     * @param cntntsId 콘텐츠 ID
     * @param model MODEL
     *
     * @return 콘텐츠 조회 화면
     */
    @GetMapping("/{cntntsId}/view")
    public String getCntnt(@PathVariable @Size(max = 20) String cntntsId, Model model) {

        String cntnts = contentSysService.getCntnt(cntntsId);

        // 존재하지 않을 경우 404 화면 이동
        if(Objects.isNull(cntnts)) {
            return "cmmn/error404";
        }
        model.addAttribute("id", cntntsId);
        return "sys/cntnts/view";
    }
}
