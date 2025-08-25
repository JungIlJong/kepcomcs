package com.daonplace.vasanta.domain.notification.api;

import com.daonplace.vasanta.common.CommonErrorCode;
import com.daonplace.vasanta.common.CommonResponse;
import com.daonplace.vasanta.core.security.util.UserDetailsUtil;
import com.daonplace.vasanta.core.util.SearchUtil;
import com.daonplace.vasanta.domain.notification.dto.Notification;
import com.daonplace.vasanta.domain.notification.dto.InsertNotification;
import com.daonplace.vasanta.domain.notification.dto.UpdateNotification;
import com.daonplace.vasanta.domain.notification.service.NotificationService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/api/sys/**/notification")
@RestController
public class NotificationSysApi {

    private final NotificationService notificationService;

    private final ModelMapper modelMapper;

    private final ObjectMapper objectMapper;

    protected final EgovPropertyService propertiesService;

    public NotificationSysApi(NotificationService notificationService, ModelMapper modelMapper, ObjectMapper objectMapper, EgovPropertyService propertiesService) {
        this.notificationService = notificationService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
        this.propertiesService = propertiesService;
    }

    @GetMapping("/list/byMbrId")
    public ResponseEntity apiNotificationListByMbrId(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        List<Notification> notificationList = notificationService.apiNotificationListByMbrId(searchMap);
        return CommonResponse.success(notificationList);
    }

    @GetMapping("/list")
    public ResponseEntity apiNotificationList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        List<Notification> notificationList = notificationService.selectNotificationList(searchMap);
        return CommonResponse.success(notificationList);
    }

    @GetMapping("/detail")
    public ResponseEntity<?> apiNotificationDetail(@RequestParam("ntfId") String ntfId) {
        Long id = Long.parseLong(ntfId);
        Notification notification = notificationService.selectNotificationDetailById(id);
        return CommonResponse.success(notification);
    }

    @PostMapping("/save")
    public ResponseEntity<?> apiNotificationSave(@RequestBody @Valid InsertNotification insertNotification) {
        Notification notification = modelMapper.map(insertNotification, Notification.class);
        notificationService.insertNotification(notification);

        return CommonResponse.success(notification);
    }

    @PostMapping("/update")
    public ResponseEntity apiNotificationUpdate(@RequestBody @Valid UpdateNotification updateNotification) {
        Notification notification = modelMapper.map(updateNotification, Notification.class);
        notificationService.updateNotificationByNtfId(notification);
        return CommonResponse.success(notification);
    }

    @PostMapping("/delete")
    public ResponseEntity apiNotificationUpdate(@RequestParam("ntfId") String ntfId) {
        Long id = Long.parseLong(ntfId);
        notificationService.deleteNotification(id);
        return CommonResponse.success(1);
    }
}
