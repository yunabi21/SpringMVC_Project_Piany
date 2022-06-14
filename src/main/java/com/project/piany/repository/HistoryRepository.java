package com.project.piany.repository;

import com.project.piany.dto.HistoryDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HistoryRepository {

  @Autowired
  private SqlSessionTemplate sql;

  public int save(HistoryDTO historyDTO) {
    System.out.println("HistoryRepository.save");
    return sql.insert("History.save", historyDTO);
  }
}
