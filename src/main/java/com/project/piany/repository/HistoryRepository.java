package com.project.piany.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HistoryRepository {

  @Autowired
  private SqlSessionTemplate sql;
}
