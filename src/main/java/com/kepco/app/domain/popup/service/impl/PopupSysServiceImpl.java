package com.kepco.app.domain.popup.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.domain.atchfile.dto.InsertAtchFile;
import com.kepco.app.domain.atchfile.service.FileService;
import com.kepco.app.domain.popup.dto.SysPopup;
import com.kepco.app.domain.popup.mapper.PopupSysMapper;
import com.kepco.app.domain.popup.service.PopupSysService;

import java.io.File;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 팝업을 관리하기 위한 서비스 구현체
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
@Service("popupSysService")
public class PopupSysServiceImpl extends EgovAbstractServiceImpl implements PopupSysService {
    private final PopupSysMapper popupSysMapper;
    private final FileService fileService;

    private final String path;

    public PopupSysServiceImpl(Environment env, FileService fileService, PopupSysMapper popupSysMapper) {
        this.path = env.getProperty("Globals.fileStorePath", String.class);
        this.fileService = fileService;
        this.popupSysMapper = popupSysMapper;
    }

    /**
     * 팝업을 등록한다.
     *
     * @param popup 팝업 DTO
     * @throws FdlException
     */
    @Override
    @Transactional
    public void insertPopup(SysPopup popup) throws FdlException {
        StringBuilder sb = new StringBuilder();
        popupSysMapper.insertPopup(popup);
        InsertAtchFile popupBanner = InsertAtchFile.builder()
                .file(popup.getImgFile())
                .fileSe("POPUP")
                .path(sb.append(path).append(File.separator).append("popup").append(File.separator).append(LocalDate.now().toString()).toString())
                .frstRegisterId(popup.getFrstRegisterId())
                .upperId(popup.getPopupId())
                .build();

        fileService.insertAtchfile(popupBanner);
    }

    /**
     * 팝업을 수정한다.
     *
     * @param popup 팝업 DTO
     * @throws FdlException
     */
    @Override
    @Transactional
    public void updatePopup(SysPopup popup) throws FdlException {
        if(!popup.getImgFile().isEmpty()) {
            StringBuilder sb = new StringBuilder();
            fileService.deleteAtchfileByUpperId(popup.getPopupId());
            InsertAtchFile popupBanner = InsertAtchFile.builder()
                    .file(popup.getImgFile())
                    .fileSe("POPUP")
                    .path(sb.append(path).append(File.separator).append("popup").append(File.separator).append(LocalDate.now().toString()).toString())
                    .frstRegisterId(popup.getFrstRegisterId())
                    .upperId(popup.getPopupId())
                    .build();
            fileService.insertAtchfile(popupBanner);
        }
        popupSysMapper.updatePopup(popup);
    }

    /**
     * 팝업을 삭제한다.
     *
     * @param popupId 삭제할 팝업 ID
     */
    @Override
    public void deletePopup(String popupId) {
        popupSysMapper.deletePopup(popupId);
        fileService.deleteAtchfileByUpperId(popupId);
    }

    /**
     *  팝업 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 조회 결과
     */
    @Override
    public List<Map<String, Object>> selectPopupList(Map<String, Object> paramMap) {
        return popupSysMapper.selectPopupList(paramMap);
    }

    /**
     * 팝업 상세 정보를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 총 갯수
     */
    @Override
    public int selectPopupListTotCnt(Map<String, Object> paramMap) {
        return popupSysMapper.selectPopupListTotCnt(paramMap);
    }

    /**
     * 팝업 상세 정보를 조회한다.
     *
     * @param popupId 팝업 ID
     * @return 상세 정보
     */
    @Override
    public Map<String, Object> selectPopupDetail(String popupId) {
        return popupSysMapper.selectPopupDetail(popupId);
    }

    /**
     * 게시 상태(Y)인 팝업 개수를 조회한다.
     *
     * @return 게시 중인 팝업 개수
     */
    @Override
    public int selectActivePopupCount() {
        return popupSysMapper.selectActivePopupCount();
    }
}
