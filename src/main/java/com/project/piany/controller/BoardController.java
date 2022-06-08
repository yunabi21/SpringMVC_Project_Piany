package com.project.piany.controller;

import com.project.piany.dto.BoardDTO;
import com.project.piany.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board")
public class BoardController {

  @Autowired
  private BoardService boardService;

  @GetMapping("/list")
  public String list() {
    System.out.println("BoardController.list");

    return "/board/list";
  }

  @GetMapping("/detail")
  public String detail(@RequestParam("id") Long id, Model model) {
    System.out.println("BoardController.detail");

    BoardDTO boardDTO = boardService.findById(id);
    model.addAttribute("board", boardDTO);
    return "/board/detail";
  }
}
