package com.kepco.app.domain.mypage.api;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.mbr.dto.Mbr;
import com.kepco.app.domain.mbr.service.MbrService;
import com.kepco.app.domain.mypage.dto.UpdateMyInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * 마이페이지 API 클래스
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

@RequestMapping("/api/mber/mypage")
@RestController
public class MypageApi {

    private final ModelMapper modelMapper;

    private final MbrService mbrService;

    public MypageApi(ModelMapper modelMapper, MbrService mbrService) {
        this.modelMapper = modelMapper;
        this.mbrService = mbrService;
    }

    @PostMapping("/withDraw")
    public ResponseEntity apiMberMypageWithDraw(@RequestBody Map<String, Object> paramMap, Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
        String uuid = (String) paramMap.get("uuid");

        if (uuid.equals(UserDetailsUtil.getUuid())) {
            mbrService.withDrawMbr(UserDetailsUtil.getUuid());
        }

        doLogout(authentication, request, response);

        return ResponseEntity.status(HttpStatus.OK).body(1);
    }

    @PostMapping("/update")
    public ResponseEntity<?> apiUpdateMyInfo(@RequestBody UpdateMyInfo updateMyInfo) {
        Mbr mbr = modelMapper.map(updateMyInfo, Mbr.class);
        mbr.setLastMdfrId(UserDetailsUtil.getMbrId());
        mbrService.updateMbrByUUID(mbr);
        return CommonResponse.success(mbr);
    }

    private void doLogout(Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
        SecurityContextLogoutHandler securityContextLogoutHandler = new SecurityContextLogoutHandler();
        if (authentication != null) {
            securityContextLogoutHandler.logout(request, response, authentication);
        }
    }
}
