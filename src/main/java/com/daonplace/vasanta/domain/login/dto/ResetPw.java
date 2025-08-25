package com.daonplace.vasanta.domain.login.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("resetPw")
public class ResetPw {

    private String uuid;

    private String pswd;
}
