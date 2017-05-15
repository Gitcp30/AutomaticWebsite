package com.jmu.service.web;

import com.jmu.domain.WebContent;

import java.util.List;

/**
 * Created by zzr on 2017/5/7.
 */
public interface WebContentService {

    public List<WebContent> findContent(String columnId, String companyId);
}
