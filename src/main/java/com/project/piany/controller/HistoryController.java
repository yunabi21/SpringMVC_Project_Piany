package com.project.piany.controller;

import com.project.piany.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class HistoryController {

  @Autowired
  private HistoryService historyService;
}
