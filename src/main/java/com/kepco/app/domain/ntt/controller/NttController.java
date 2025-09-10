package com.kepco.app.domain.ntt.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.bbs.dto.SearchBbs;
import com.kepco.app.domain.bbs.service.BbsService;
import com.kepco.app.domain.ntt.service.NttAccessManager;
import com.kepco.app.domain.ntt.service.impl.NttAccessManagerImpl;

import java.util.Objects;


/**
 *  사용자가가 게시판을 사용하기 위한 컨트롤러 클래스
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
@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/mber/**/bbs/{bbsId}")
public class NttController {

    private final BbsService bbsService;
    private final NttAccessManager nttAccessManager;

    @ModelAttribute("bbs")
    public SearchBbs addBbsToModel(@PathVariable("bbsId") Long bbsId) {
        return bbsService.selectBbsDetail(bbsId);
    }

    /**
     * 게시글 목록 페이지
     * @return 목록 페이지
     */
    @GetMapping("/list")
    public String list(@PathVariable("bbsId") Long bbsId, Model model) {
    	SearchBbs bbs = bbsService.selectBbsDetail(bbsId);
    	String type = bbs.getBbsTyCode();
    	String url = "mber/ntt/default/list";
    	switch (type) {
    		case "BBS_DEFAULT":
    			if (bbs.getCardAt().equals("Y")) url = "mber/ntt/card/list";
    			else url = "mber/ntt/default/list";
    			break;
    		case "BBS_ALBUM":
    			url = "mber/ntt/album/list";
    			break;
    		case "BBS_QNA":
    			url = "mber/ntt/qna/list";
    			break;
    		case "BBS_DOWNLOAD":
    			url = "mber/ntt/download/list";
    			break;
    	}	
    	model.addAttribute("fileAt", bbs.getFileAt());
    	model.addAttribute("cardAt", bbs.getCardAt());
    	model.addAttribute("bbsId", bbsId);
        return url;
    }

    @GetMapping("/detail")
    public String detail(Model model, @RequestParam Long id) {
//        model.addAttribute("access", nttAccessManager.getAccessInfo(id));
//        model.addAttribute("mbrId", UserDetailsUtil.getMbrId());
        return "mber/ntt/detail";
    }

    @GetMapping("/save")
    public String save() {
        return "mber/ntt/save";
    }

    @GetMapping("/update")
    public String update(@RequestParam Long id) {
        if(nttAccessManager.hasModifyPermission(id)) {
            return "mber/ntt/update";
        }
        return "cmmn/errorAlert";
    }

    @GetMapping("/password")
    public String password(Model model, @RequestParam Long id, @RequestParam String act, @RequestParam(required = false) String res) {
        model.addAttribute("act", act);
        model.addAttribute("id", id);

        if(Objects.nonNull(res)) {
            model.addAttribute("res", res);
            return "mber/answer/password";
        }

        return "mber/bbs/detail/password";
    }
}
