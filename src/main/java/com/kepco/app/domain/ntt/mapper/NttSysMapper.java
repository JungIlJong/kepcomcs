package com.kepco.app.domain.ntt.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.ntt.dto.SysNtt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 게시글을 관리하기 위한 Mapper 인터페이스
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
@Mapper("nttSysMapper")
public interface NttSysMapper {

    /**
     * 게시글을 등록한다.
     *
     * @param ntt 게시글 DTO
     */
    void insertNtt(SysNtt ntt);

    /**
     * 게시글을 수정한다.
     *
     * @param ntt 게시글 DTO
     */
    void updateNtt(SysNtt ntt);

    /**
     * 게시글을 삭제한다.
     *
     * @param nttId 삭제될 게시글 ID
     */
    void deleteNtt(String nttId);

    /**
     * 게시글 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 조회 결과
     */
    List<Map<String, Object>> selectNttList(Map<String, Object> paramMap);

    /**
     * 게시글 총 갯수를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 총 갯수
     */
    int selectNttListTotCnt(Map<String, Object> paramMap);

    /**
     * 게시글 상세 정보를 조회한다.
     *
     * @param nttId 게시글 ID
     * @return 상세 정보
     */
    Map<String, Object> selectNttDetail(String nttId);

    Map<String, Object> selectReplyDetail(String nttId);

    void deleteByBbsId(String bbsId);

    /**
     * 조회수를 증가한다.
     *
     * @param nttId 게시글 ID
     */
    void increseRdcnt(String nttId);

    void updateNttReportIds(String nttId);
    
    List<HashMap<String, Object>> getProhibitiveWordList();
}
