package com.kepco.app.domain.atchfile.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.atchfile.dto.Atchfile;
import com.kepco.app.domain.atchfile.dto.InsertAtchFile;
import com.kepco.app.domain.atchfile.service.FileService;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.springframework.core.env.Environment;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * 파일 관리하기 위한 API 클래스
 *
 * @author 기업부설연구소 김선홍
 * @since 2024.03.30
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
@RestController
@RequestMapping("/file")
public class FileApi {


    private final FileService fileService;
    private final ObjectMapper objectMapper;
    private String path;
    private String baseUrl;

    public FileApi(FileService fileService, ObjectMapper objectMapper, Environment env) {
        this.fileService = fileService;
        this.objectMapper = objectMapper;
        this.path = env.getProperty("Globals.fileStorePath", String.class);
        this.baseUrl = env.getProperty("Globals.file.baseUrl", String.class);
    }

    /**
     * 파일을 다운로드한다.
     *
     * @param fileId 파일 ID
     * @return 파일 데이터
     */
    @GetMapping("/download")
    public ResponseEntity<org.springframework.core.io.Resource> download(@RequestParam String fileId) throws UnsupportedEncodingException {
            Atchfile atchfile = fileService.selectAtchfileDetail(fileId);
            if (Objects.nonNull(atchfile)) {
                StringBuilder sb = new StringBuilder();
                HttpHeaders headers = new HttpHeaders();
                headers.setContentDisposition(ContentDisposition.builder("attachment").filename(URLEncoder.encode(sb.append(atchfile.getOrignlFileNm()).append(".").append(atchfile.getFileExtsn()).toString(), "UTF-8")).build());  //
                return new ResponseEntity<>(new FileSystemResource(new File(atchfile.getFileStreCours() + File.separator + atchfile.getStreFileNm())), headers, HttpStatus.OK);
            }
            return null;
    }

    /**
     * 이미지를 조회한다.
     *
     * @param fileId 파일 ID
     * @return 이미지
     * @throws IOException
     */
    @GetMapping(value = "/{fileId}", produces = "image/*")
    public ResponseEntity getImage(@PathVariable String fileId) throws IOException {
            Atchfile atchfile = fileService.selectAtchfileDetail(fileId);
        if(atchfile == null) {
            return ResponseEntity.notFound().build();
        }
        StringBuilder sb = new StringBuilder();
        File file = new File(sb.append(atchfile.getFileStreCours()).append(File.separator).append(atchfile.getStreFileNm()).toString());
        if(!file.exists()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok()
                .contentType(MediaType.valueOf(MediaType.IMAGE_JPEG_VALUE))
                .body( IOUtils.toByteArray(new FileSystemResource(file).getInputStream()));
    }

    /**
     * CKEditor 이미지 파일 업로드
     *
     * @param upload 이미지 파일
     * @param response 업로드 경로
     * @throws FdlException
     * @throws IOException
     */
    @PostMapping(value = {"/ckeditor", "/ckeditor&responseType=json"}, produces = "imgae/*")
    public void ckeditor(@RequestParam MultipartFile upload, HttpServletResponse response) throws FdlException, IOException {
        StringBuilder sb = new StringBuilder();
        InsertAtchFile insertAtchFile = InsertAtchFile.builder()
                .file(upload)
                .path(sb.append(path).append(File.separator).append("ckeditor").append(File.separator).append(LocalDate.now().toString()).toString())
                .frstRegisterId((UserDetailsUtil.getId() == null) ? "비회원" : UserDetailsUtil.getId())
                .build();
        String id = fileService.editor(insertAtchFile);
        if(id == null) {
            Map<String, Object> map = new HashMap<>();

            map.put("filename", upload.getOriginalFilename());
            map.put("uploaded", 0);

            Map<String, Object> messageMap = new HashMap<>();
            messageMap.put("message", "해당 확장자는 허용하지 않습니다.");
            map.put("error", messageMap);
            log.info("{}", objectMapper.writeValueAsString(map));

            response.setCharacterEncoding("UTF-8");

            PrintWriter printWriter = response.getWriter();
            printWriter.println(objectMapper.writeValueAsString(map));
            printWriter.flush();
            printWriter.close();
        }

        sb.setLength(0);
        String fileUrl =  sb.append("/file/").append(id).toString();

        Map<String, Object> map = new HashMap<>();
        map.put("url", fileUrl);
        map.put("filename", upload.getOriginalFilename());
        map.put("uploaded", 1);
        map.put("orginName", "fileName");
        try (PrintWriter printWriter = response.getWriter()) {
            printWriter.println(objectMapper.writeValueAsString(map));
            printWriter.flush();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {

        }
    }

    @PostMapping
    public ResponseEntity upload(InsertAtchFile insertAtchFile) throws FdlException, IOException  {
        Map<String, Object> map = new HashMap<>();
        insertAtchFile.setPath(this.path);
        if(UserDetailsUtil.isAuthenticated()) {
            insertAtchFile.setFrstRegisterId(UserDetailsUtil.getMbrId());
        } else {
            insertAtchFile.setFrstRegisterId("unknown");
        }
        String fileId = fileService.insertImgAtchFile(insertAtchFile);
        map.put("fileId", fileId);
        map.put("url", baseUrl + "/file/" + fileId);
        return ResponseEntity.ok(map);
    }
}
