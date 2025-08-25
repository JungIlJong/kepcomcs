package com.daonplace.vasanta.domain.sample.service.impl;

import com.daonplace.vasanta.core.vo.ComSearchVO;
import com.daonplace.vasanta.domain.sample.dto.SampleSearchRequest;
import com.daonplace.vasanta.domain.sample.mapper.SampleMapper;
import com.daonplace.vasanta.domain.sample.service.SampleService;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

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
