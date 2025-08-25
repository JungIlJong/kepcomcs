package com.kepco.app.domain.notification.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.notification.dto.Notification;

import java.util.List;
import java.util.Map;

@Mapper("notificationMapper")
public interface NotificationMapper {
    List<Notification> selectNotificationList(Map<String, Object> searchMap);

    Notification selectNotificationDetailById(Long ntfId);

    void updateNotificationByNtfId(Notification notification);

    void insertNotification(Notification notification);

    List<Notification> apiNotificationListByMbrId(Map<String, Object> searchMap);

    void deleteNotification(Long ntfId);
}
