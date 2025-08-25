package com.kepco.app.domain.login.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("findPw")
public class FindPw {

    private String id;

    private String mbrNm;

    private String emlAddr;

}
