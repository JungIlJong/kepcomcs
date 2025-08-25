package com.kepco.app.domain.login.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("findId")
public class FindId {

    private String mbrNm;

    private String emlAddr;

}
