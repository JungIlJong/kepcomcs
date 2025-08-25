package com.daonplace.vasanta.domain.notification.service.impl;

import com.daonplace.vasanta.core.security.util.UserDetailsUtil;
import com.daonplace.vasanta.domain.authrt.dto.Authrt;
import com.daonplace.vasanta.domain.authrt.service.AuthrtService;
import com.daonplace.vasanta.domain.notification.dto.Notification;
import com.daonplace.vasanta.domain.notification.mapper.NotificationMapper;
import com.daonplace.vasanta.domain.notification.service.NotificationService;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service("notificationService")
public class NotificationServiceImpl extends EgovAbstractServiceImpl implements NotificationService {

    private final NotificationMapper notificationMapper;

    private final PasswordEncoder passwordEncoder;

    private final AuthrtService authrtService;

    public NotificationServiceImpl(NotificationMapper notificationMapper, PasswordEncoder passwordEncoder, AuthrtService authrtService) {
        this.notificationMapper = notificationMapper;
        this.passwordEncoder = passwordEncoder;
        this.authrtService = authrtService;
    }

    @Override
    public List<Notification> selectNotificationList(Map<String, Object> searchMap) {
        return notificationMapper.selectNotificationList(searchMap);
    }

    @Override
    public Notification selectNotificationDetailById(Long ntfId) {
        return notificationMapper.selectNotificationDetailById(ntfId);
    }

    @Override
    public void updateNotificationByNtfId(Notification notification) {
        notificationMapper.updateNotificationByNtfId(notification);
    }

    @Transactional
    @Override
    public void insertNotification(Notification notification) {
        notificationMapper.insertNotification(notification);
    }

    @Override
    public List<Notification> apiNotificationListByMbrId(Map<String, Object> searchMap) {
        searchMap.put("ntfTargetId", UserDetailsUtil.getMbrId());
        return notificationMapper.apiNotificationListByMbrId(searchMap);
    }

    @Override
    public void deleteNotification(Long ntfId) {
        notificationMapper.deleteNotification(ntfId);
    }

}
