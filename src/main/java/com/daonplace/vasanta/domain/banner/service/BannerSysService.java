package com.daonplace.vasanta.domain.banner.service;

import com.daonplace.vasanta.domain.banner.dto.SysBanner;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;

import java.util.List;
import java.util.Map;

/**
 * 관리자가 배너을 관리하기 위한 서비스 인터페이스
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
public interface BannerSysService {

    /**
     * 배너를 생성한다
     *
     * @param banner 배너 DTO
     * @throws FdlException
     */
    void insertBanner(SysBanner banner) throws FdlException;

    /**
     * 배너를 수정한다
     *
     * @param banner 배너 DTO
     * @throws FdlException
     */
    void updateBanner(SysBanner banner) throws FdlException;

    /**
     * 배너를 삭제한다.
     *
     * @param bannerId 삭제할 배너 ID
     */
    void deleteBanner(String bannerId);

    /**
     * 배너 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 배너 리스트
     */
    List<Map<String, Object>> selectBannerList(Map<String, Object> paramMap);

    /**
     * 배너 총 갯수를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 배너 총 갯수
     */
    int selectBannerListTotCnt(Map<String, Object> paramMap);


    /**
     * 배너 상세정보를 조회한다.
     *
     * @param bannerId 조회할 배너의 ID
     * @return 배너 상세정보
     */
    Map<String, Object> selectBannerDetail(String bannerId);
}
