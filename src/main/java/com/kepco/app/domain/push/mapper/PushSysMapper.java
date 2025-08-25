package com.kepco.app.domain.push.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.push.dto.PushLog;
import com.kepco.app.domain.push.dto.XlsxPushLog;

import java.util.List;
import java.util.Map;

@Mapper("pushSysMapper")
public interface PushSysMapper {
    List<Map<String, Object>> selectPushList(Map<String, Object> searchMap);

    int selectPushListTotCnt(Map<String, Object> searchMap);

    void insertPushLog(PushLog pushLog);

    PushLog selectPushLogXlsx(Map<String, Object> paramMap);
}
