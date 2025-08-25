package com.kepco.app.domain.push.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Push {

    private String messageTitle;

    private String messageBody;

    private List<Token> tokens;

    @Getter
    @Setter
    public static class Token {
        private String id;
        private String name;
        private String token;
    }

}
