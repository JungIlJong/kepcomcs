package com.kepco.app.domain.cntnts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 관리자가 컨텐츠 이력을 조회하기 위한 컨트롤러 클래스
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
@RequestMapping("/sys/**/cntntshist")
public class CntntsHistSysController {

    /**
     * 콘텐츠 이력 목록 화면으로 이동한다.
     *
     * @return 콘텐츠 이력 목록 화면
     */
    @GetMapping("/list")
     public String list() {
        return "sys/cntntshist/list";
    }
}
