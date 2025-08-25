package com.kepco.app.domain.bbs.mapper;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.bbs.dto.SearchBbs;
import com.kepco.app.domain.ntt.dto.SearchMberNtt;

import java.util.List;
import java.util.Map;

/**
 * 사용자가 게시판를 사용하기 위한 Mapper 인터페이스
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
@Mapper("bbsMapper")
public interface BbsMapper {
    SearchBbs selectBbsDetail(@Param("bbsId") Long bbsId, @Param("login") boolean login);
}
