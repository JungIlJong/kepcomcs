package com.daonplace.vasanta.domain.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 회원가입 컨트롤러 클래스
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

@RequestMapping("/mber/**/join")
@Controller
public class JoinController {

    /**
     * 회원가입 > 정보입력 화면으로 이동한다.
     * @return
     */
    @GetMapping("/step1")
    public String joinStep1() {
        return "mber/join/step2";
    }

    /**
     * 회원가입 > 가입완료 화면으로 이동한다.
     * @return
     */
    @PostMapping("/step3")
    public String joinStep3() {
        return "mber/join/step3";
    }

}
