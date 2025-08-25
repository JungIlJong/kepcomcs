package com.kepco.app.domain.bbs.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kepco.app.domain.bbs.service.BbsSysService;

import java.util.Map;

/**
 * 관리자가 게시판을 관리하기 위한 컨트롤러 클래스
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
@RequestMapping("/sys/**/bbs")
public class BbsSysController {

    private final BbsSysService bbsSysService;

    public BbsSysController(BbsSysService bbsSysService) {
        this.bbsSysService = bbsSysService;
    }

    /**
     * 게시판을 생성 화면으로 이동한다.
     *
     * @return 게시판 생성 화면
     */
    @GetMapping("/save")
    public String save() {
        return "sys/bbs/save";
    }

    /**
     * 게시판 목록 화면으로 이동한다.
     *
     * @return 게시판 목록 화면
     */
    @GetMapping("/list")
    public String list() {
        return "/sys/bbs/list";
    }

    /**
     * 게시판 상세 화면으로 이동한다.
     *
     * @return 게시판 상세 화면
     */
    @GetMapping("detail")
    public String detail() {
        return "/sys/bbs/detail";
    }

    /**
     * 게시판의 게시글 목록으로 이동한다.
     *
     * @return 게시글 목록 화면
     */
    @GetMapping("/{bbsId}/list")
    public String bbsList() {
        return "sys/ntt/list";
    }

    @GetMapping("/{bbsId}/save")
    public String saveN() {
        return "sys/ntt/save";
    }

    /**
     * 게시판의 게시글 상세 목록으로 이동한다.
     *
     * @param bbsId 게시판 ID
     * @return 게시글 상세 페이지
     */
    @GetMapping("/{bbsId}/detail")
    public String detail(@PathVariable String bbsId) {
        Map<String, Object> bbs = bbsSysService.selectBbsPermissionInfo(bbsId);
/*        if (bbs.get("authorList").toString().contains(BbsRole.UPDATE.getAction().toUpperCase())) {
            return "sys/ntt/update";
        }*/
        return "sys/ntt/detail";
    }

    /**
     * 질문에 대한 답글 화면으로 이동한다.
     *
     * @return 답글 등록 페이지
     */
    @GetMapping("/{bbsId}/reply")
    public String reply(@RequestParam String reply) {
        if(reply.equalsIgnoreCase("Y")) {
            return "sys/ntt/reply/update";
        }
        return "sys/ntt/reply/save";
    }
}
