package com.project.piany.controller;

import com.project.piany.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/history")
public class HistoryController {

  @Autowired
  private HistoryService historyService;

  @PostMapping("/save")
  public String save(@RequestParam String imp_uid) {
    System.out.println("imp_uid = " + imp_uid);

    return null;
  }
}
