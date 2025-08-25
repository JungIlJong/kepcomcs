package com.kepco.app.domain.cntnts.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.kepco.app.core.exception.GlobalException;
import com.kepco.app.domain.cntnts.mapper.CntntsMapper;
import com.kepco.app.domain.cntnts.service.CntntsService;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Map;
import java.util.Objects;

/**
 * 사용자가 콘텐츠을 조회하기 위한 서비스 구현체
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
 *   2024.03.30  김선홍         최초 생성
 * </pre>
 */
@Slf4j
@Service("cntntsService")
public class CntntsServiceImpl extends EgovAbstractServiceImpl implements CntntsService {
    private final CntntsMapper cntntsMapper;
    private final String path;

    private final String format = "<%%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %%>\n<html>\n<head>\n</head>\n<body>\n%s\n</body>\n</html>";

    public CntntsServiceImpl(CntntsMapper cntntsMapper, ServletContext servletContext) {
        this.cntntsMapper = cntntsMapper;
        StringBuilder sb = new StringBuilder();
        path = sb.append(servletContext.getRealPath("/WEB-INF/jsp/vasanta")).append( File.separator).append( "cntnts").toString();
    }

    /**
     * 콘텐츠를 조회한다.
     *
     * @param id 콘텐츠 ID
     * @return 콘텐츠
     */
    @Override
    public String view(String id) {
        Path cntntsFile = Paths.get(path + File.separator + id + ".jsp");
        StringBuilder sb = new StringBuilder();
        if(Files.exists(cntntsFile)) {
            return sb.append("cntnts").append(File.separator).append(id).toString();
        }

        Map<String, Object> cntnts = cntntsMapper.selectContentDetail(id);

        if(Objects.isNull(cntnts)) {
            return null;
        }

        createFile(cntnts.get("cntntsId").toString(), String.format(format, cntnts.get("cntntsCn").toString()));
        return sb.append("cntnts").append(File.separator).append(id).toString();
    }

    /**
     * 콘텐츠 파일을 생성한다.
     *
     * @param id 콘텐츠 ID
     * @param cn 콘텐츠 내용
     */
    private void createFile(String id, String cn) {
        StringBuilder sb = new StringBuilder();
        try {
            Path directoryPath = Paths.get(path);
            if(!Files.exists(directoryPath)) {
                Files.createDirectories(Paths.get(path));
            }
            Path filePath = directoryPath.resolve(sb.append(id).append( ".jsp").toString());
            Files.deleteIfExists(filePath);
            Files.write(filePath, cn.getBytes(StandardCharsets.UTF_8), StandardOpenOption.CREATE, StandardOpenOption.WRITE);
        } catch (IOException e) {
            throw new GlobalException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        } finally {
            log.info("createFile Fail");
        }
    }
}
