package com.daonplace.vasanta.domain.push.api;

import com.daonplace.vasanta.common.CommonResponse;
import com.daonplace.vasanta.core.security.util.UserDetailsUtil;
import com.daonplace.vasanta.core.util.SearchUtil;
import com.daonplace.vasanta.core.vo.ComSearchVO;
import com.daonplace.vasanta.domain.accessip.dto.XlsxAccessIp;
import com.daonplace.vasanta.domain.push.dto.Push;
import com.daonplace.vasanta.domain.push.dto.PushLog;
import com.daonplace.vasanta.domain.push.dto.XlsxPushLog;
import com.daonplace.vasanta.domain.push.service.PushSysService;
import com.daonplace.vasanta.infrastructure.firebase.dto.FcmNotification;
import com.daonplace.vasanta.infrastructure.firebase.service.FcmService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.firebase.messaging.BatchResponse;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.SendResponse;
import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/api/sys/**/push")
public class PushSysApi {

    private final PushSysService pushSysService;

    private final ModelMapper modelMapper;

    private final ObjectMapper objectMapper;

    private final EgovPropertyService propertiesService;

    private final FcmService fcmService;

    public PushSysApi(PushSysService pushSysService, ModelMapper modelMapper, ObjectMapper objectMapper, EgovPropertyService propertiesService, FcmService fcmService) {
        this.pushSysService = pushSysService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
        this.propertiesService = propertiesService;
        this.fcmService = fcmService;
    }

    @GetMapping("/list")
    public ResponseEntity apiSysPushList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"PUSH_LOG_ID", "MESSAGE_TITLE", "MESSAGE_BODY", "SENT_COUNT", "", "SENT_AT"};

        searchMap.put("searchKeyword", reqMap.get("search[value]"));
        int start = Integer.parseInt((String) reqMap.get("start"));
        int length = Integer.parseInt((String) reqMap.get("length"));
        searchMap.put("pageIndex", (start / length) + 1);
        searchMap.put("pageUnit", reqMap.get("length"));

        if (reqMap.get("order[0][column]") != null && !reqMap.get("order[0][column]").equals("")) {
            searchMap.put("orderColumn", columns[Integer.parseInt((String) reqMap.get("order[0][column]"))]);
        } else {
            searchMap.put("orderColumn", "");
        }
        searchMap.put("ascDesc", reqMap.get("order[0][dir]"));

        PaginationInfo paginationInfo = SearchUtil.init(searchMap);

        List<Map<String, Object>> pushList = pushSysService.selectPushList(searchMap);
        int filterTotCnt = pushSysService.selectPushListTotCnt(searchMap);
        searchMap.put("searchKeyword", "");
        int totCnt = pushSysService.selectPushListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", pushList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);
        return CommonResponse.success(resultMap);
    }

    @PostMapping("/save")
    public ResponseEntity<?> apiSysPushSave(@RequestBody Push push) throws FirebaseMessagingException {
        FcmNotification fcmNotification = new FcmNotification();
        fcmNotification.setTitle(push.getMessageTitle());
        fcmNotification.setBody(push.getMessageBody());

        List<Push.Token> pushTokens = push.getTokens();

        List<String> tokens = pushTokens.stream()
                .map(Push.Token::getToken)
                .collect(Collectors.toList());

        fcmNotification.setTokens(tokens);

        BatchResponse response = fcmService.sendNotification(fcmNotification);

        int size = fcmNotification.getTokens().size();
        int successCount = response.getSuccessCount();
        int failureCount = response.getFailureCount();

        PushLog pushLog = new PushLog();
        pushLog.setSender(Long.parseLong(UserDetailsUtil.getMbrId()));
        pushLog.setMessageTitle(push.getMessageTitle());
        pushLog.setMessageBody(push.getMessageBody());
        pushLog.setSuccessCount(successCount);
        pushLog.setFailedCount(failureCount);
        pushLog.setSentCount(size);

        List<Map<String, Object>> tokensMap = new ArrayList<>();

        List<SendResponse> responses = response.getResponses();
        for (int i = 0; i < responses.size(); i++) {
            Map<String, Object> tokenMap = new HashMap<>();

            SendResponse sendResponse = responses.get(i);
            Push.Token token = pushTokens.get(i);

            if (!sendResponse.isSuccessful()) {
                FirebaseMessagingException exception = sendResponse.getException();
//                    tokenMap.put("errorCode", exception.getErrorCode());
//                    tokenMap.put("message", exception.getMessage());
                tokenMap.put("state", "FAILED");
            } else {
                tokenMap.put("state", "COMPLETE");
            }

            tokenMap.put("id", token.getId());
            tokenMap.put("name", token.getName());

            tokensMap.add(tokenMap);
        }

        try {
            String json = objectMapper.writeValueAsString(tokensMap);
            log.info("json: {}", json);
            pushLog.setTokens(json);
        } catch (JsonProcessingException e) {
            log.info("error: {}", e.getMessage());
        }

        pushSysService.insertPushLog(pushLog);

        return CommonResponse.success(pushLog);
    }

    @GetMapping("/xlsx")
    public ResponseEntity apiPushLogXlsx(@RequestParam Map<String, Object> paramMap) throws JsonProcessingException {
        PushLog data = pushSysService.selectPushLogXlsx(paramMap);
        List<XlsxPushLog> xlsxPushLogs = objectMapper.readValue(data.getTokens(), new TypeReference<List<XlsxPushLog>>() {});
        return CommonResponse.success(xlsxPushLogs);
    }

}
