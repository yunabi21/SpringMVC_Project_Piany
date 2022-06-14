package com.project.piany.controller;

import com.project.piany.dto.HistoryDTO;
import com.project.piany.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/history")
public class HistoryController {

  @Autowired
  private HistoryService historyService;

  @PostMapping("/save")
  public @ResponseBody String save(@ModelAttribute HistoryDTO historyDTO) {
    System.out.println("HistoryController.save");

    return historyService.save(historyDTO);
  }
}
