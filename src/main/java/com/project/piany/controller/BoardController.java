package com.project.piany.controller;

import com.project.piany.dto.BoardDTO;
import com.project.piany.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

  @Autowired
  private BoardService boardService;

  @GetMapping("/list")
  public String list(Model model) {
    System.out.println("BoardController.list");

    List<BoardDTO> boardDTOList = boardService.findAll();
    model.addAttribute("boardList", boardDTOList);
    return "/board/list";
  }

  @GetMapping("/detail")
  public String detail(@RequestParam("id") Long id, Model model) {
    System.out.println("BoardController.detail");

    BoardDTO boardDTO = boardService.findById(id);
    model.addAttribute("board", boardDTO);
    return "/board/detail";
  }

  @GetMapping("/save")
  public String save() {
    System.out.println("BoardController.save");
    return "/board/save";
  }

  @PostMapping("/save")
  public String save(@ModelAttribute BoardDTO boardDTO) {
    boardService.save(boardDTO);
    return "redirect:/board/list";
  }
}
