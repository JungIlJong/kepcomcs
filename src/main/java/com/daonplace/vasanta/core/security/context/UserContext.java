package com.daonplace.vasanta.core.security.context;

import com.daonplace.vasanta.core.vo.LoginVO;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

@Getter
public class UserContext extends User {

    private final LoginVO loginVO;

    public UserContext(LoginVO loginVO, Collection<? extends GrantedAuthority> authorities) {
        super(loginVO.getId(), loginVO.getPswd(), authorities);
        this.loginVO = loginVO;
    }

}
