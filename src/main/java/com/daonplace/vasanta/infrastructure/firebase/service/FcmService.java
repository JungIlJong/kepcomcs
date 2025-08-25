package com.daonplace.vasanta.infrastructure.firebase.service;

import com.daonplace.vasanta.infrastructure.firebase.dto.FcmNotification;
import com.google.firebase.messaging.BatchResponse;
import com.google.firebase.messaging.FirebaseMessagingException;

public interface FcmService {

    BatchResponse sendNotification(FcmNotification fcmNotification) throws FirebaseMessagingException;

}
