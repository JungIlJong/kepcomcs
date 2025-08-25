package com.kepco.app.domain.authrt.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.kepco.app.domain.menu.dto.Menu;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@Alias("authrt")
public class Authrt {

    private Long authrtId;

    private String authrtCd;

    private String authrtNm;

    private String authrtExpln;

    private String frstRgtrId;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime frstRegDt;

    private String lastMdfrId;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime lastMdfcnDt;

    private List<Menu> menuList;

}
