package com.kepco.app.domain.authrt.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.domain.authrt.dto.Authrt;
import com.kepco.app.domain.authrt.dto.InsertAuthrt;
import com.kepco.app.domain.authrt.dto.UpdateAuthrt;
import com.kepco.app.domain.authrt.service.AuthrtService;
import com.kepco.app.domain.progrm.dto.Progrm;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/api/sys/**/authrt")
@RestController
public class AuthrtApi {

    private final AuthrtService authrtService;

    private final ModelMapper modelMapper;

    private final ObjectMapper objectMapper;

    protected final EgovPropertyService propertiesService;

    public AuthrtApi(AuthrtService authrtService, ModelMapper modelMapper, ObjectMapper objectMapper, EgovPropertyService propertiesService) {
        this.authrtService = authrtService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
        this.propertiesService = propertiesService;
    }

    @GetMapping("/list")
    public ResponseEntity apiAuthrtList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"AUTHRT_ID", "AUTHRT_CD", "AUTHRT_NM", "FRST_REG_DT"};

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

        List<Authrt> authrtList = authrtService.selectAuthrtList(searchMap);
        int filterTotCnt = authrtService.selectAuthrtListTotCnt(searchMap);
        searchMap.put("searchKeyword", "");
        int totCnt = authrtService.selectAuthrtListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", authrtList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }

    @GetMapping("/detail")
    public ResponseEntity apiAuthrtDetail(@RequestParam("authrtId") Long authrtId) {
        Authrt authrt = authrtService.selectAuthrtDetail(authrtId);
        return CommonResponse.success(authrt);
    }

    @PostMapping("/save")
    public ResponseEntity apiAuthrtSave(@RequestBody @Valid InsertAuthrt insertAuthrt) {
        Authrt authrt = modelMapper.map(insertAuthrt, Authrt.class);
        authrtService.insertAuthrt(authrt);
        return CommonResponse.success(authrt);
    }

    @PostMapping("/update")
    public ResponseEntity apiAuthrtUpdate(@RequestBody @Valid UpdateAuthrt updateAuthrt) {
        Authrt authrt = modelMapper.map(updateAuthrt, Authrt.class);
        authrtService.updateAuthrt(authrt);
        return CommonResponse.success(authrt);
    }

    @PostMapping("/delete")
    public ResponseEntity apiAuthrtDelete(@RequestBody Map<String, Object> paramMap) {
        String authrtId = (String) paramMap.get("authrtId");
        authrtService.deleteAuthrt(Long.parseLong(authrtId));

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("authrtId", Long.parseLong(authrtId));

        return CommonResponse.success(resultMap);
    }


}
