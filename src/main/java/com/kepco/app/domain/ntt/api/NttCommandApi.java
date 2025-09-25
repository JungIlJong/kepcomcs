package com.kepco.app.domain.ntt.api;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.kepco.app.common.CommonErrorCode;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.domain.ntt.dto.MberNtt;
import com.kepco.app.domain.ntt.dto.SaveMberNtt;
import com.kepco.app.domain.ntt.service.NttAccessManager;
import com.kepco.app.domain.ntt.service.NttCommandService;
import com.kepco.app.domain.ntt.service.NttSysService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/mber/bbs")
public class NttCommandApi {

    private final NttCommandService nttCommandService;
    private final NttSysService nttSysService;
    private final NttAccessManager nttAccessManager;
    private final ModelMapper modelMapper;

    public NttCommandApi(NttCommandService nttCommandService, NttAccessManager nttAccessManager, ModelMapper modelMapper, NttSysService nttSysService) {
        this.nttSysService = nttSysService;
        this.nttCommandService = nttCommandService;
        this.nttAccessManager = nttAccessManager;
        this.modelMapper = modelMapper;
    }

    /**
     * 게시글을 생성한다.
     */
    @PostMapping("/save")
    public ResponseEntity create(@ModelAttribute @Valid SaveMberNtt.Create create) {
        MberNtt ntt = modelMapper.map(create, MberNtt.class);
        nttCommandService.insertNtt(ntt);
        return CommonResponse.empty();
    }

    /**
     * 게시글을 수정한다.
     */
    @PostMapping("/update")
    public ResponseEntity update(@ModelAttribute @Valid SaveMberNtt.Update update) {
        if(!nttAccessManager.hasModifyPermission(update.getNttId(), update.getConfirmPassword())) {
            return CommonResponse.error(CommonErrorCode.UNAUTHORIZED);
        }

        MberNtt ntt = modelMapper.map(update, MberNtt.class);
        nttCommandService.updateNtt(ntt);
        return ResponseEntity.ok(Collections.EMPTY_LIST);
    }

    /**
     * 게시글을 논리 삭제한다.
     */
    @PostMapping("/delete")
    public ResponseEntity delete(@RequestBody @Valid SaveMberNtt.Delete delete) {
        if(!nttAccessManager.hasModifyPermission(delete.getNttId(), delete.getPassword())) {
            return CommonResponse.error(CommonErrorCode.UNAUTHORIZED);
        }
        nttCommandService.deleteNtt(delete.getNttId());
        return ResponseEntity.ok(Collections.EMPTY_LIST);
    }

    @PostMapping("/block")
    public ResponseEntity block(@RequestBody @Valid SaveMberNtt.Block block) {
        // "공지사항" 등 관리자 게시판의 글은 차단 불가능하도록 수정
        List<Long> adminList = new ArrayList<>();
        // 차단 불가 ID 수동 추가
        adminList.add(1L);

        Map<String, Object> nttDetail = nttSysService.selectNttDetail(String.valueOf(block.getNttId()));
        if (adminList.contains(Long.parseLong((String) nttDetail.get("bbsId")))) {
            return CommonResponse.error(CommonErrorCode.BAD_REQUEST);
        }

        nttCommandService.blockNtt(block.getNttId());
        return ResponseEntity.ok(Collections.EMPTY_LIST);
    }
}