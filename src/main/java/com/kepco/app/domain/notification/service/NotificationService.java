package com.kepco.app.domain.notification.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.notification.dto.Notification;

public interface NotificationService {
    List<Notification> selectNotificationList(Map<String, Object> searchMap);

    Notification selectNotificationDetailById(Long ntfId);

    void updateNotificationByNtfId(Notification notification);

    void insertNotification(Notification notification);

    List<Notification> apiNotificationListByMbrId(Map<String, Object> searchMap);

    void deleteNotification(Long ntfId);
}
