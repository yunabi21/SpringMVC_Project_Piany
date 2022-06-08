package com.project.piany.repository;

import com.project.piany.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepository {

  @Autowired
  private SqlSessionTemplate sql;

  public BoardDTO findById(Long id) {
    System.out.println("BoardRepository.findById");
    return sql.selectOne("Board.findById", id);
  }
}
