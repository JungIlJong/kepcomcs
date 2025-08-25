package com.daonplace.vasanta.core.security.service;

import com.daonplace.vasanta.domain.login.service.LoginService;
import com.daonplace.vasanta.core.security.context.UserContext;
import com.daonplace.vasanta.core.vo.LoginVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.List;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

    private final LoginService loginService;

    public CustomUserDetailsService(LoginService loginService) {
        this.loginService = loginService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        LoginVO loginVO = loginService.selectMbrById(username);
        if (loginVO == null) {
            throw new UsernameNotFoundException(String.format("MbrId: [%s] Not Found", username));
        }

        List<String> roleList = loginService.selectMbrRoleByMbrId(loginVO.getMbrId());

        List<GrantedAuthority> roles = new ArrayList<>();

        if (roleList.isEmpty()) {
            roles.add(new SimpleGrantedAuthority("ROLE_USER"));
        } else {
            for (String role : roleList) {
                if (role != null) {
                    roles.add(new SimpleGrantedAuthority(role));
                }
            }
        }

        return new UserContext(loginVO, roles);
    }

}
