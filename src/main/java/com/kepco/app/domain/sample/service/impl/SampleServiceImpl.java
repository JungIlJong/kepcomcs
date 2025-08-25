package com.kepco.app.domain.sample.service.impl;

import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.core.vo.ComSearchVO;
import com.kepco.app.domain.sample.dto.SampleSearchRequest;
import com.kepco.app.domain.sample.mapper.SampleMapper;
import com.kepco.app.domain.sample.service.SampleService;

import java.util.*;

@RequiredArgsConstructor
@Service
public class SampleServiceImpl extends EgovAbstractServiceImpl implements SampleService {
    private final SampleMapper sampleMapper;

    @Override
    public List<?> searchList(ComSearchVO comSearchVO) {
        return sampleMapper.selectSampleList((SampleSearchRequest) comSearchVO);
    }

    @Override
    public int searchTotCnt(ComSearchVO comSearchVO) {
        return sampleMapper.countSample((SampleSearchRequest) comSearchVO);
    }
}
