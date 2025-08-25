package com.kepco.app.core.security.provider;

import lombok.extern.slf4j.Slf4j;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.kepco.app.core.security.context.UserContext;
import com.kepco.app.core.security.exception.AccountApprovedException;
import com.kepco.app.core.security.exception.AccountBlockedException;
import com.kepco.app.core.security.exception.AccountDroppedException;
import com.kepco.app.core.security.service.CustomUserDetailsService;
import com.kepco.app.core.vo.LoginVO;
import com.kepco.app.domain.login.service.LoginService;
import com.kepco.app.domain.mbr.mbrSttsCd;

@Slf4j
public class CustomAuthenticationProvider implements AuthenticationProvider {

    private final CustomUserDetailsService customUserDetailsService;

    private final PasswordEncoder passwordEncoder;

    private final Environment env;

    private final LoginService loginService;

    public CustomAuthenticationProvider(CustomUserDetailsService customUserDetailsService, PasswordEncoder passwordEncoder, Environment env, LoginService loginService) {
        this.customUserDetailsService = customUserDetailsService;
        this.passwordEncoder = passwordEncoder;
        this.env = env;
        this.loginService = loginService;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        LoginVO loginVO = (LoginVO) authentication.getPrincipal();
        String username = loginVO.getId();
        String password = (String) authentication.getCredentials();

        UserContext userContext = (UserContext) customUserDetailsService.loadUserByUsername(username);

        LoginVO resultVO = userContext.getLoginVO();

        String loginLock = env.getProperty("Globals.login.Lock");

        if (loginLock.equals("true")) {
            if (resultVO.getLgnLckYn().equals("Y")) {
                throw new LockedException(String.format("MbrId: [%s] is Locked", resultVO.getId()));
            }

            if (!passwordEncoder.matches(password, resultVO.getPswd())) {
                String lockCount = env.getProperty("Globals.login.LockCount");
                if ((resultVO.getLgnFailNmtm() + 1) >= Integer.parseInt(lockCount)) {
                    loginService.updateMbrLgnLckById(resultVO.getId());
                    throw new LockedException(String.format("MbrId: [%s] is Locked", resultVO.getId()));
                }
                loginService.increaseMbrLgnFailNmtmById(resultVO.getId());
                throw new BadCredentialsException(Integer.toString(resultVO.getLgnFailNmtm() + 1));
            }

            loginService.resetMbrLgnLckById(resultVO.getId());
        } else {
            if (!passwordEncoder.matches(password, resultVO.getPswd())) {
                throw new BadCredentialsException(String.format("MbrId: [%s] Password Not Matches", resultVO.getId()));
            }
        }

        String sttsCd = resultVO.getSttsCd();

        if (sttsCd.equals(mbrSttsCd.PENDING.getSttsCd())) {
            throw new AccountApprovedException(String.format("MbrId: [%s] Not Approved", resultVO.getId()));
        } else if (sttsCd.equals(mbrSttsCd.DROPPED.getSttsCd())) {
            throw new AccountDroppedException(String.format("MbrId: [%s] Dropped", resultVO.getId()));
        } else if (sttsCd.equals(mbrSttsCd.BLOCKED.getSttsCd())) {
            throw new AccountBlockedException(String.format("MbrId: [%s] Blocked", resultVO.getId()));
        } else if (sttsCd.equals(mbrSttsCd.EXPIRED.getSttsCd())) {
            throw new AccountExpiredException(String.format("MbrId: [%s] Expired", resultVO.getId()));
        }

        loginService.updateMbrDvcPushTokenById(loginVO);

        log.info("MbrId: [{}] Success Login", resultVO.getId());
        return new UsernamePasswordAuthenticationToken(resultVO, null, userContext.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
    }
}
