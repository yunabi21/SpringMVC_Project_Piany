package com.project.piany.service;

import com.project.piany.dto.BoardDTO;
import com.project.piany.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {

  @Autowired
  private BoardRepository boardRepository;

  public BoardDTO findById(Long id) {
    System.out.println("BoardService.findById");
    return boardRepository.findById(id);
  }
}
