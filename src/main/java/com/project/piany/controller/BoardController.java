package com.project.piany.controller;

import com.project.piany.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BoardController {

  @Autowired
  private BoardService boardService;
}