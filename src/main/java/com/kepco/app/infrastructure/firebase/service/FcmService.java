package com.kepco.app.infrastructure.firebase.service;

import com.google.firebase.messaging.BatchResponse;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.kepco.app.infrastructure.firebase.dto.FcmNotification;

public interface FcmService {

    BatchResponse sendNotification(FcmNotification fcmNotification) throws FirebaseMessagingException;

}
