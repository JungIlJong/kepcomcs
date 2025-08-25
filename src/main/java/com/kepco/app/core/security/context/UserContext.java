package com.kepco.app.core.security.context;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.kepco.app.core.vo.LoginVO;

import java.util.Collection;

@Getter
public class UserContext extends User {

    private final LoginVO loginVO;

    public UserContext(LoginVO loginVO, Collection<? extends GrantedAuthority> authorities) {
        super(loginVO.getId(), loginVO.getPswd(), authorities);
        this.loginVO = loginVO;
    }

}
