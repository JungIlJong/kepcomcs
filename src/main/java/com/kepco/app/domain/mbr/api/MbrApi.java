package com.kepco.app.domain.mbr.api;

import org.modelmapper.ModelMapper;
import org.springframework.core.env.Environment;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.kepco.app.common.CommonErrorCode;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.domain.mbr.dto.InsertMbr;
import com.kepco.app.domain.mbr.dto.Mbr;
import com.kepco.app.domain.mbr.dto.SaveMbr;
import com.kepco.app.domain.mbr.service.MbrService;
import com.kepco.app.domain.ntt.dto.SaveMberNtt;

import javax.validation.Valid;
import java.util.*;

@RequestMapping("/api")
@RestController
public class MbrApi {

    private final MbrService mbrService;

    private final ModelMapper modelMapper;

    private final Environment env;

    public MbrApi(MbrService mbrService, ModelMapper modelMapper, Environment env) {
        this.mbrService = mbrService;
        this.modelMapper = modelMapper;
        this.env = env;
    }

    @PostMapping("/duplicateId")
    public ResponseEntity<?> apiMbrDuplicateId(@RequestBody Map<String, Object> bodyMap) {
        if (Objects.isNull(bodyMap.get("id"))) {
            return CommonResponse.error(CommonErrorCode.BAD_REQUEST);
        }

        String id = (String) bodyMap.get("id");

        if (mbrService.countMbrById(id) > 0) {
            return CommonResponse.error(CommonErrorCode.ALREADY_USE_ID);
        }

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("id", id);

        return CommonResponse.success(resultMap);
    }

    @PostMapping("/join")
    public ResponseEntity<?> apiJoin(@RequestBody InsertMbr insertMbr) {
        if (mbrService.countMbrById(insertMbr.getId()) > 0) {
            return CommonResponse.error(CommonErrorCode.ALREADY_USE_ID);
        }

        String isApprove = env.getProperty("Globals.join.approve");
        if (isApprove.equals("true")) {
            insertMbr.setSttsCd("A");
        }

        Mbr mbr = modelMapper.map(insertMbr, Mbr.class);
        mbrService.insertMbr(mbr);

        return CommonResponse.success(insertMbr);
    }

    /**
     * 사용자를 신고한다.
     */
    @PostMapping("/mber/report")
    public ResponseEntity report(@RequestBody @Valid SaveMbr.Report report) {
        // 관리자 계정은 신고 불가능하도록 수정
        List<Long> adminList = new ArrayList<>();
        // 신고 불가 ID 수동 추가
        adminList.add(1L);

        if (adminList.contains(report.getFrstRgstId())) {
            return CommonResponse.error(CommonErrorCode.BAD_REQUEST);
        }
        mbrService.reportMbr(report.getFrstRgstId());
        return ResponseEntity.ok(Collections.EMPTY_LIST);
    }

    /**
     * 사용자를 차단한다.
     */
    @PostMapping("/mber/block")
    public ResponseEntity block(@RequestBody @Valid SaveMbr.Block block) {
        if (block.getFrstRgstId() == 1L) {
            return CommonResponse.error(CommonErrorCode.BAD_REQUEST);
        }
        mbrService.blockMbr(block.getFrstRgstId());
        return ResponseEntity.ok(Collections.EMPTY_LIST);
    }
}
