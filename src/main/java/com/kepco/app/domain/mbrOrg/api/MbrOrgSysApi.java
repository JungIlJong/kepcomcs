package com.kepco.app.domain.mbrOrg.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonErrorCode;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.domain.mbrOrg.dto.InsertMbrOrg;
import com.kepco.app.domain.mbrOrg.dto.MbrOrg;
import com.kepco.app.domain.mbrOrg.dto.UpdateMbrOrg;
import com.kepco.app.domain.mbrOrg.service.MbrOrgService;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/api/sys/**/mbrOrg")
@RestController
public class MbrOrgSysApi {

    private final MbrOrgService mbrOrgService;

    private final ModelMapper modelMapper;

    private final ObjectMapper objectMapper;

    protected final EgovPropertyService propertiesService;

    public MbrOrgSysApi(MbrOrgService mbrOrgService, ModelMapper modelMapper, ObjectMapper objectMapper, EgovPropertyService propertiesService) {
        this.mbrOrgService = mbrOrgService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
        this.propertiesService = propertiesService;
    }

    @GetMapping("/list")
    public ResponseEntity apiMbrOrgList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"", "ID", "MBR_NM", "EML_ADDR", "FRST_REG_DT", "STTS_CD"};

        searchMap.put("maxDate", reqMap.get("maxDate"));
        searchMap.put("minDate", reqMap.get("minDate"));
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

        List<MbrOrg> mngrList = mbrOrgService.selectMbrOrgList(searchMap);
        int filterTotCnt = mbrOrgService.selectMbrOrgListTotCnt(searchMap);
        searchMap.put("maxDate", "");
        searchMap.put("minDate", "");
        searchMap.put("searchKeyword", "");
        int totCnt = mbrOrgService.selectMbrOrgListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", mngrList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }

    @GetMapping("/detail")
    public ResponseEntity<?> apiMbrOrgDetail(@RequestParam("uuid") String uuid) {
        MbrOrg mbrOrg = mbrOrgService.selectMbrOrgDetailByUUID(uuid);
        return CommonResponse.success(mbrOrg);
    }

    @PostMapping("/save")
    public ResponseEntity<?> apiMbrOrgSave(@RequestBody @Valid InsertMbrOrg insertMbrOrg) {
        if (mbrOrgService.countMbrOrgById(insertMbrOrg.getId()) > 0) {
            return CommonResponse.error(CommonErrorCode.BAD_REQUEST);
        }

        MbrOrg mbrOrg = modelMapper.map(insertMbrOrg, MbrOrg.class);
        mbrOrg.setFrstRgtrId(UserDetailsUtil.getMbrId());
        mbrOrgService.insertMbr(mbrOrg);

        return CommonResponse.success(mbrOrg);
    }

    @PostMapping("/update")
    public ResponseEntity apiMbrOrgUpdate(@RequestBody @Valid UpdateMbrOrg updateMbrOrg) {
        MbrOrg mbrOrg = modelMapper.map(updateMbrOrg, MbrOrg.class);
        mbrOrg.setLastMdfrId(UserDetailsUtil.getMbrId());
        mbrOrgService.updateMbrByUUID(mbrOrg);
        return CommonResponse.success(mbrOrg);
    }

    @GetMapping("/duplicateId")
    public ResponseEntity apiMbrOrgDuplicateId(@RequestParam("id") String id) {
        if (mbrOrgService.countMbrOrgById(id) > 0) {
            return CommonResponse.error(CommonErrorCode.ALREADY_USE_ID);
        }

        return CommonResponse.success(1);
    }

    @GetMapping("/duplicateEmail")
    public ResponseEntity apiMbrOrgDuplicateEmail(@RequestParam("emlAddr") String emlAddr, @RequestParam(required = false, value="uuid") String uuid) {
        Map<String, Object> searchMap = new HashMap<>();
        searchMap.put("emlAddr", emlAddr);
        searchMap.put("uuid", uuid);
        if (mbrOrgService.countMbrOrgByEmail(searchMap) > 0) {
            return CommonResponse.error(CommonErrorCode.ALREADY_USE_EMAIL);
        }

        return CommonResponse.success(1);
    }

    @PostMapping("/delete")
    public ResponseEntity apiMbrOrgDelete(@RequestBody Map<String, Object> paramMap) {
        String uuid = (String) paramMap.get("uuid");
        mbrOrgService.deleteMbrOrg(uuid);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("uuid", uuid);

        return CommonResponse.success(1);
    }

    @PostMapping("/updateLock")
    public ResponseEntity apimbrOrgUpdateLock(@RequestBody Map<String, Object> paramMap) {
        String uuid = (String) paramMap.get("uuid");
        mbrOrgService.updateMbrOrgLock(uuid);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("uuid", uuid);

        return CommonResponse.success(resultMap);
    }

    @GetMapping("/push/list")
    public ResponseEntity apiMbrOrgPushList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"", "ID", "MBR_NM", "EML_ADDR", "FRST_REG_DT", "STTS_CD"};

        searchMap.put("maxDate", reqMap.get("maxDate"));
        searchMap.put("minDate", reqMap.get("minDate"));
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

        List<MbrOrg> mngrList = mbrOrgService.selectMbrOrgPushList(searchMap);
        int filterTotCnt = mbrOrgService.selectMbrOrgPushListTotCnt(searchMap);
        searchMap.put("maxDate", "");
        searchMap.put("minDate", "");
        searchMap.put("searchKeyword", "");
        int totCnt = mbrOrgService.selectMbrOrgPushListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", mngrList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }

    @GetMapping("/push/all")
    public ResponseEntity apiMbrOrgPushListAll(@RequestParam Map<String, Object> param) {
        return ResponseEntity.ok(mbrOrgService.selectMbrOrgPushListAll(param));
    }
}
