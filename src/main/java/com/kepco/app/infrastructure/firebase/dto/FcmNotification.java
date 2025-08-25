package com.kepco.app.infrastructure.firebase.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class FcmNotification {

    private List<String> tokens;

    private String token;

    private String title;

    private String body;

}
