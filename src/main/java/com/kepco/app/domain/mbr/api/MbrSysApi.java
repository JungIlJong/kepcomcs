package com.kepco.app.domain.mbr.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonErrorCode;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.domain.mbr.dto.InsertMbr;
import com.kepco.app.domain.mbr.dto.Mbr;
import com.kepco.app.domain.mbr.dto.UpdateMbr;
import com.kepco.app.domain.mbr.service.MbrService;

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

@RequestMapping("/api/sys/**/mbr")
@RestController
public class MbrSysApi {

    private final MbrService mbrService;

    private final ModelMapper modelMapper;

    private final ObjectMapper objectMapper;

    protected final EgovPropertyService propertiesService;

    public MbrSysApi(MbrService mbrService, ModelMapper modelMapper, ObjectMapper objectMapper, EgovPropertyService propertiesService) {
        this.mbrService = mbrService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
        this.propertiesService = propertiesService;
    }

    @GetMapping("/list")
    public ResponseEntity apiMbrList(@RequestParam Map<String, Object> reqMap) {
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

        List<Mbr> mngrList = mbrService.selectMbrList(searchMap);
        int filterTotCnt = mbrService.selectMbrListTotCnt(searchMap);
        searchMap.put("maxDate", "");
        searchMap.put("minDate", "");
        searchMap.put("searchKeyword", "");
        int totCnt = mbrService.selectMbrListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", mngrList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }

    @GetMapping("/detail")
    public ResponseEntity<?> apiMbrDetail(@RequestParam("uuid") String uuid) {
        Mbr mbr = mbrService.selectMbrDetailByUUID(uuid);
        return CommonResponse.success(mbr);
    }

    @PostMapping("/save")
    public ResponseEntity<?> apiMbrSave(@RequestBody @Valid InsertMbr insertMbr) {
        if (mbrService.countMbrById(insertMbr.getId()) > 0) {
            return CommonResponse.error(CommonErrorCode.BAD_REQUEST);
        }

        Mbr mbr = modelMapper.map(insertMbr, Mbr.class);
        mbr.setFrstRgtrId(UserDetailsUtil.getMbrId());
        mbrService.insertMbr(mbr);

        return CommonResponse.success(insertMbr);
    }

    @PostMapping("/update")
    public ResponseEntity apiMbrUpdate(@RequestBody @Valid UpdateMbr updateMbr) {
        Mbr mbr = modelMapper.map(updateMbr, Mbr.class);
        mbr.setLastMdfrId(UserDetailsUtil.getMbrId());
        mbrService.updateMbrByUUID(mbr);
        return CommonResponse.success(updateMbr);
    }

    @GetMapping("/duplicateId")
    public ResponseEntity apiMbrDuplicateId(@RequestParam("id") String id) {
        if (mbrService.countMbrById(id) > 0) {
            return CommonResponse.error(CommonErrorCode.ALREADY_USE_ID);
        }

        return CommonResponse.success(1);
    }

    @GetMapping("/duplicateEmail")
    public ResponseEntity apiMbrDuplicateEmail(@RequestParam("emlAddr") String emlAddr, @RequestParam(required = false, value="uuid") String uuid) {
        Map<String, Object> searchMap = new HashMap<>();
        searchMap.put("emlAddr", emlAddr);
        searchMap.put("uuid", uuid);
        if (mbrService.countMbrByEmail(searchMap) > 0) {
            return CommonResponse.error(CommonErrorCode.ALREADY_USE_EMAIL);
        }

        return CommonResponse.success(1);
    }

    @PostMapping("/delete")
    public ResponseEntity apiMbrDelete(@RequestBody Map<String, Object> paramMap) {
        String uuid = (String) paramMap.get("uuid");
        mbrService.deleteMbr(uuid);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("uuid", uuid);

        return CommonResponse.success(resultMap);
    }

    @PostMapping("/updateLock")
    public ResponseEntity apimbrUpdateLock(@RequestBody Map<String, Object> paramMap) {
        String uuid = (String) paramMap.get("uuid");
        mbrService.updateMbrLock(uuid);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("uuid", uuid);

        return CommonResponse.success(resultMap);
    }

    @GetMapping("/push/list")
    public ResponseEntity apiMbrPushList(@RequestParam Map<String, Object> reqMap) {
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

        List<Mbr> mngrList = mbrService.selectMbrPushList(searchMap);
        int filterTotCnt = mbrService.selectMbrPushListTotCnt(searchMap);
        searchMap.put("maxDate", "");
        searchMap.put("minDate", "");
        searchMap.put("searchKeyword", "");
        int totCnt = mbrService.selectMbrPushListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", mngrList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }

    @GetMapping("/push/all")
    public ResponseEntity apiMbrPushListAll(@RequestParam Map<String, Object> param) {
        return ResponseEntity.ok(mbrService.selectMbrPushListAll(param));
    }

    @PostMapping("/updateReport")
    public ResponseEntity apiUpdateReportIds(@RequestBody Map<String, Object> paramMap) {
        String uuid = (String) paramMap.get("uuid");
        mbrService.updateMbrReportIds(uuid);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("uuid", uuid);

        return CommonResponse.success(resultMap);
    }
}
