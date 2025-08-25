package com.kepco.app.domain.mail.service;

import com.kepco.app.domain.mail.dto.Mail;

public interface MailService {

    boolean sendMail(Mail mail);
}
