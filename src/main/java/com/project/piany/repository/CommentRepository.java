package com.project.piany.repository;

import com.project.piany.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {

  @Autowired
  private SqlSessionTemplate sql;

  public List<CommentDTO> findAll(Long boardId) {
    System.out.println("CommentRepository.findAll");
    return sql.selectList("Comment.findAll", boardId);
  }

  public void save(CommentDTO commentDTO) {
    System.out.println("CommentRepository.save");
    sql.insert("Comment.save", commentDTO);
  }
}
