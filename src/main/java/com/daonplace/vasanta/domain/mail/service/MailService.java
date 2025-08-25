package com.daonplace.vasanta.domain.mail.service;

import com.daonplace.vasanta.domain.mail.dto.Mail;

public interface MailService {

    boolean sendMail(Mail mail);
}
