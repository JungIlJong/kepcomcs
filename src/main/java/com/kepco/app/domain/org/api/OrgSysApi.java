package com.kepco.app.domain.org.api;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.kepco.app.common.CommonResponse;
import com.kepco.app.domain.authrt.service.AuthrtService;
import com.kepco.app.domain.mbrOrg.dto.MbrOrg;
import com.kepco.app.domain.mbrOrg.service.MbrOrgService;
import com.kepco.app.domain.org.dto.InsertOrg;
import com.kepco.app.domain.org.dto.Org;
import com.kepco.app.domain.org.dto.UpdateOrg;
import com.kepco.app.domain.org.service.OrgSysService;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/api/sys/**/org")
@RestController
public class OrgSysApi {

    private final OrgSysService orgSysService;
    private final MbrOrgService mbrOrgService;
    private final AuthrtService authrtService;

    private final ModelMapper modelMapper;

    public OrgSysApi(OrgSysService orgSysService, MbrOrgService mbrOrgService, AuthrtService authrtService, ModelMapper modelMapper) {
        this.orgSysService = orgSysService;
        this.mbrOrgService = mbrOrgService;
        this.authrtService = authrtService;
        this.modelMapper = modelMapper;
    }

    @GetMapping("/orgList")
    public ResponseEntity sysOrgList() {
        List<Org> orgList = orgSysService.selectOrgListAll();
        return CommonResponse.success(orgList);
    }

    @GetMapping("/mbrList")
    public ResponseEntity sysMbrList() {
        Map<String, Object> searchMap = new HashMap<>();
        List<MbrOrg> mbrOrgList = mbrOrgService.selectMbrOrgList(searchMap);
        return CommonResponse.success(mbrOrgList);
    }

    @PostMapping("/save")
    public ResponseEntity saveOrg(@RequestBody InsertOrg insertOrg) throws Exception {
        Org org = modelMapper.map(insertOrg, Org.class);
        orgSysService.insertOrg(org);
        return CommonResponse.success(org);
    }

    @PostMapping("/update")
    public ResponseEntity updateOrg(@RequestBody @Valid UpdateOrg updateOrg) throws Exception {
        Org org = modelMapper.map(updateOrg, Org.class);
        orgSysService.updateOrg(org);
        return CommonResponse.success(1);
    }

    @PostMapping("/delete")
    public ResponseEntity deleteOrg(@RequestBody Map<String, Object> paramMap) {
        orgSysService.deleteOrg(paramMap);
        return CommonResponse.success(1);
    }

    @GetMapping("/duplicateOrgId")
    public ResponseEntity apiSysMngrDuplicateOrgId(@RequestParam("id") String id) {
        if (orgSysService.selectOrgById(id) == null) {
            return CommonResponse.success(0);
        }
        return CommonResponse.success(1);
    }
}
