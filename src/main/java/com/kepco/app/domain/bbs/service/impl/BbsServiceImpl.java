package com.kepco.app.domain.bbs.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.bbs.dto.SearchBbs;
import com.kepco.app.domain.bbs.mapper.BbsMapper;
import com.kepco.app.domain.bbs.service.BbsService;

import java.util.List;
import java.util.Map;

/**
 * 사용자가 게시판을 조회하기 위한 서비스 구현체
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
 *   2024.03.30  김선홍         최초 생성
 * </pre>
 */
@Slf4j
@RequiredArgsConstructor
@Service("bbsService")
public class BbsServiceImpl extends EgovAbstractServiceImpl implements BbsService {

    private final BbsMapper bbsMapper;

    /**
     * 게시판의 상세정보를 조회한다.
     *
     * @param bbsId 게시글 ID
     * @return 게시글 상세정보
     */
    @Override
    public SearchBbs selectBbsDetail(Long bbsId) {
        return bbsMapper.selectBbsDetail(bbsId, UserDetailsUtil.isAuthenticated());
    }
}
