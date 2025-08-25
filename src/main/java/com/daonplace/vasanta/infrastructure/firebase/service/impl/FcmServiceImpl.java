package com.daonplace.vasanta.infrastructure.firebase.service.impl;

import com.daonplace.vasanta.infrastructure.firebase.dto.FcmNotification;
import com.daonplace.vasanta.infrastructure.firebase.service.FcmService;
import com.google.firebase.messaging.BatchResponse;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.MulticastMessage;
import com.google.firebase.messaging.Notification;
import com.google.firebase.messaging.SendResponse;
import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("fcmService")
public class FcmServiceImpl extends EgovAbstractServiceImpl implements FcmService {

    @Override
    public BatchResponse sendNotification(FcmNotification fcmNotification) throws FirebaseMessagingException {
        MulticastMessage multicastMessage = MulticastMessage.builder()
                .putData("title", fcmNotification.getTitle())
                .putData("body", fcmNotification.getBody())
                .addAllTokens(fcmNotification.getTokens())
                .build();
        return FirebaseMessaging.getInstance().sendEachForMulticast(multicastMessage);
    }

}
