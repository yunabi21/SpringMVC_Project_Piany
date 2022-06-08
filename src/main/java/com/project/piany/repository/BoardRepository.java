package com.project.piany.repository;

import com.project.piany.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {

  @Autowired
  private SqlSessionTemplate sql;

  public BoardDTO findById(Long id) {
    System.out.println("BoardRepository.findById");
    sql.update("Board.updateHits", id);
    return sql.selectOne("Board.findById", id);
  }

  public void save(BoardDTO boardDTO) {
    System.out.println("BoardRepository.save");
    sql.insert("Board.save", boardDTO);
  }

  public List<BoardDTO> findAll() {
    System.out.println("BoardRepository.findAll");
    return sql.selectList("Board.findAll");
  }
}
