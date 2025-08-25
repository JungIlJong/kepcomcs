package com.kepco.app.domain.mail.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.File;
import java.util.List;

@Getter
@Setter
public class Mail {

    private String to;

    private String subject;

    private String text;

    private List<File> attachments;

}
