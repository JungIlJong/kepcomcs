package com.kepco.app.domain.ntt.service;

import com.kepco.app.domain.ntt.dto.MberNtt;

/**
 * 게시글을 생성 및 수정하는 서비스 입니다.
 */
public interface NttCommandService {

    /**
     * 게시글을 생성한다.
     *
     * @param ntt 게시글 DTO
     */
    void insertNtt(MberNtt ntt);

    /**
     * 게시글을 수정한다.
     *
     * @param ntt 게시글 DTO
     */
    void updateNtt(MberNtt ntt);

    /**
     * 게시글 조회수를 증가한다.
     *
     * @param nttId 게시글 ID
     */
    void incrementRdcnt(Long nttId);

    /**
     * 게시글을 논리삭제한다.
     *
     * @param nttId 게시글 ID
     */
    void deleteNtt(Long nttId);

    void blockNtt(Long nttId);
}
