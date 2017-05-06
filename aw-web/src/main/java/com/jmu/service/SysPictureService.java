package com.jmu.service;

import com.jmu.domain.User;

import java.util.List;

/**
 * Created by zzr on 2017/5/4.
 */
public interface SysPictureService {

    List getAll(String companyId,User user);
}
