package com.kepco.app.domain.accessip.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.domain.accessip.dto.AccessIp;
import com.kepco.app.domain.accessip.dto.InsertAccessIp;
import com.kepco.app.domain.accessip.dto.SearchAccessIp;
import com.kepco.app.domain.accessip.dto.UpdateAccessIp;
import com.kepco.app.domain.accessip.dto.XlsxAccessIp;
import com.kepco.app.domain.accessip.service.AccessIpService;
import com.kepco.app.domain.authrt.dto.Authrt;

import org.egovframe.rte.fdl.cmmn.exception.FdlException;
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

/**
 * 접근IP를 관리하기 위한 API 클래스
 * @author 기업부설연구소 박규영
 * @version 1.0
 * @
 * @see <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2024.03.28  박규영         최초 생성
 * </pre>
 * @since 2024.03.28
 */

@RestController
@RequestMapping("/api/sys/**/accessip")
public class AccessIpApi {

    private final AccessIpService accessIpService;

    private final ModelMapper modelMapper;

    private final ObjectMapper objectMapper;

    protected EgovPropertyService propertiesService;

    public AccessIpApi(AccessIpService accessIpService, ModelMapper modelMapper, ObjectMapper objectMapper, EgovPropertyService propertiesService) {
        this.accessIpService = accessIpService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
        this.propertiesService = propertiesService;
    }

    /**
     * 접근IP 목록 정보를 조회한다.
     * @param reqMap
     * @return
     */
    @GetMapping("/list")
    public ResponseEntity apiAccessIpList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"IP_ID", "IP_ADRES", "IP_DC", "FRST_REGIST_DT"};

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

        List<Map<String, Object>> accessIpList = accessIpService.selectAccessIpList(searchMap);
        int filterTotCnt = accessIpService.selectAccessIpListTotCnt(searchMap);
        searchMap.put("searchKeyword", "");
        int totCnt = accessIpService.selectAccessIpListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", accessIpList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }

    /**
     * 접근IP 상세 정보를 조회한다.
     * @param ipId
     * @return
     */
    @GetMapping("/detail")
    public ResponseEntity apiAccessIpDetail(@RequestParam("ipId") String ipId) {
        AccessIp accessIp = accessIpService.selectAccessIpDetail(ipId);
        return CommonResponse.success(accessIp);
    }

    /**
     * 접근IP 정보를 등록한다.
     * @param insertAccessIp
     * @return
     * @throws FdlException
     */
    @PostMapping("/save")
    public ResponseEntity apiSysAccessIpSave(@RequestBody @Valid InsertAccessIp insertAccessIp) throws FdlException {
        AccessIp accessIp = modelMapper.map(insertAccessIp, AccessIp.class);
        accessIp.setFrstRegisterId(UserDetailsUtil.getMbrId());
        accessIpService.insertAccessIp(accessIp);
        return CommonResponse.success(accessIp);
    }

    /**
     * 접근IP 정보를 수정한다.
     * @param updateAccessIp
     * @return
     */
    @PostMapping("/update")
    public ResponseEntity apiAccessIpUpdate(@RequestBody @Valid UpdateAccessIp updateAccessIp) {
        AccessIp accessIp = modelMapper.map(updateAccessIp, AccessIp.class);
        accessIp.setLastUpdusrId(UserDetailsUtil.getMbrId());
        accessIpService.updateAccessIp(accessIp);
        return CommonResponse.success(accessIp);
    }

    /**
     * 접근IP 정보를 삭제한다.
     * @param paramMap
     * @return
     */
    @PostMapping("/delete")
    public ResponseEntity apiAccessIpDelete(@RequestBody Map<String, Object> paramMap) {
        String ipId = (String) paramMap.get("ipId");
        accessIpService.deleteAccessIp(ipId);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("ipId", ipId);

        return CommonResponse.success(resultMap);
    }

    /**
     * 접근IP 엑셀 정보를 조회한다.
     * @param paramMap
     * @return
     */
    @GetMapping("/xlsx")
    public ResponseEntity apiAccessIpXlsx(@RequestParam Map<String, Object> paramMap) {
        List<XlsxAccessIp> data = accessIpService.selectAccessIpXlsx(paramMap);
        return CommonResponse.success(data);
    }

}
