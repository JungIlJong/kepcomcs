package com.daonplace.vasanta.domain.notification.service;

import com.daonplace.vasanta.domain.notification.dto.Notification;

import java.util.List;
import java.util.Map;

public interface NotificationService {
    List<Notification> selectNotificationList(Map<String, Object> searchMap);

    Notification selectNotificationDetailById(Long ntfId);

    void updateNotificationByNtfId(Notification notification);

    void insertNotification(Notification notification);

    List<Notification> apiNotificationListByMbrId(Map<String, Object> searchMap);

    void deleteNotification(Long ntfId);
}
