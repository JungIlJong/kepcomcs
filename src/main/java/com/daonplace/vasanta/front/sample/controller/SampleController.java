package com.daonplace.vasanta.front.sample.controller;

import com.daonplace.vasanta.common.util.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
public class SampleController {

    @Value("${Globals.fileStorePath}")
    public String fileStorePath;

    @GetMapping("/testUpload")
    public String testUpload() {
        return "test/testUpload";
    }

    @PostMapping("/testUpload")
    public ResponseEntity<String> testUpload(@RequestParam("file") MultipartFile file) throws IOException {
        FileUtils.saveFile(fileStorePath + "/test", file);
        return ResponseEntity.ok(file.getOriginalFilename());
    }

    @GetMapping("/err/{errorCode}")
    public String handleError(@PathVariable("errorCode") String errorCode) {
        return "cmmn/" + errorCode;
    }

    @GetMapping("/err/default/{code}")
    public String update(Model model, @PathVariable String code) {
        model.addAttribute("errorCode", code);
        model.addAttribute("redirectTo", "home"); // home, back, 특정 페이지
        return "cmmn/errorAlert";
    }

    /* 디자인팀 협업용 샘플 페이지 이동 */
    @GetMapping("/sample/list")
    public  String goSampleListPage() {
        return "sys/cmmn/list-page-template";
    }

    @GetMapping("/sample/example-datatable")
    public String goSampleTablePage() {
        return "sys/cmmn/example-datatable";
    }

    @GetMapping("/sample/java")
    public String goSampleJavaPage() {
        return "sys/cmmn/example-java";
    }

    @GetMapping("/sample")
    public String goSamplePage() {
        return "sys/cmmn/example";
    }

}
