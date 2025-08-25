package com.daonplace.vasanta.domain.banner.service.impl;

import com.daonplace.vasanta.domain.banner.mapper.BannerMapper;
import com.daonplace.vasanta.domain.banner.service.BannerService;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 사용자가 배너을 사용하기 위한 서비스 구현체
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
@Service("bannerService")
public class BannerServiceImpl extends EgovAbstractServiceImpl implements BannerService {
    private final BannerMapper bannerMapper;

    public BannerServiceImpl(BannerMapper bannerMapper) {
        this.bannerMapper = bannerMapper;
    }

    /**
     * 메인 배너 목록을 조회한다.
     *
     * @return 배너 목록
     */
    @Override
    public List<Map<String, Object>> selectBannerListMain() {
        return bannerMapper.selectBannerListMain();
    }
}
