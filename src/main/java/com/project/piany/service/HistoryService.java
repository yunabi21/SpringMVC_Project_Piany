package com.project.piany.service;

import com.project.piany.dto.HistoryDTO;
import com.project.piany.repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryService {

  @Autowired
  private HistoryRepository historyRepository;

  public String save(HistoryDTO historyDTO) {
    System.out.println("HistoryService.save");

    int result = historyRepository.save(historyDTO);
    if (result > 0) {
      return "ok";
    } else {
      return "no";
    }
  }

  public List<HistoryDTO> list(String memberId) {
    System.out.println("HistoryService.list");
    return historyRepository.list(memberId);
  }
}
