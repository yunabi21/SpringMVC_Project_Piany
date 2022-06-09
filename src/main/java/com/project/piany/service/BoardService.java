package com.project.piany.service;

import com.project.piany.dto.BoardDTO;
import com.project.piany.dto.PageDTO;
import com.project.piany.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

  private static final int PAGE_LIMIT = 7;
  private static final int BLOCK_LIMIT = 3;

  public List<BoardDTO> findAll(int page) {
    System.out.println("BoardService.findAll");

    int pagingStart = (page - 1) * PAGE_LIMIT;
    Map<String, Integer> pagingParam = new HashMap<>();
    pagingParam.put("start", pagingStart);
    pagingParam.put("limit", PAGE_LIMIT);
    return boardRepository.findAll(pagingParam);
  }

  public void delete(Long id) {
    System.out.println("BoardService.delete");
    boardRepository.delete(id);
  }

  public void update(BoardDTO boardDTO) {
    System.out.println("BoardService.update");
    boardRepository.update(boardDTO);
  }

  public PageDTO paging(int page) {
    System.out.println("BoardService.paging");

    int boardCount = boardRepository.boardCount();
    int startPage = ( (int) (Math.ceil( (double) page / BLOCK_LIMIT - 1))) * BLOCK_LIMIT + 1;
    int endPage = startPage + BLOCK_LIMIT - 1;
    int maxPage = (int) (Math.ceil( (double) boardCount / PAGE_LIMIT));

    if (endPage > maxPage) endPage = maxPage;

    return new PageDTO(page, startPage, endPage, maxPage);
  }
}
