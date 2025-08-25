package com.kepco.app.domain.banner.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.domain.atchfile.dto.InsertAtchFile;
import com.kepco.app.domain.atchfile.service.FileService;
import com.kepco.app.domain.banner.dto.SysBanner;
import com.kepco.app.domain.banner.mapper.BannerSysMapper;
import com.kepco.app.domain.banner.service.BannerSysService;

import java.io.File;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;


/**
 * 관리자가 배너을 관리하기 위한 서비스 구현체
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
@Service("bannerSysService")
public class BannerSysServiceImpl extends EgovAbstractServiceImpl implements BannerSysService {
    private final BannerSysMapper bannerSysMapper;
    private final FileService fileService;

    private final String webBannerSe = "WEB_BANNER";
    private final String mobBannerSe = "MOB_BANNER";

    private final String path;

    public BannerSysServiceImpl(BannerSysMapper bannerSysMapper, FileService fileService, Environment env) {
        this.bannerSysMapper = bannerSysMapper;
        this.fileService = fileService;
        this.path = env.getProperty("Globals.fileStorePath", String.class);
    }

    /**
     * 배너를 생성한다
     *
     * @param banner 배너 DTO
     * @throws FdlException
     */
    @Override
    @Transactional
    public void insertBanner(SysBanner banner) throws FdlException {
        StringBuilder sb = new StringBuilder();
        sb.append(path).append(File.separator).append("banner").append(File.separator).append(LocalDate.now().toString());
        bannerSysMapper.insertBanner(banner);
        InsertAtchFile webBanner = InsertAtchFile.builder()
                .file(banner.getWebBanner())
                .fileSe(webBannerSe)
                .path(sb.toString())
                .frstRegisterId(banner.getFrstRegisterId())
                .upperId(banner.getBannerId())
                .build();
        fileService.insertImgAtchFile(webBanner);

        InsertAtchFile mobBanner = InsertAtchFile.builder()
                .file(banner.getMobBanner())
                .fileSe(mobBannerSe)
                .path(sb.toString())
                .frstRegisterId(banner.getFrstRegisterId())
                .upperId(banner.getBannerId())
                .build();
        fileService.insertImgAtchFile(mobBanner);
    }

    /**
     * 배너를 수정한다
     *
     * @param banner 배너 DTO
     * @throws FdlException
     */
    @Override
    @Transactional
    public void updateBanner(SysBanner banner) throws FdlException {
        StringBuilder sb = new StringBuilder();
        sb.append(path).append(File.separator).append("banner").append(File.separator).append(LocalDate.now().toString());
        if(!banner.getWebBanner().isEmpty()) {
            Map<String, Object> removeBannerFile = fileService.selectAtchFileList(banner.getBannerId(), webBannerSe).get(0);
            log.info("{}", removeBannerFile);
            fileService.deleteAtchfileById(removeBannerFile.get("atchFileId").toString());

            InsertAtchFile webBanner = InsertAtchFile.builder()
                    .file(banner.getWebBanner())
                    .fileSe(webBannerSe)
                    .path(sb.toString())
                    .frstRegisterId(banner.getFrstRegisterId())
                    .upperId(banner.getBannerId())
                    .build();
            fileService.insertImgAtchFile(webBanner);
        }
        if(!banner.getMobBanner().isEmpty()) {
            Map<String, Object> removeBannerFile = fileService.selectAtchFileList(banner.getBannerId(), mobBannerSe).get(0);
            fileService.deleteAtchfileById(removeBannerFile.get("atchFileId").toString());

            InsertAtchFile mobBanner = InsertAtchFile.builder()
                    .file(banner.getMobBanner())
                    .fileSe(mobBannerSe)
                    .path(sb.toString())
                    .frstRegisterId(banner.getFrstRegisterId())
                    .upperId(banner.getBannerId())
                    .build();
            fileService.insertImgAtchFile(mobBanner);
        }

        bannerSysMapper.updateBanner(banner);
    }

    /**
     * 배너를 삭제한다.
     *
     * @param bannerId 삭제할 배너 ID
     */
    @Override
    @Transactional
    public void deleteBanner(String bannerId) {
        bannerSysMapper.deleteBanner(bannerId);
        fileService.deleteAtchfileByUpperId(bannerId);
    }

    /**
     * 배너 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 배너 리스트
     */
    @Override
    public List<Map<String, Object>> selectBannerList(Map<String, Object> paramMap) {
        return bannerSysMapper.selectBannerList(paramMap);
    }

    /**
     * 배너 총 갯수를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 배너 총 갯수
     */
    @Override
    public int selectBannerListTotCnt(Map<String, Object> paramMap) {
        return bannerSysMapper.selectBannerListTotCnt(paramMap);
    }

    /**
     * 배너 상세정보를 조회한다.
     *
     * @param bannerId 조회할 배너의 ID
     * @return 배너 상세정보
     */
    @Override
    public Map<String, Object> selectBannerDetail(String bannerId) {
        return bannerSysMapper.selectBannerDetail(bannerId);
    }
}

