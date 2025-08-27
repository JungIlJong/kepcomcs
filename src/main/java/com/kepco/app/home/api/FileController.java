package com.kepco.app.home.api;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class FileController {

    @Value(("${Globals.fileStorePath}"))
    private String fileStorePath;

    @RequestMapping(value = "/file/fileDown", produces = {"application/json; charset=utf8"})
    @ResponseBody
    public void fileDown(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String filePath = fileStorePath;
        String fileNm = request.getParameter("file_name");
        File file = null;
        if (!StringUtils.isEmpty(fileNm)) {
            file = new File(filePath, fileNm);
            String mimetype = "application/x-msdownload";
            response.setContentType(mimetype);
            this.setDisposition(fileNm, request, response);
            BufferedInputStream in = null;
            BufferedOutputStream out = null;

            try {
                in = new BufferedInputStream(new FileInputStream(file));
                out = new BufferedOutputStream(response.getOutputStream());
                FileCopyUtils.copy(in, out);
                out.flush();
            } catch (FileNotFoundException exception) {
                System.out.println(exception);
            } finally {
                if (in != null) {
                    in.close();
                }
            }
        }
    }

    private void setDisposition(String fileNm, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String browser = this.getBrowser(request);
        String dispositionPrefix = "attachment; filename=";
        String encodedFilename = null;
        if (browser.equals("MSIE")) {
            encodedFilename = URLEncoder.encode(fileNm, "UTF-8").replaceAll("\\+", "%20");
        } else if (browser.equals("Trident")) {
            encodedFilename = URLEncoder.encode(fileNm, "UTF-8").replaceAll("\\+", "%20");
        } else if (browser.equals("Firefox")) {
            encodedFilename = "\"" + new String(fileNm.getBytes("UTF-8"), "8859_1") + "\"";
        } else if (browser.equals("Opera")) {
            encodedFilename = "\"" + new String(fileNm.getBytes("UTF-8"), "8859_1") + "\"";
        } else {
            if (!browser.equals("Chrome")) {
                throw new IOException("Not supported browser");
            }

            StringBuffer sb = new StringBuffer();

            for (int i = 0; i < fileNm.length(); ++i) {
                char c = fileNm.charAt(i);
                if (c > '~') {
                    sb.append(URLEncoder.encode("" + c, "UTF-8"));
                } else {
                    sb.append(c);
                }
            }

            encodedFilename = "\"" + sb.toString() + "\"";
        }

        response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);
        if ("Opera".equals(browser)) {
            response.setContentType("application/octet-stream;charset=UTF-8");
        }

    }

    private String getBrowser(HttpServletRequest request) {
        String useAgent = request.getHeader("User-Agent");
        if (useAgent.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (useAgent.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (useAgent.indexOf("Opera") > -1) {
            return "Opera";
        } else {
            return useAgent.indexOf("Trident") > - 1 ? "Trident" : "Firefox";
        }
    }

}
