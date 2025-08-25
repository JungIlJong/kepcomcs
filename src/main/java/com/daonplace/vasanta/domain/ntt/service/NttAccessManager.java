package com.daonplace.vasanta.domain.ntt.service;

import com.daonplace.vasanta.domain.ntt.service.impl.NttAccessManagerImpl;

public interface NttAccessManager {

    boolean hasModifyPermission(Long id);

    boolean hasModifyPermission(Long id, String password);

    boolean hasViewPermission(Long id);

    boolean hasViewPermission(Long id, String password);

    NttAccessManagerImpl.Access getAccessInfo(Long id);
}
