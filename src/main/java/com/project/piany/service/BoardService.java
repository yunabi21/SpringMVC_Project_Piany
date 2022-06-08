package com.project.piany.service;

import com.project.piany.dto.BoardDTO;
import com.project.piany.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

  @Autowired
  private BoardRepository boardRepository;

  public BoardDTO findById(Long id) {
    System.out.println("BoardService.findById");
    return boardRepository.findById(id);
  }

  public void save(BoardDTO boardDTO) {
    System.out.println("BoardService.save");
    boardRepository.save(boardDTO);
  }

  public List<BoardDTO> findAll() {
    System.out.println("BoardService.findAll");
    return boardRepository.findAll();
  }
}
