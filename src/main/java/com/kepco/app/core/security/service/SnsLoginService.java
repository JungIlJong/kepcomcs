package com.kepco.app.core.security.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.domain.login.mapper.SnsLoginMapper;
import com.kepco.app.domain.mbr.dto.Mbr;
import com.kepco.app.domain.mbr.service.MbrService;

import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class SnsLoginService {
    private final SnsLoginMapper snsLoginMapper;
    private final PasswordEncoder passwordEncoder;
    private final MbrService mbrService;

    /**
     * 소셜계정 정보 조회
     * @param param
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectSnsMemberInfo(Map<String, Object> param) {
        return snsLoginMapper.selectSnsMemberInfo(param);
    }

    /**
     * 소셜계정 정보 입력
     * @param param
     * @return
     * @throws Exception
     */
    public int insertMberSns(Map<String, Object> param) {
        return snsLoginMapper.insertMberSns(param);
    }

    /**
     * 일반가입 회원 정보 조회
     * @param param
     * @return
     * @throws Exception
     */
    public Map<String, Object> checkMberExist(Map<String, Object> param) {
        String pw = String.valueOf(param.get("password"));
        param.put("password", passwordEncoder.encode(pw));
        return snsLoginMapper.checkMberExist(param);
    }

    @Transactional
    public void joinMbr(Map<String, Object> param) {
        Mbr mbr = mbrService.insertMbr(param);
        // 새로운 수정 가능한 맵 생성
        Map<String, Object> snsMap = new HashMap<>(param);
        snsMap.put("mbrId", mbr.getMbrId());
        snsLoginMapper.insertMberSns(snsMap);
    }
}
