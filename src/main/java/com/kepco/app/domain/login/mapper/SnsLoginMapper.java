package com.kepco.app.domain.login.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.Map;

@Mapper
public interface SnsLoginMapper {

    /**
     * 소셜계정 정보 조회
     * @param param
     * @return
     */
    Map<String, Object> selectSnsMemberInfo(Map<String, Object> param);

    /**
     * 소셜계정 정보 입력
     * @param param
     * @return
     */
    int insertMberSns(Map<String, Object> param);

    /**
     * 일반가입 회원 정보 조회
     * @param param
     * @return
     */
    Map<String, Object> checkMberExist(Map<String, Object> param);

}
