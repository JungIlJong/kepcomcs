package com.daonplace.vasanta.domain.mypage.controller;

import com.daonplace.vasanta.core.security.util.UserDetailsUtil;
import com.daonplace.vasanta.domain.mbr.dto.Mbr;
import com.daonplace.vasanta.domain.mbr.service.MbrService;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 마이페이지 컨트롤러 클래스
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

@RequestMapping("/mber/**/mypage")
@Controller
public class MypageController {

    private final MbrService mbrService;

    private final ModelMapper modelMapper;

    public MypageController(MbrService mbrService, ModelMapper modelMapper) {
        this.mbrService = mbrService;
        this.modelMapper = modelMapper;
    }

    /**
     * 내 정보 수정 화면으로 이동한다.
     * @param model
     * @return
     */
    @GetMapping("/myinfo")
    public String myinfo(Model model) {
        if (!UserDetailsUtil.isAuthenticated()) {
            return "redirect:/mber/support/login/login";
        }

        String uuid = UserDetailsUtil.getUuid();

        Mbr mbr = mbrService.selectMbrDetailByUUID(uuid);

        model.addAttribute("myInfo", mbr);

        return "mber/mypage/myinfo";
    }

}
