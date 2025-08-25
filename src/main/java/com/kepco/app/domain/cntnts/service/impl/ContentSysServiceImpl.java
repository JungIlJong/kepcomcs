package com.kepco.app.domain.cntnts.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.core.exception.GlobalException;
import com.kepco.app.domain.cntnts.dto.CntntsHist;
import com.kepco.app.domain.cntnts.dto.CntntsHistSeCode;
import com.kepco.app.domain.cntnts.dto.Content;
import com.kepco.app.domain.cntnts.mapper.CntntnsSysMapper;
import com.kepco.app.domain.cntnts.mapper.CntntsHistSysMapper;
import com.kepco.app.domain.cntnts.service.ContentSysService;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;
import java.util.Map;
import java.util.Objects;
@Slf4j

/**
 * 관리자가 콘텐츠를 관리하기 위한 서비스 구현체
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
@Service("contentSysService")
public class ContentSysServiceImpl extends EgovAbstractServiceImpl implements ContentSysService {
    private final CntntnsSysMapper cntntnsSysMapper;
    private final CntntsHistSysMapper cntntsHistSysMapper;
    private final ModelMapper modelMapper;
    private String path;
    private final String format = "<%%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %%>\n<html>\n<head>\n</head>\n<body>\n%s\n</body>\n</html>";


    public ContentSysServiceImpl(CntntnsSysMapper cntntnsSysMapper, CntntsHistSysMapper cntntsHistSysMapper, ModelMapper modelMapper, ServletContext servletContext) {
        this.cntntnsSysMapper = cntntnsSysMapper;
        this.cntntsHistSysMapper = cntntsHistSysMapper;
        this.modelMapper = modelMapper;
        StringBuilder sb = new StringBuilder();
        path = sb.append(servletContext.getRealPath("/WEB-INF/jsp/vasanta")).append( File.separator).append( "cntnts").toString();
    }

    /**
     * 콘텐츠를 생성한다
     *
     * @param content 콘텐츠 DTO
     */
    @Override
    @Transactional
    public void insertCntnts(Content content) throws FdlException {
        cntntnsSysMapper.saveCntnts(content);
        CntntsHist cntntsHist = new CntntsHist();
        cntntsHist.setCntntsId(content.getCntntsId());
        cntntsHist.setCntntsNm(content.getCntntsNm());
        cntntsHist.setHistSeCode(CntntsHistSeCode.SAVE.getAction());
        cntntsHist.setLastUpdusrId(content.getFrstRegisterId());
        cntntsHistSysMapper.insertCntntsHist(cntntsHist);
        createFile(content.getCntntsId(), String.format(format, content.getCntntsCn()));
    }

    /**
     * 콘텐츠를 수정한다
     *
     * @param content 콘텐츠 DTO
     */
    @Override
    @Transactional
    public void updateCntnts(Content content) throws FdlException {
        cntntnsSysMapper.updateCntnts(content);
        CntntsHist cntntsHist = new CntntsHist();
        cntntsHist.setCntntsId(content.getCntntsId());
        cntntsHist.setCntntsNm(content.getCntntsNm());
        cntntsHist.setHistSeCode(CntntsHistSeCode.UPDATE.getAction());
        cntntsHist.setLastUpdusrId(content.getLastUpdusrId());
        cntntsHistSysMapper.insertCntntsHist(cntntsHist);
        createFile(content.getCntntsId(), String.format(format, content.getCntntsCn()));
    }

    /**
     * 콘텐츠를 삭제한다.
     *
     * @param contentId 삭제할 콘텐츠 ID
     */
    @Override
    @Transactional
    public void deleteById(String contentId, String mgrId) throws FdlException, IOException {
        Map<String, Object> cntnts = cntntnsSysMapper.selectContentDetail(contentId);
        CntntsHist cntntsHist = new CntntsHist();
        cntntsHist.setCntntsId(contentId);
        cntntsHist.setCntntsNm(cntnts.get("cntntsNm").toString());
        cntntsHist.setHistSeCode(CntntsHistSeCode.DELETE.getAction());
        cntntsHist.setLastUpdusrId(mgrId);
        cntntsHistSysMapper.insertCntntsHist(cntntsHist);
        StringBuilder sb = new StringBuilder();
        Files.deleteIfExists(Paths.get(sb.append(path).append(File.separator).append(contentId).append(".jsp").toString()));
        cntntnsSysMapper.deleteById(contentId);
    }

    /**
     * 콘텐츠 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 콘텐츠 목록
     */
    @Override
    public List<Map<String, Object>> selectContentList(Map<String, Object> paramMap) {
        return cntntnsSysMapper.selectContentList(paramMap);
    }

    /**
     * 콘텐츠 총 갯수를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 콘텐츠 총 갯수
     */
    @Override
    public int selectContentTonCnt(Map<String, Object> paramMap) {
        return cntntnsSysMapper.selectContentTonCnt(paramMap);
    }

    /**
     * 콘텐츠 상세정보를 조회한다.
     *
     * @param cntntId 콘텐츠 ID
     * @return 콘텐츠 상세정보
     */
    @Override
    public Map<String, Object> selectContentDetail(String cntntId) {
        return cntntnsSysMapper.selectContentDetail(cntntId);
    }

    /**
     * 콘텐츠를 조회한다.
     *
     * @param cntntId 콘텐츠 ID
     * @return 콘텐츠
     */
    @Override
    public String getCntnt(String cntntId) {
        StringBuilder sb = new StringBuilder();
        Path cntntsFile = Paths.get(sb.append(path).append(File.separator).append(cntntId).append(".jsp").toString());
        if(Files.exists(cntntsFile)) {
            sb.setLength(0);
            return sb.append("cntnts").append(File.separator).append(cntntId).toString();
        }

        Map<String, Object> cntnts = cntntnsSysMapper.selectContentDetail(cntntId);

        if(Objects.isNull(cntnts)) {
            return null;
        }

        createFile(cntnts.get("cntntsId").toString(), cntnts.get("cntntsCn").toString());
        sb.setLength(0);
        return sb.append("cntnts").append(File.separator).append(cntntId).toString();
    }

    /**
     * 콘텐츠 파일을 생성한다.
     *
     * @param cntntId 콘텐츠 ID
     * @param cn 콘텐츠 내용
     */
    private void createFile(String cntntId, String cn) {
        try {
            Path directoryPath = Paths.get(path);
            if(!Files.exists(directoryPath)) {
                Files.createDirectories(Paths.get(path));
            }
            StringBuilder sb = new StringBuilder();
            Path filePath = directoryPath.resolve(sb.append(cntntId).append(".jsp").toString());
            Files.deleteIfExists(filePath);
            log.info("{}", filePath);
            Files.write(filePath, cn.getBytes(StandardCharsets.UTF_8), StandardOpenOption.CREATE, StandardOpenOption.WRITE);
        } catch (IOException e) {
            throw new GlobalException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        } finally {

            log.info("CreateFile End");
        }
    }
}
