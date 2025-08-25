package com.daonplace.vasanta.domain.answer.api;

import com.daonplace.vasanta.common.CommonErrorCode;
import com.daonplace.vasanta.common.CommonResponse;
import com.daonplace.vasanta.core.util.SearchUtil;
import com.daonplace.vasanta.domain.answer.dto.*;
import com.daonplace.vasanta.domain.answer.service.AnswerService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * 사용자가 댓글을 사용하기 위한 API 클래스
 *
 * @author 기업부설연구소 김선홍
 * @since 2024.03.28
 * @
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2024.03.30  김선홍         최초 생성
 * </pre>
 */
@Slf4j
@Validated
@RestController
@RequestMapping("/api/mber/**/answer")
public class AnswerApi {
    private final ModelMapper modelMapper;

    private final ObjectMapper objectMapper;

    private final AnswerService answerService;


    public AnswerApi(ModelMapper modelMapper, ObjectMapper objectMapper, AnswerService answerService) {
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
        this.answerService = answerService;
    }

    /**
     * 댓글을 등록한다.
     *
     * @param insertAnswer 댓글 생성 DTO
     * @return
     * @throws FdlException
     */
    @PostMapping("/save")
    public ResponseEntity saveAnswer(@Valid @RequestBody InsertMberAnswer insertAnswer) throws FdlException {
        MberAnswer answer = modelMapper.map(insertAnswer, MberAnswer.class);
        answerService.insertAnswer(answer);
        return CommonResponse.empty();
    }

    /**
     * 댓글을 수정한다.
     *
     * @param updateAnswer 댓글 수정 DTO
     * @return
     * @throws FdlException
     */
    @PostMapping("/update")
    public ResponseEntity updateAnswer(@Valid @RequestBody UpdateSysAnswer updateAnswer) throws FdlException {
        MberAnswer answer = modelMapper.map(updateAnswer, MberAnswer.class);
        answerService.updateAnswer(answer);
        return ResponseEntity.ok(Collections.EMPTY_LIST);
    }

    /**
     * 댓글을 삭제한다.
     * @return
     */
    @PostMapping("/delete")
    public ResponseEntity softDeleteAnswer(@RequestBody DeleteMberAnswer deleteMberAnswer) {
        return answerService.softDeleteAnswer(deleteMberAnswer)
                ? ResponseEntity.ok(Collections.EMPTY_LIST)
                : CommonResponse.error(CommonErrorCode.FORBIDDEN_REQUEST);
    }

    /**
     * 댓글 목록을 조회한다.
     *
     * @param searchDto 조회할 정보가 담긴 DTO
     * @return 조회 결과
     */
    @GetMapping("/list")
    public ResponseEntity selectAnswerList(@Valid SearchMberAnswer searchDto) {
        Map<String, Object> searchMap = objectMapper.convertValue(searchDto, HashMap.class);
        PaginationInfo paginationInfo = SearchUtil.init(searchMap);
        Map<String, Object> result = new HashMap<>();
        result.put("data", answerService.selectAnswerList(searchMap));
        paginationInfo.setTotalRecordCount(answerService.selectAnswerTotCnt(searchMap));
        result.put("paginationInfo", paginationInfo);
        return CommonResponse.success(result);
    }

    /**
     * 댓글 상세정보를 조회한다.
     *
     * @param answerId 댓글 ID
     * @return 댓글 상세정보
     */
    @GetMapping("/detail")
    public ResponseEntity detail(@RequestParam String answerId) {
        return CommonResponse.success(answerService.selectAnswerDetail(answerId));
    }

    @PostMapping("/{id}/report")
    public ResponseEntity report(@PathVariable Long id) {
        answerService.report(id);
        return CommonResponse.success(Collections.EMPTY_LIST);
    }
}
