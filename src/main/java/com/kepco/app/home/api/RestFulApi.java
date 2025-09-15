package com.kepco.app.home.api;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.domain.ntt.dto.SysNtt;
import com.kepco.app.domain.ntt.service.NttSysService;
import com.kepco.app.home.service.CUBoardService;
import com.kepco.app.home.service.CUShopService;

@Controller
public class RestFulApi {

    @Autowired
    private final CUBoardService BoardService;

    @Autowired
    private final CUShopService ShopService;

    @Autowired
    private final NttSysService NttService;

    @Value("${Globals.fileStorePath}")
    private String fileStorePath;

    private final String activeProfile;

    public RestFulApi(CUBoardService boardService, CUShopService shopService, NttSysService nttSysService, Environment env) {
        BoardService = boardService;
        ShopService = shopService;
        NttService = nttSysService;
        this.activeProfile = env.getProperty("spring.profiles.active");
    }

    @RequestMapping(value = "/get/board/list/{board_type}", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String getBoardList(@PathVariable(value = "board_type") String board_type, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
        body.put("board_type", board_type);
        List<HashMap<String, Object>> rList = BoardService.getBoardList(body);
        Integer totalrecord = BoardService.getBoardListCount(body);


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


    @RequestMapping(value = "/set/board", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> setBoard(@RequestBody HashMap<String, Object> param, HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, Object> result = new HashMap<String, Object>();
        try {
            //금칙어 목록 우선 처리
            String strProhibitiveStatus = filterText(param.get("board_content").toString());

            System.out.println(strProhibitiveStatus);

            result = BoardService.setBoard(param);
        } catch (Exception e) {
            result.put("result", 0);
            result.put("code", "500");
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/set/boardfile", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> setBoardwithFile(MultipartHttpServletRequest multi, HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "file_list", required = false) MultipartFile[] files) {
        HashMap<String, Object> result = new HashMap<String, Object>();
        HashMap<String, Object> param = new HashMap<String, Object>();
        Integer retValue = 0;

        try {
            if (GoogleCHATCHA(multi.getParameter("google_token").toString())) {
                //금칙어 목록 우선 처리
                String strProhibitiveStatus = filterText(multi.getParameter("board_content"));
                
                SysNtt ntt = new SysNtt();
                ntt.setNttId(Objects.toString(multi.getParameter("board_no"), null));
				ntt.setBbsId(Objects.toString(multi.getParameter("board_type"), null));
				ntt.setNttSj(Objects.toString(multi.getParameter("board_title"), null));
				ntt.setNttCn(Objects.toString(multi.getParameter("board_content"), null));
				ntt.setPassword(Objects.toString(multi.getParameter("board_pwd"), null));
				ntt.setFrstRegisterId(Objects.toString(multi.getParameter("board_author"), null));
				ntt.setWrterNm(Objects.toString(multi.getParameter("board_author"), null));
				ntt.setEmail(Objects.toString(multi.getParameter("email"), null));
				ntt.setAuthorHp(Objects.toString(multi.getParameter("author_hp"), null));
				ntt.setOpinionTitleHead(Objects.toString(multi.getParameter("opinion_title_head"), null));
				ntt.setCpNm(Objects.toString(multi.getParameter("cp_nm"), null));
				ntt.setArea(Objects.toString(multi.getParameter("inquery_area"), null));
				ntt.setAddress1(Objects.toString(multi.getParameter("customer_address1"), null));
				ntt.setAddress2(Objects.toString(multi.getParameter("customer_address2"), null));
				ntt.setAddress3(Objects.toString(multi.getParameter("customer_address3"), null));
				ntt.setFeedbackYn(Objects.toString(multi.getParameter("feedback_yn"), null));
				ntt.setLinkUrl(Objects.toString(multi.getParameter("link_url"), null));
				ntt.setFiles(files);
				BoardService.setBoardFile(ntt);
                result.put("result", 1);
                result.put("msg", "Save Completed");
            }

        } catch (Exception e) {
            result.put("result", 0);
            result.put("code", "500");
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/get/board/view", produces = "application/json; charset=utf8", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity getBoardView(@RequestParam Long nttId, HashMap<String, Object> param) throws Exception {

    	return CommonResponse.success(BoardService.getBoardView(nttId));
    }

    @RequestMapping(value = "/get/board/view2", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String getBoardView2(HashMap<String, Object> param,
                               HttpServletRequest request, HttpServletResponse response) throws Exception {

        HashMap<String, Object> body = new HashMap<String, Object>();
        body.put("board_type", param.get("board_type"));
        body.put("board_no", param.get("board_no"));
        body.put("board_pwd", param.get("board_pwd"));
        List<HashMap<String, Object>> rList = BoardService.getBoardView2(body);

        JSONObject rdata = new JSONObject();
        if (rList.size() > 0) {
            rdata.put("result", "1");
            rdata.put("msg", "1");

            rdata.put("data", new JSONArray(new ObjectMapper().writeValueAsString(rList)));

        } else {
            rdata.put("result", "0");
            rdata.put("msg", "0");
            rdata.put("data", new JSONArray(new ObjectMapper().writeValueAsString(rList)));
        }

        return rdata.toString();
    }
    
    @RequestMapping(value = "/get/board/chkBoardPwd/", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String chkBoardPwd(@RequestBody HashMap<String, Object> param, HttpServletRequest request, HttpServletResponse response) throws Exception {

        HashMap<String, Object> body = new HashMap<String, Object>();
        System.out.println(param.get("board_no"));
        body.put("board_type", param.get("board_type"));
        body.put("board_no", param.get("board_no"));
        body.put("board_pwd", param.get("board_pwd"));
        Integer rValue = BoardService.chkBoardPassword(body);

        System.out.println(param.get("board_pwd"));

        JSONObject rdata = new JSONObject();
        if (rValue > 0) {
            rdata.put("result", "1");
            rdata.put("msg", "1");
        } else {
            rdata.put("result", "0");
            rdata.put("msg", "0");
        }

        return rdata.toString();
    }

    @RequestMapping(value = "/set/boardDelete", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public int boardDelete(@RequestBody HashMap<String, Object> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	HashMap<String, Object> body = new HashMap<String, Object>();
    	body.put("board_no", param.get("board_no"));
    	return BoardService.boardDelete(body);
    }

    @RequestMapping(value = "/set/Opinion", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> insertOpinion(MultipartHttpServletRequest multi, HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, Object> result = new HashMap<String, Object>();
        HashMap<String, Object> param = new HashMap<String, Object>();
        Integer retValue = 0;

        try {
            if (GoogleCHATCHA(multi.getParameter("google_token").toString())) {


                param.put("customer_name", new String(multi.getParameter("customer_name").toString().getBytes("8859_1"), "utf-8"));
                param.put("customer_email", new String(multi.getParameter("customer_email").toString().getBytes("8859_1"), "utf-8"));
                param.put("customer_hp", new String(multi.getParameter("customer_hp").toString().getBytes("8859_1"), "utf-8"));
                param.put("customer_cp_name", new String(multi.getParameter("customer_cp_name").toString().getBytes("8859_1"), "utf-8"));
                param.put("inquery_area", new String(multi.getParameter("inquery_area").toString().getBytes("8859_1"), "utf-8"));
                param.put("customer_address1", new String(multi.getParameter("customer_address1").toString().getBytes("8859_1"), "utf-8"));
                param.put("customer_address2", new String(multi.getParameter("customer_address2").toString().getBytes("8859_1"), "utf-8"));
                param.put("customer_address3", new String(multi.getParameter("customer_address3").toString().getBytes("8859_1"), "utf-8"));
                param.put("opinion_title", new String(multi.getParameter("opinion_title").toString().getBytes("8859_1"), "utf-8"));
                param.put("opinion_content", new String(multi.getParameter("opinion_content").toString().getBytes("8859_1"), "utf-8"));
                param.put("feedback_yn", new String(multi.getParameter("feedback_yn").toString().getBytes("8859_1"), "utf-8"));
                param.put("privacy_aggrement_yn", new String(multi.getParameter("privacy_aggrement_yn").toString().getBytes("8859_1"), "utf-8"));

                if (multi.getFiles("file_list").size() > 0) {

                    String path = fileStorePath;
                    File dir = new File(path);
                    if (!dir.isDirectory()) {
                        dir.mkdirs();
                    }

                    List<MultipartFile> fileList = multi.getFiles("file_list");

                    for (MultipartFile mf : fileList) {
                        String fileName = new String(mf.getOriginalFilename().toString().getBytes("8859_1"), "utf-8");

                        UUID uuid = UUID.randomUUID();
                        fileName = uuid.toString() + "-_-" + fileName;
                        String safeFile = path + fileName;

                        try {
                            //mf.transferTo(new File(safeFile));
                            String uploadedFilename = fileUpload(multi.getFiles("file_list"), request);
                            param.put("attached_file_name", uploadedFilename);
                            //param.put("attached_file_name", fileName);

                        } catch (IllegalStateException e) {
                            result.put("result", String.valueOf(retValue));
                            result.put("msg", "Save failed");

                            e.printStackTrace();

                        } catch (IOException e) {
                            result.put("result", String.valueOf(retValue));
                            result.put("msg", "Save failed");

                            e.printStackTrace();
                        }
                    }
                    result = BoardService.insertOpinion(param);
                    if (Integer.parseInt(result.get("result").toString()) > 0) {
                        result.put("result", 1);
                        result.put("msg", "Save Completed");
                    } else {
                        result.put("result", 0);
                        result.put("msg", "Save Failed");
                    }
                } else {
                    result = BoardService.insertOpinion(param);
                    if (Integer.parseInt(result.get("result").toString()) > 0) {
                        result.put("result", 1);
                        result.put("msg", "Save Completed");
                    } else {
                        result.put("result", 0);
                        result.put("msg", "Save Failed");
                    }
                }

            }

        } catch (Exception e) {
            result.put("result", 0);
            result.put("code", "500");
            result.put("msg", e.getMessage());
        }
        return result;
    }


    @RequestMapping(value = "/insert/Report", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> insertReport(MultipartHttpServletRequest multi, HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, Object> result = new HashMap<String, Object>();
        HashMap<String, Object> param = new HashMap<String, Object>();
        Integer retValue = 0;
        System.out.println("ASDF");

        try {
            if (GoogleCHATCHA(multi.getParameter("google_token").toString())) {
                System.out.println("ASDF");

                param.put("author_name", new String(multi.getParameter("author_name").toString().getBytes("8859_1"), "utf-8"));
                param.put("author_email", new String(multi.getParameter("author_email").toString().getBytes("8859_1"), "utf-8"));
                param.put("author_hp", new String(multi.getParameter("author_hp").toString().getBytes("8859_1"), "utf-8"));
                param.put("opinion_title_head", new String(multi.getParameter("opinion_title_head").toString().getBytes("8859_1"), "utf-8"));
                param.put("opinion_title", new String(multi.getParameter("opinion_title").toString().getBytes("8859_1"), "utf-8"));
                param.put("opinion_content", new String(multi.getParameter("opinion_content").toString().getBytes("8859_1"), "utf-8"));
                System.out.println("ASDF");
                if (multi.getFiles("file_list").size() > 0) {

                    String path = fileStorePath;
                    File dir = new File(path);
                    if (!dir.isDirectory()) {
                        dir.mkdirs();
                    }

                    List<MultipartFile> fileList = multi.getFiles("file_list");

                    for (MultipartFile mf : fileList) {
                        String fileName = new String(mf.getOriginalFilename().toString().getBytes("8859_1"), "utf-8");

                        UUID uuid = UUID.randomUUID();
                        fileName = uuid.toString() + "-_-" + fileName;
                        String safeFile = path + fileName;

                        try {
                            //mf.transferTo(new File(safeFile));
                            String uploadedFilename = fileUpload(multi.getFiles("file_list"), request);
                            param.put("attached_file_name", uploadedFilename);
                            //param.put("attached_file_name", fileName);

                        } catch (IllegalStateException e) {
                            result.put("result", String.valueOf(retValue));
                            result.put("msg", "Save failed");

                            e.printStackTrace();

                        } catch (IOException e) {
                            result.put("result", String.valueOf(retValue));
                            result.put("msg", "Save failed");

                            e.printStackTrace();
                        }
                    }
                    result = BoardService.insertReport(param);
                    if (Integer.parseInt(result.get("result").toString()) > 0) {
                        result.put("result", 1);
                        result.put("msg", "Save Completed");
                    } else {
                        result.put("result", 0);
                        result.put("msg", "Save Failed");
                    }
                } else {
                    result = BoardService.insertReport(param);
                    if (Integer.parseInt(result.get("result").toString()) > 0) {
                        result.put("result", 1);
                        result.put("msg", "Save Completed");
                    } else {
                        result.put("result", 0);
                        result.put("msg", "Save Failed");
                    }
                }

            }

        } catch (Exception e) {
            result.put("result", 0);
            result.put("code", "500");
            result.put("msg", e.getMessage());
        }
        return result;
    }


    @RequestMapping(value = "/insert/conscience", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> insertConscience(MultipartHttpServletRequest multi, HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, Object> result = new HashMap<String, Object>();
        HashMap<String, Object> param = new HashMap<String, Object>();
        Integer retValue = 0;
        System.out.println("ASDF");
        System.out.println("!");

        try {
            if (GoogleCHATCHA(multi.getParameter("google_token").toString())) {
                System.out.println("!!!");
                System.out.println("ASDF");

                param.put("agreeYn", new String(multi.getParameter("agreeYn").toString().getBytes("8859_1"), "utf-8"));
                param.put("cn_name", new String(multi.getParameter("cn_name").toString().getBytes("8859_1"), "utf-8"));
                param.put("cn_enum", new String(multi.getParameter("cn_enum").toString().getBytes("8859_1"), "utf-8"));
                param.put("cn_division", new String(multi.getParameter("cn_division").toString().getBytes("8859_1"), "utf-8"));
                param.put("cn_hp", new String(multi.getParameter("cn_hp").toString().getBytes("8859_1"), "utf-8"));
                param.put("cn_content", new String(multi.getParameter("cn_content").toString().getBytes("8859_1"), "utf-8"));


                System.out.println("ASDF");
                if (multi.getFiles("file_list").size() > 0) {

                    String path = fileStorePath;
                    File dir = new File(path);
                    if (!dir.isDirectory()) {
                        dir.mkdirs();
                    }

                    List<MultipartFile> fileList = multi.getFiles("file_list");

                    for (MultipartFile mf : fileList) {
                        String fileName = new String(mf.getOriginalFilename().toString().getBytes("8859_1"), "utf-8");

                        UUID uuid = UUID.randomUUID();
                        fileName = uuid.toString() + "-_-" + fileName;
                        String safeFile = path + fileName;

                        try {
                            //mf.transferTo(new File(safeFile));
                            String uploadedFilename = fileUpload(multi.getFiles("file_list"), request);
                            param.put("attached_file_name", uploadedFilename);
                            //param.put("attached_file_name", fileName);

                        } catch (IllegalStateException e) {
                            result.put("result", String.valueOf(retValue));
                            result.put("msg", "Save failed");

                            e.printStackTrace();

                        } catch (IOException e) {
                            result.put("result", String.valueOf(retValue));
                            result.put("msg", "Save failed");

                            e.printStackTrace();
                        }
                    }
                    result = BoardService.insertConscience(param);
                    if (Integer.parseInt(result.get("result").toString()) > 0) {
                        result.put("result", 1);
                        result.put("msg", "Save Completed");
                    } else {
                        result.put("result", 0);
                        result.put("msg", "Save Failed");
                    }
                } else {
                    result = BoardService.insertConscience(param);
                    if (Integer.parseInt(result.get("result").toString()) > 0) {
                        result.put("result", 1);
                        result.put("msg", "Save Completed");
                    } else {
                        result.put("result", 0);
                        result.put("msg", "Save Failed");
                    }
                }

            }

        } catch (Exception e) {
            result.put("result", 0);
            result.put("code", "500");
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/get/shop/list", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String getShopList(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
        List<HashMap<String, Object>> rList = ShopService.getShopList(body);
        Integer totalrecord = ShopService.getShopListCount(body);


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


    @RequestMapping(value = "/get/shop/region/1", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> getRegion1(@RequestBody HashMap<String, Object> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
        HashMap<String, Object> result = new HashMap<String, Object>();
        try {
            result = ShopService.getRegion1(param);
        } catch (Exception e) {
            result.put("result", 0);
            result.put("code", "500");
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/get/shop/region/2", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> getRegion2(@RequestBody HashMap<String, Object> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
        HashMap<String, Object> result = new HashMap<String, Object>();
        try {
            result = ShopService.getRegion2(param);
        } catch (Exception e) {
            result.put("result", 0);
            result.put("code", "500");
            result.put("msg", e.getMessage());
        }
        return result;
    }

    // 발전 안내소

    @RequestMapping(value = "/get/power/list", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String getPowerList(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
        List<HashMap<String, Object>> rList = ShopService.getPowerList(body);
        Integer totalrecord = ShopService.getPowerListCount(body);


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

    @RequestMapping(value = "/get/power/region/1", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> getPowerRegion1(@RequestBody HashMap<String, Object> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
        HashMap<String, Object> result = new HashMap<String, Object>();
        try {
            result = ShopService.getPowerRegion1(param);
        } catch (Exception e) {
            result.put("result", 0);
            result.put("code", "500");
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/get/power/region/2", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> getPowerRegion2(@RequestBody HashMap<String, Object> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
        HashMap<String, Object> result = new HashMap<String, Object>();
        try {
            result = ShopService.getPowerRegion2(param);
        } catch (Exception e) {
            result.put("result", 0);
            result.put("code", "500");
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/pop/search/all/list/{search}", method = RequestMethod.GET, produces = "text/html; charset=utf8")
    public String popSearchList(@PathVariable(value = "search") String search, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        model.addAttribute("search", search);
        return "/mcs/home/search/combind_search";
    }

    @RequestMapping(value = "/get/search/all/list/{search}", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> getSearchAllList(@PathVariable(value = "search") String search, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        HashMap<String, Object> result = new HashMap<String, Object>();
        String rtxt = "";
        InitPageSearchDataSet test = InitPageSearchDataSet.getInstance();

        ArrayList<HashMap<String, String>> searchDatas = new ArrayList<HashMap<String, String>>();
        try {
            if (test.getPages() != null) {
                if (test.getPages().size() > 0) {

                    for (Map<String, String> page : test.getPages()) {
                        if (page.get("value") != null) {
                            if (page.get("value").indexOf(search) > -1) {
                                HashMap<String, String> searchData = new HashMap<String, String>();


                                if (page.get("title") != null) {
                                    int limitStr = 100;
                                    int rearCount = 0;
                                    int frontCount = 0;
                                    for (int i = 0; i < page.get("value").indexOf(search); i++) {
                                        frontCount++;
                                        if (frontCount > limitStr - 50) {
                                            break;
                                        }

                                    }

                                    for (int i = page.get("value").indexOf(search); i < page.get("value").length(); i++) {
                                        rearCount++;
                                        if (rearCount > limitStr) {
                                            break;
                                        }
                                    }

                                    String temp1 = page.get("value").substring(page.get("value").indexOf(search) - frontCount, page.get("value").indexOf(search) + rearCount);
                                    temp1 = temp1.replaceAll(search, "<span style='background : #e8e89777;'>" + search + "</span>");

                                    searchData.put("path", page.get("path") + "#S" + search + "E#");
                                    searchData.put("title", page.get("title"));
                                    searchData.put("value", temp1);
                                    searchDatas.add(searchData);
                                }

                            }
                        }
                    }

                }
            }

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            rtxt = "ERR : " + e.getMessage();
        }

        try {
            HashMap<String, Object> searchParam = new HashMap<String, Object>();
            searchParam.put("sSearch", search);
            List<HashMap<String, Object>> rList = BoardService.getSearchAllBoardList(searchParam);
            if (rList.size() > 0) {
                for (HashMap<String, Object> page : rList) {
                    HashMap<String, String> searchData = new HashMap<String, String>();

                    String title = String.valueOf(page.get("title"));
                    String value = String.valueOf(page.get("value"));
                    String board_type = String.valueOf(page.get("board_type"));
                    String temp1 = "";
                    String path = "";
                    if (!value.equals("")) {
                        int limitStr = 100;
                        int rearCount = 0;
                        int frontCount = 0;
                        if (value.indexOf(search) > -1) {
                            for (int i = 0; i < value.indexOf(search); i++) {
                                frontCount++;
                                if (frontCount > limitStr - 50) {
                                    break;
                                }

                            }

                            for (int i = value.indexOf(search); i < value.length(); i++) {
                                rearCount++;
                                if (rearCount > limitStr) {
                                    break;
                                }
                            }

                            temp1 = value.substring(value.indexOf(search) - frontCount, value.indexOf(search) + rearCount);
                            temp1 = temp1.replaceAll(search, "<span style='background : #e8e89777;'>" + search + "</span>");
                        } else {

                            temp1 = value.substring(0, (value.length() > 200 ? 200 : value.length()));
                        }
                    } else {
                        temp1 = value;
                    }
                    if (board_type.equals("1")) {
                        //전력 에너지 뉴스
                        path = "/customer/news-list";
                    } else if (board_type.equals("2")) {
                        //언론속의 한전MCS
                        path = "/customer/press-list";
                    } else if (board_type.equals("3")) {
                        //path = "";
                    } else if (board_type.equals("4")) {
                        //입찰정보
                        path = "/open-manage/contract-list";
                    } else if (board_type.equals("5")) {
                        //채용공고
                        path = "/open-manage/recruit-list";
                    } else if (board_type.equals("6")) {
                        //안전경영소식
                        path = "/esg/safety/safetynews-list";
                    } else if (board_type.equals("7")) {
                        //국민을 위한 안전활동
                        path = "/esg/safety/safetyact-list";
                    } else if (board_type.equals("8")) {
                        //반부패 청렴자료
                        path = "/esg/ethic/integrity-list";
                    } else if (board_type.equals("9")) {
                        //제재현황
                        path = "/esg/ethic/punishment-list";
                    } else if (board_type.equals("10")) {
                        //윤리경영 홍보자료
                        path = "/esg/ethic/ethicpromotion-list";
                    } else if (board_type.equals("11")) {
                        //사업실명제
                        path = "/open-manage/realname-list";
                    } else if (board_type.equals("12")) {
                        //한국사회보장정보원
                        path = "/esg/social/ssis-list";
                    } else if (board_type.equals("13")) {
                        //한국에너지공단
                        path = "/esg/social/energy-list";
                    } else if (board_type.equals("14")) {
                        //고객만족도활동
                        path = "/esg/social/safety-list";
                    } else if (board_type.equals("15")) {
                        //취약계층발굴
                        path = "/esg/social/weak-list";
                    } else if (board_type.equals("16")) {
                        //MOU체결
                        path = "/esg/social/mou-list";
                    } else if (board_type.equals("17")) {
                        //탄소중립활동
                        path = "/esg/carbon-neutral/neutral-list";
                    } else if (board_type.equals("21")) {
                        //신사업 및 협력사업 문의·제안
                        //path = "/customer/cooperation-list";
                    } else if (board_type.equals("22")) {
                        //청렴·부패 신고
                        //path = "/customer/integrity-list";
                    } else if (board_type.equals("23")) {
                        //사회공헌문의
                        //path = "/esg/social/socialinquiry-list";
                    } else if (board_type.equals("25")) {
                        path = "/customer/press-explanatory";
                    } else if (board_type.equals("28")) {
                        path = "/customer/press-video";
                    } else if (board_type.equals("27")) {
                        path = "/customer/press-news";
                    }
                    if (!path.equals("")) {
                        title = title.replaceAll(search, "<span style='background : #e8e89777;'>" + search + "</span>");
                        searchData.put("path", path + "#S" + search + "E#");
                        searchData.put("title", title);
                        searchData.put("value", temp1);
                        searchDatas.add(searchData);
                    }
                }
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

        result.put("search", search);
        result.put("data", searchDatas);


        return result;
    }

    //금지어 필터링 하기
    public String filterText(String sText) {

        List<HashMap<String, Object>> prohibitiveWordList = NttService.getProhibitiveWordList();
        String strProhibitiveWordList = "";
        for (Map<String, Object> entry : prohibitiveWordList) {
            Object value = entry.get("WORD");
            strProhibitiveWordList = strProhibitiveWordList + value.toString() + "|";
        }
        System.out.println(strProhibitiveWordList);

        Pattern p = Pattern.compile(strProhibitiveWordList, Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(sText);

        StringBuffer sb = new StringBuffer();
        while (m.find()) {
            //System.out.println(m.group());
            m.appendReplacement(sb, maskWord(m.group()));
        }
        m.appendTail(sb);

        //System.out.println(sb.toString());
        return sb.toString();
    }


    public static String maskWord(String word) {
        StringBuffer buff = new StringBuffer();
        char[] ch = word.toCharArray();
        for (int i = 0; i < ch.length; i++) {
            if (i < 1) {
                buff.append(ch[i]);
            } else {
                buff.append("*");
            }
        }
        return buff.toString();
    }

    public boolean GoogleCHATCHA(String token) throws Exception {

        String url = "https://www.google.com/recaptcha/api/siteverify";
        String urlParameters = "secret=6Le8_iQcAAAAABVhAmLbxBuHqaEzcYzUN6OoPBMs&response=" + token;
        URL obj = new URL(url);
        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

        //add reuqest header
        con.setRequestMethod("POST");
        con.setRequestProperty("User-Agent", "Mozilla/5.0");
        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
        con.setConnectTimeout(10000);       //컨텍션타임아웃 10초
        con.setReadTimeout(5000);           //컨텐츠조회 타임아웃 5총
        // Send post request
        con.setDoOutput(true);              //항상 갱신된내용을 가져옴.
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(urlParameters);
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();

        Charset charset = Charset.forName("UTF-8");
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        JSONObject result = new JSONObject();
        result = new JSONObject(response.toString());

        if (result.get("success").toString().equals("true")) {
            return true;
        } else {
            return false;
        }
    }

    public String fileUpload(List<MultipartFile> files, HttpServletRequest request) throws UnsupportedEncodingException {
        String path = fileStorePath;
        String fileName = "";
        String saveFile = "";
        File dir = new File(path);
        if (!dir.isDirectory()) {
            dir.mkdirs();
        }

        List<MultipartFile> fileList = files;
        for (MultipartFile mf : fileList) {
            fileName = new String(mf.getOriginalFilename().toString().getBytes("8859_1"), "utf-8");
            String originalFileExtension = fileName.substring(fileName.lastIndexOf("."));
            String originalFilename = fileName.substring(0, fileName.lastIndexOf("."));
            fileName = originalFilename + "_" + getTime() + originalFileExtension;

            saveFile = path + fileName;
            try {
                mf.transferTo(new File(saveFile));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return fileName;
    }

    public String getTime() {
        long time = System.currentTimeMillis();
        SimpleDateFormat dayTime = new SimpleDateFormat("HHmmssSSS");
        String strTime = dayTime.format(new Date(time));
        return strTime;
    }
    
    private String getParam(MultipartHttpServletRequest multi, String name) {
        return Objects.toString(multi.getParameter(name), "");
    }
}

