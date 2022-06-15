package com.project.piany.controller;

import com.project.piany.dto.HistoryDTO;
import com.project.piany.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

  @GetMapping("/list")
  public String list(@RequestParam("memberId") String memberId, Model model) {
    System.out.println("HistoryController.list");

    List<HistoryDTO> historyDTOList = historyService.list(memberId);
    model.addAttribute("historyList", historyDTOList);
    return "/history/list";
  }
}
