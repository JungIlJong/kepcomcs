package com.kepco.app.domain.ntt.api;

import lombok.RequiredArgsConstructor;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.ntt.dto.SearchMberNtt;
import com.kepco.app.domain.ntt.service.NttQueryService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/mber/bbs/{bbsId}")
public class NttQueryApi {
    private final NttQueryService nttQueryService;

    @GetMapping("/list")
    public ResponseEntity selectList(SearchMberNtt.Search req, @PathVariable Long bbsId) {
        req.setBbsId(bbsId);
        if (!Objects.equals(UserDetailsUtil.getMbrId(), "null")) {
            req.setFrstRgstId(Long.parseLong(UserDetailsUtil.getMbrId()));
        }
        return CommonResponse.success(nttQueryService.selectNttList(req));
    }
    
    @GetMapping
    public String getBoardList(@PathVariable(value = "bbsId") String bbsId, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	HashMap<String, Object> body = new HashMap<String, Object>();
        Map params = request.getParameterMap();
        Iterator i = params.keySet().iterator();

        while (i.hasNext()) {
            String key = (String) i.next();
            String value = ((String[]) params.get(key))[0];
            //System.out.println(key + " " + value);
            body.put(key, value);
        }
        System.out.println(new ObjectMapper().writeValueAsString(body));
        Boolean valid = true;
        String col = "";

        try {
            String[] cols = body.get("sColumns").toString().split(",");
            col = cols[Integer.valueOf((String) body.get("iSortCol_0"))];
            body.put("orderCol", col);

        } catch (Exception e) {
            col = "";
            // TODO: handle exception
        }
        body.put("bbsId", bbsId);
        List<HashMap<String, Object>> rList = nttQueryService.selectList(body);
        Integer totalrecord = nttQueryService.selectListCount(body);


        JSONObject rdata = new JSONObject();
        if (rList.size() > 0) {
            rdata.put("result", "1");
            rdata.put("msg", "1");
            rdata.put("hashdata", new ArrayList());
            rdata.put("recordsTotal", totalrecord);
            rdata.put("recordsFiltered", totalrecord);
            rdata.put("data", new JSONArray(new ObjectMapper().writeValueAsString(rList)));
        } else {
            rdata.put("result", "0");
            rdata.put("msg", "0");
            rdata.put("hashdata", new ArrayList());
            rdata.put("recordsTotal", totalrecord);
            rdata.put("recordsFiltered", totalrecord);
            rdata.put("data", new JSONArray(new ObjectMapper().writeValueAsString(rList)));
        }

        return rdata.toString();
    }

    @GetMapping("/detail")
    public ResponseEntity selectDetail(@RequestParam Long nttId) {
        return CommonResponse.success(nttQueryService.selectNonSecretDetail(nttId));
    }

    // 비회원의 비밀글 확인
    @PostMapping("/detail")
    public ResponseEntity selectDetail(@RequestParam Long nttId, @RequestBody SearchMberNtt.Password password) {
        return CommonResponse.success(nttQueryService.selectSecretDetail(nttId, password.getPassword()));
    }

    @GetMapping("/side")
    public ResponseEntity selectPreAndNext(@RequestParam Long nttId, @PathVariable Long bbsId) {
        return CommonResponse.success(nttQueryService.selectPreAndNext(nttId, bbsId));
    }
}
