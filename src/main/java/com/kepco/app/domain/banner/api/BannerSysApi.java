package com.kepco.app.domain.banner.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.core.vo.LoginVO;
import com.kepco.app.domain.banner.dto.InsertSysBanner;
import com.kepco.app.domain.banner.dto.SearchBanner;
import com.kepco.app.domain.banner.dto.SysBanner;
import com.kepco.app.domain.banner.dto.UpdateSysBanner;
import com.kepco.app.domain.banner.service.BannerSysService;
import com.kepco.app.domain.mbr.dto.Mbr;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.boot.Banner;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.Size;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 배너을 관리하기 위한 API 클래스
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
@RequestMapping("/api/sys/**/banner")
public class BannerSysApi {

    private final BannerSysService bannerSysService;

    private final ModelMapper modelMapper;

    private final EgovPropertyService propertiesService;

    private final ObjectMapper objectMapper;

    public BannerSysApi(BannerSysService bannerSysService, ModelMapper modelMapper, EgovPropertyService propertiesService, ObjectMapper objectMapper) {
        this.bannerSysService = bannerSysService;
        this.modelMapper = modelMapper;
        this.propertiesService = propertiesService;
        this.objectMapper = objectMapper;
    }

    /**
     * 배너를 생성한다.
     *
     * @param insertBanner 배너 생성 DTO
     * @return
     * @throws FdlException
     */
    @PostMapping("/save")
    public ResponseEntity apiSysBannerSave(@Valid @ModelAttribute InsertSysBanner insertBanner) throws FdlException {
        SysBanner banner = modelMapper.map(insertBanner, SysBanner.class);
        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        banner.setFrstRegisterId(String.valueOf(loginVO.getFrstRgtrId()));
        bannerSysService.insertBanner(banner);
        return CommonResponse.empty();
    }

    /**
     * 배너를 수정한다.
     *
     * @param updateBanner 배너 수정 DTO
     * @return
     * @throws FdlException
     */
    @PostMapping("/update")
    public ResponseEntity apiSysBannerUpdate(@Valid @ModelAttribute UpdateSysBanner updateBanner) throws FdlException {
        SysBanner banner = modelMapper.map(updateBanner, SysBanner.class);
        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        banner.setFrstRegisterId(String.valueOf(loginVO.getFrstRgtrId()));
        bannerSysService.updateBanner(banner);
        return CommonResponse.empty();
    }

    /**
     * 배너를 삭제한다.
     *
     * @param paramMap 삭제할 배너 ID
     * @return
     */
    @PostMapping("/delete")
    public ResponseEntity apiSysBannerDelete(@RequestBody Map<String, Object> paramMap) {
        String bannerId = (String) paramMap.get("bannerId");
        bannerSysService.deleteBanner(bannerId);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("bannerId", bannerId);

        return CommonResponse.success(resultMap);
    }

    /**
     * 배너 리스트를 조회한다.
     *
     * @param reqMap 조회할 정보가 담긴 DTO
     * @return 조회 결과
     */
    @GetMapping("/list")
    public ResponseEntity apiSysBannerList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"BANNER_ID", "BANNER_SE_CODE", "BANNER_NM", "", "SORT_ORDR", "FRST_REGIST_DT"};

        searchMap.put("maxDate", reqMap.get("maxDate"));
        searchMap.put("minDate", reqMap.get("minDate"));
        searchMap.put("reflctAt", reqMap.get("reflctAt"));
        searchMap.put("bannerSeCode", reqMap.get("bannerSeCode"));
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

        List<Map<String, Object>> bannerList = bannerSysService.selectBannerList(searchMap);
        int filterTotCnt = bannerSysService.selectBannerListTotCnt(searchMap);
        searchMap.put("maxDate", "");
        searchMap.put("minDate", "");
        searchMap.put("reflctAt", "");
        searchMap.put("bannerSeCode", "");
        searchMap.put("searchKeyword", "");
        int totCnt = bannerSysService.selectBannerListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", bannerList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }

    /**
     * 배너 상세 정보를 조회한다.
     *
     * @param bannerId 배너 ID
     * @return 배너 상세 정보
     */
    @GetMapping("/detail")
    public ResponseEntity apiSysBannerDetail(@Valid @Size(max = 20) @RequestParam String bannerId) {
        return CommonResponse.success(bannerSysService.selectBannerDetail(bannerId));
    }
}

