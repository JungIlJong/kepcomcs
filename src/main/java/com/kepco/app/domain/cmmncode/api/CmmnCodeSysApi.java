package com.kepco.app.domain.cmmncode.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonErrorCode;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.cmmncode.dto.CmmnCode;
import com.kepco.app.domain.cmmncode.dto.DeleteCmmnCode;
import com.kepco.app.domain.cmmncode.dto.InsertCmmnCode;
import com.kepco.app.domain.cmmncode.dto.UpdateCmmnCode;
import com.kepco.app.domain.cmmncode.service.CmmnCodeService;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Objects;

@RequestMapping("/api/sys/**/cmmncode")
@RestController
public class CmmnCodeSysApi {

    private final CmmnCodeService cmmnCodeService;

    private final ModelMapper modelMapper;

    private final ObjectMapper objectMapper;

    protected final EgovPropertyService propertiesService;

    public CmmnCodeSysApi(CmmnCodeService cmmnCodeService, ModelMapper modelMapper, ObjectMapper objectMapper, EgovPropertyService propertiesService) {
        this.cmmnCodeService = cmmnCodeService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
        this.propertiesService = propertiesService;
    }

    @GetMapping("/list")
    public ResponseEntity<?> cmmnCodeList() {
        List<CmmnCode> cmmnCodes = cmmnCodeService.selectCmmnCodeList();
        return CommonResponse.success(cmmnCodes);
    }

    @GetMapping("/duplicateCodeId")
    public ResponseEntity<?> cmmnCodeDuplicateCodeId(@RequestParam String code) {
        CmmnCode cmmnCode = cmmnCodeService.selectCmmnCodeByCode(code);
        if (Objects.isNull(cmmnCode)) {
            return CommonResponse.success(code);
        }

        return CommonResponse.error(CommonErrorCode.BAD_REQUEST);
    }

    @GetMapping("/{upperCodeId}")
    public ResponseEntity<?> getCmmnCodeListByUpperCodeId(@PathVariable Long upperCodeId) {
        List<CmmnCode> result = cmmnCodeService.selectCmmnCodeListByUpperCodeId(upperCodeId);
        return CommonResponse.success(result);
    }

    @PostMapping("/save")
    public ResponseEntity<?> saveCmmnCode(@RequestBody InsertCmmnCode insertCmmnCode) {
        CmmnCode cmmnCode = modelMapper.map(insertCmmnCode, CmmnCode.class);
        cmmnCode.setFrstRgtrId(Long.parseLong(UserDetailsUtil.getMbrId()));
        cmmnCodeService.insertCmmnCode(cmmnCode);
        return CommonResponse.success(cmmnCode);
    }

    @PostMapping("/update")
    public ResponseEntity<?> updateCmmnCode(@Validated @RequestBody UpdateCmmnCode updateCmmnCode) {
        CmmnCode cmmnCode = modelMapper.map(updateCmmnCode, CmmnCode.class);
        cmmnCode.setFrstRgtrId(Long.parseLong(UserDetailsUtil.getMbrId()));
        cmmnCodeService.updateCmmnCode(cmmnCode);
        return CommonResponse.success(cmmnCode);
    }

    @PostMapping("/delete")
    public ResponseEntity<?> deleteCmmnCode(@RequestBody DeleteCmmnCode deleteCmmnCode) {
        cmmnCodeService.deleteCmmnCodeByCodeId(deleteCmmnCode.getCodeId());
        return CommonResponse.success(deleteCmmnCode.getCodeId());
    }

}
