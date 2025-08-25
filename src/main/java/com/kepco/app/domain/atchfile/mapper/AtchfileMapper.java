package com.kepco.app.domain.atchfile.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.atchfile.dto.Atchfile;

import java.util.List;
import java.util.Map;

/**
 * 파일 Mapper 인터페이스
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
@Mapper("atchfileMapper")
public interface AtchfileMapper {

    /**
     * 파일을 등록한다.
     *
     * @param file 파일 DTO
     */
    void insertAtchfile(Atchfile file);

    /**
     * 파일을 삭제한다.
     *
     * @param fileId 파일 ID
     */
    void deleteAtchfileById(String fileId);

    /**
     * 부모ID의 파일 목록을 조회한다.
     *
     * @param upperId 부모 ID
     * @return 파일 목록
     */
    List<Atchfile> selectAtchfileByUpperId(String upperId);

    /**
     * 파일 상세정보를 조회한다.
     *
     * @param fileId 파일 ID
     * @return 파일 상세정보
     */
    Atchfile selectAtchfileDetail(String fileId);

    /**
     * 부모ID의 파일을 삭제한다.
     *
     * @param upperId 부모 ID
     */
    void deleteAtchfileByUpperId(String upperId);

    /**
     * 부모 ID의 특정 파일을 조회한다.
     *
     * @param upperId  부모 ID
     * @param fileSe 파일 구분
     * @return
     */
    List<Map<String, Object>> selectAtchFile(String upperId, String fileSe);
}
