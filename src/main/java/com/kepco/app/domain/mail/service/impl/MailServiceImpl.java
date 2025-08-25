package com.kepco.app.domain.mail.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kepco.app.domain.mail.dto.Mail;
import com.kepco.app.domain.mail.mapper.MailMapper;
import com.kepco.app.domain.mail.service.MailService;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service("mailService")
public class MailServiceImpl extends EgovAbstractServiceImpl implements MailService {

    private final JavaMailSender mailSender;

    private final MailMapper mailMapper;

    public MailServiceImpl(JavaMailSender mailSender, MailMapper mailMapper) {
        this.mailSender = mailSender;
        this.mailMapper = mailMapper;
    }

    @Override
    public boolean sendMail(Mail mail) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setTo(mail.getTo());
            helper.setSubject(mail.getSubject());
            helper.setText(mail.getText(), false);

            List<File> attachments = mail.getAttachments();

            if (!Objects.isNull(attachments) && !attachments.isEmpty()) {
                for (File file : attachments) {
                    helper.addAttachment(file.getName(), file);
                }
            }

            mailSender.send(message);

            log.info("success mail to: {}, subject: {}", mail.getTo(), mail.getSubject());
            return true;
        } catch (MessagingException e) {
            log.error("{}", e.getMessage());
            return false;
        }
    }

}
