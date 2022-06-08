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
    System.out.println("BoardController.save");

    boardService.save(boardDTO);
    return "redirect:/board/list";
  }

  @GetMapping("/delete")
  public String delete(@RequestParam("id") Long id) {
    System.out.println("BoardController.delete");

    boardService.delete(id);
    return "redirect:/board/list";
  }

  @GetMapping("/update")
  public String update(@RequestParam("id") Long id, Model model) {
    System.out.println("BoardController.update");

    BoardDTO boardDTO = boardService.findById(id);
    model.addAttribute("board", boardDTO);
    return "/board/update";
  }

  @PostMapping("/update")
  public String update(@ModelAttribute BoardDTO boardDTO) {
    System.out.println("BoardController.update");

    boardService.update(boardDTO);
    return "redirect:/board/list";
  }
}
