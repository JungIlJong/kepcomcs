package com.daonplace.vasanta.front.sitemap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 사이트맵 컨트롤러 클래스
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

@RequestMapping("/mber/**/sitemap")
@Controller
public class SitemapController {

    /**
     * 사이트맵 화면으로 이동한다.
     * @return
     */
    @GetMapping("/view")
    public String sitemapView() {
        return "mber/sitemap/view";
    }

}
