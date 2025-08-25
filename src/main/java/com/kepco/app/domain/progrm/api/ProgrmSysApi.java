package com.kepco.app.domain.progrm.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.domain.mbr.dto.Mbr;
import com.kepco.app.domain.progrm.dto.InsertProgrm;
import com.kepco.app.domain.progrm.dto.Progrm;
import com.kepco.app.domain.progrm.dto.SearchProgrm;
import com.kepco.app.domain.progrm.dto.UpdateProgrm;
import com.kepco.app.domain.progrm.service.ProgrmSysService;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
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

/**
 * 프로그램을 관리하기 위한 API 클래스
 * @author 기업부설연구소 박규영
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
 *   2024.03.28  박규영         최초 생성
 * </pre>
 */

@RequestMapping("/api/sys/**/progrm")
@RestController
public class ProgrmSysApi {

    private final ProgrmSysService progrmSysService;

    private final ModelMapper modelMapper;

    private final ObjectMapper objectMapper;

    protected final EgovPropertyService propertiesService;

    public ProgrmSysApi(ProgrmSysService progrmSysService, ModelMapper modelMapper, ObjectMapper objectMapper, EgovPropertyService propertiesService) {
        this.progrmSysService = progrmSysService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
        this.propertiesService = propertiesService;
    }

    /**
     * 프로그램 목록 정보를 조회한다.
     * @param reqMap
     * @return
     */
    @GetMapping("/list")
    public ResponseEntity apiSysProgrmList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"", "PROGRM_NM", "PROGRM_DC", "PROGRM_URL"};

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

        List<Progrm> progrmList = progrmSysService.selectProgrmList(searchMap);
        int filterTotCnt = progrmSysService.selectProgrmListTotCnt(searchMap);
        searchMap.put("searchKeyword", "");
        int totCnt = progrmSysService.selectProgrmListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", progrmList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }

    /**
     * 프로그램 상세 정보를 조회한다.
     * @param progrmId
     * @return
     */
    @GetMapping("/detail")
    public ResponseEntity apiSysProgrmDetail(@RequestParam("progrmId") String progrmId) {
        Progrm progrm = progrmSysService.selectProgrmDetail(progrmId);
        return CommonResponse.success(progrm);
    }

    /**
     * 프로그램 정보를 등록한다.
     * @param insertProgrm
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @PostMapping("/save")
    public ResponseEntity apiSysProgrmSave(@RequestBody @Valid InsertProgrm insertProgrm, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
        Progrm progrm = modelMapper.map(insertProgrm, Progrm.class);
        progrmSysService.insertProgrm(progrm);
        return CommonResponse.success(progrm);
    }

    /**
     * 프로그램 정보를 수정한다.
     * @param updateProgrm
     * @param bindingResult
     * @return
     */
    @PostMapping("/update")
    public ResponseEntity apiSysProgrmUpdate(@RequestBody @Valid UpdateProgrm updateProgrm, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
        Progrm progrm = modelMapper.map(updateProgrm, Progrm.class);
        progrmSysService.updateProgrm(progrm);
        return CommonResponse.success(progrm);
    }

    /**
     * 프로그램 정보를 삭제한다.
     * @param paramMap
     * @return
     */
    @PostMapping("/delete")
    public ResponseEntity apiSysProgrmDelete(@RequestBody Map<String, Object> paramMap) {
        String progrmId = (String) paramMap.get("progrmId");
        progrmSysService.deleteProgrm(progrmId);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("progrmId", progrmId);

        return CommonResponse.success(resultMap);
    }

}
