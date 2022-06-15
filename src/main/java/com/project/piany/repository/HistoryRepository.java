package com.project.piany.repository;

import com.project.piany.dto.HistoryDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HistoryRepository {

  @Autowired
  private SqlSessionTemplate sql;

  public int save(HistoryDTO historyDTO) {
    System.out.println("HistoryRepository.save");
    return sql.insert("History.save", historyDTO);
  }

  public List<HistoryDTO> list(String memberId) {
    System.out.println("HistoryRepository.list");
    return sql.selectList("History.list", memberId);
  }
}
