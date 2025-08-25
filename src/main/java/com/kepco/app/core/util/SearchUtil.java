package com.kepco.app.core.util;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import com.kepco.app.core.service.ComSearchService;
import com.kepco.app.core.vo.ComSearchVO;
import com.kepco.app.core.vo.ListResponseVO;

import java.util.Map;

/**
 * 검색 Util 클래스
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
public class SearchUtil {

    /**
     * PaginationInfo 생성
     *
     * @param searchVO 조회할 정보가 담긴 Map
     * @return
     */
    public static PaginationInfo init(Map<String, Object> searchVO) {
        


        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(Integer.parseInt(searchVO.get("pageIndex").toString()));
        paginationInfo.setRecordCountPerPage(Integer.parseInt(searchVO.get("pageUnit").toString()));
        if (searchVO.get("pageSize") != null) {
            paginationInfo.setPageSize(Integer.parseInt(searchVO.get("pageSize").toString()));
        }

        searchVO.put("firstIndex", paginationInfo.getFirstRecordIndex());
        searchVO.put("lastIndex", paginationInfo.getLastRecordIndex());
        searchVO.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());

        return paginationInfo;
    }

    public static PaginationInfo init(ComSearchVO comSearchVO) {
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(comSearchVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(comSearchVO.getRecordCountPerPage());
        paginationInfo.setPageSize(comSearchVO.getPageSize());

        comSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        comSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
        comSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        return paginationInfo;
    }

    public static ListResponseVO search(ComSearchVO comSearchVO, ComSearchService comSearchService) {
        ListResponseVO listResponseVO = new ListResponseVO();
        PaginationInfo paginationInfo = init(comSearchVO);
        listResponseVO.setData(comSearchService.searchList(comSearchVO));
        paginationInfo.setTotalRecordCount(comSearchService.searchTotCnt(comSearchVO));
        listResponseVO.setPaginationInfo(paginationInfo);
        return listResponseVO;
    }
}
