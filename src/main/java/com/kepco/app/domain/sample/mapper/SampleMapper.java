package com.kepco.app.domain.sample.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kepco.app.domain.sample.dto.SampleSearchRequest;
import com.kepco.app.domain.sample.dto.SampleSearchResponse;

import java.util.List;
import java.util.Map;

@Mapper
public interface SampleMapper {

    /* 1. 단건 조회 */
    SampleSearchResponse selectSample(@Param("id") Long id);

    /* 2. 목록 조회 (조건+페이징) */
    List<SampleSearchResponse> selectSampleList(SampleSearchRequest sampleSearchRequest);

    /* 3. 총 개수 */
    int countSample(SampleSearchRequest sampleSearchRequest);

    /* 4. 등록 */
    int insertSample(Map<String, Object> params);

    /* 5. 수정 */
    int updateSample(Map<String, Object> params);

    /* 6. 삭제 */
    int deleteSample(@Param("id") Long id);
}
