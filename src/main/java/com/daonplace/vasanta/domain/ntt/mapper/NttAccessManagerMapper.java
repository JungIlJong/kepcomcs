package com.daonplace.vasanta.domain.ntt.mapper;

import com.daonplace.vasanta.domain.ntt.service.impl.NttAccessManagerImpl;

public interface NttAccessManagerMapper {
    NttAccessManagerImpl.Access getNttValidation(Long id);

    boolean isExist(Long nttId);
}
