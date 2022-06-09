package com.project.piany.service;

import com.project.piany.dto.CommentDTO;
import com.project.piany.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {

  @Autowired
  private CommentRepository commentRepository;

  public List<CommentDTO> findAll(Long boardId) {
    System.out.println("CommentService.findAll");
    return commentRepository.findAll(boardId);
  }

  public void save(CommentDTO commentDTO) {
    System.out.println("CommentService.save");
    commentRepository.save(commentDTO);
  }

  public void delete(Long id) {
    System.out.println("CommentService.delete");
    commentRepository.delete(id);
  }

  public void update(CommentDTO commentDTO) {
    System.out.println("CommentService.update");
    commentRepository.update(commentDTO);
  }
}
