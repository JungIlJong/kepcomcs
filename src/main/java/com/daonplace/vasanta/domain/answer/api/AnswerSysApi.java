package com.daonplace.vasanta.domain.answer.api;

import com.daonplace.vasanta.domain.answer.dto.InsertSysAnswer;
import com.daonplace.vasanta.domain.answer.dto.SearchSysAnswer;
import com.daonplace.vasanta.domain.answer.dto.SysAnswer;
import com.daonplace.vasanta.domain.answer.dto.UpdateSysAnswer;
import com.daonplace.vasanta.domain.answer.service.AnswerSysService;
import com.daonplace.vasanta.common.CommonResponse;
import com.daonplace.vasanta.core.security.util.UserDetailsUtil;
import com.daonplace.vasanta.core.util.SearchUtil;
import com.daonplace.vasanta.core.vo.LoginVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import javax.validation.constraints.Size;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 관리자가 댓글을 관리하기 위한 API 클래스
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
 *   2024.03.28  김선홍         최초 생성
 * </pre>
 */
@Slf4j
@Validated
@RestController
@RequestMapping("/api/sys/answer")
public class AnswerSysApi {

    private final AnswerSysService answerSysService;
    private final  EgovPropertyService propertiesService;
    private final ModelMapper modelMapper;
    private final ObjectMapper objectMapper;

    public AnswerSysApi(AnswerSysService answerSysService, EgovPropertyService propertiesService, ModelMapper modelMapper, ObjectMapper objectMapper) {
        this.answerSysService = answerSysService;
        this.propertiesService = propertiesService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
    }

    /**
     * 댓글을 생성한다.
     *
     * @param insertAnswer 댓글 생성 DTO
     * @return  생성된 댓글
     * @throws FdlException
     */
    @PostMapping("/save")
    public ResponseEntity apiSysAnswerSave(@Valid @RequestBody InsertSysAnswer insertAnswer) throws FdlException {
        SysAnswer answer = modelMapper.map(insertAnswer, SysAnswer.class);
        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        answer.setFrstRegisterId(String.valueOf(loginVO.getId()));
        answerSysService.insertAnswer(answer);
        return CommonResponse.empty();
    }

    /**
     * 댓글을 수정한다.
     *
     * @param updateAnswer 댓글 수정 DTO
     * @return 수정된 댓글
     */
    @PostMapping("/update")
    public ResponseEntity apiSysAnswerUpdate(@Valid @RequestBody UpdateSysAnswer updateAnswer) {
        SysAnswer answer = modelMapper.map(updateAnswer, SysAnswer.class);
        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        answer.setFrstRegisterId(String.valueOf(loginVO.getId()));
        answerSysService.updateAnswer(answer);
        return CommonResponse.success(answer);
    }

    /**
     * 댓글을 삭제한다.
     *
     * @param answerId 삭제할 댓글ID
     * @return
     */
    @PostMapping("/delete")
    public ResponseEntity apiSysAnswerDelete(@RequestParam @Size(max = 20) String answerId) {
        answerSysService.deleteAnswerById(answerId);
        return CommonResponse.success(answerId);
    }

    /**
     * 댓글 리스트를 조회한다.
     *
     * @param searchDto 조회할 정보가 담긴 DTO
     * @return 조회 결과
     */
    @GetMapping("/list")
    public ResponseEntity apiSysAnswerList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"A.ANSWER_ID", "A.ANSWER_CN", "A.WRTER_NM", "FRST_REGIST_DT"};

        searchMap.put("searchKeyword", reqMap.get("search[value]"));
        int start = Integer.parseInt((String) reqMap.get("start"));
        int length = Integer.parseInt((String) reqMap.get("length"));
        searchMap.put("pageIndex", (start / length) + 1);
        searchMap.put("pageUnit", reqMap.get("length"));
        searchMap.put("nttId", reqMap.get("nttId"));

        if (reqMap.get("order[0][column]") != null && !reqMap.get("order[0][column]").equals("")) {
            searchMap.put("orderColumn", columns[Integer.parseInt((String) reqMap.get("order[0][column]"))]);
        } else {
            searchMap.put("orderColumn", "");
        }
        searchMap.put("ascDesc", reqMap.get("order[0][dir]"));

        PaginationInfo paginationInfo = SearchUtil.init(searchMap);

        List<Map<String, Object>> nttList = answerSysService.selectAnswerList(searchMap);
        int filterTotCnt = answerSysService.selectAnswerTotCnt(searchMap);
        searchMap.put("searchKeyword", "");
        int totCnt = answerSysService.selectAnswerTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", nttList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);
        return CommonResponse.success(resultMap);
    }
}
