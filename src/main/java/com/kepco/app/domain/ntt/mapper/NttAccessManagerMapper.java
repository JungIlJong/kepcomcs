package com.kepco.app.domain.ntt.mapper;

import com.kepco.app.domain.ntt.service.impl.NttAccessManagerImpl;

public interface NttAccessManagerMapper {
    NttAccessManagerImpl.Access getNttValidation(Long id);

    boolean isExist(Long nttId);
}
