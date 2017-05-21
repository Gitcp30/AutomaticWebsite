package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.MessageBoard;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageBoardMapper extends BaseMapper<MessageBoard> {

    int batchDeleteByCompanyId(String[] companyIds);
}