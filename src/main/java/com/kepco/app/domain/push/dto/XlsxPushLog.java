package com.kepco.app.domain.push.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
public class XlsxPushLog {

//    @JsonProperty("아이디")
    private String id;

//    @JsonProperty("이름")
    private String name;

//    @JsonProperty("상태")
    private String state;

}
