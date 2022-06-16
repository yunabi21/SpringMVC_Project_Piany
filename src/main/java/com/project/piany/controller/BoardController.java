package com.project.piany.controller;

import com.project.piany.dto.BoardDTO;
import com.project.piany.dto.CommentDTO;
import com.project.piany.dto.PageDTO;
import com.project.piany.service.BoardService;
import com.project.piany.service.CommentService;
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

  @Autowired
  private CommentService commentService;

  @GetMapping("/list")  // 글 목록
  public String list(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                     Model model) {
    System.out.println("BoardController.list");

    List<BoardDTO> boardDTOList = boardService.findAll(page);
    PageDTO pageDTO = boardService.paging(page);

    model.addAttribute("boardList", boardDTOList);
    model.addAttribute("paging", pageDTO);
    return "/board/list";
  }

  @GetMapping("/detail")  // 글 상세정보
  public String detail(@RequestParam("id") Long id,
                       @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                       Model model) {
    System.out.println("BoardController.detail");

    BoardDTO boardDTO = boardService.findById(id);
    List<CommentDTO> commentDTOList = commentService.findAll(id);

    model.addAttribute("board", boardDTO);
    model.addAttribute("page", page);
    model.addAttribute("commentList", commentDTOList);
    return "/board/detail";
  }

  @GetMapping("/save")  // 글 저장 화면 이동
  public String save() {
    System.out.println("BoardController.save");
    return "/board/save";
  }

  @PostMapping("/save") // 글 저장 처리
  public String save(@ModelAttribute BoardDTO boardDTO) {
    System.out.println("BoardController.save");

    boardService.save(boardDTO);
    return "redirect:/board/list";
  }

  @GetMapping("/delete")  // 글 삭제
  public String delete(@RequestParam("id") Long id) {
    System.out.println("BoardController.delete");

    boardService.delete(id);
    return "redirect:/board/list";
  }

  @GetMapping("/update")  // 글 수정 화면 이동
  public String update(@RequestParam("id") Long id, Model model) {
    System.out.println("BoardController.update");

    BoardDTO boardDTO = boardService.findById(id);
    model.addAttribute("board", boardDTO);
    return "/board/update";
  }

  @PostMapping("/update") // 글 수정 처리
  public String update(@ModelAttribute BoardDTO boardDTO,
                       @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    System.out.println("BoardController.update");

    boardService.update(boardDTO);
    return "redirect:/board/detail?id=" + boardDTO.getId() + "&page=" + page;
  }
}
