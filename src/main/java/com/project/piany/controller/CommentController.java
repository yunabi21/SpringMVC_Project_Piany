package com.project.piany.controller;

import com.project.piany.dto.CommentDTO;
import com.project.piany.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

  @Autowired
  private CommentService commentService;

  @PostMapping("/save")
  public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO) {
    System.out.println("CommentController.save");

    commentService.save(commentDTO);
    return commentService.findAll(commentDTO.getBoardId());
  }

  @GetMapping("/delete")
  public @ResponseBody List<CommentDTO> delete(@RequestParam("id") Long id,
                                               @RequestParam("boardId") Long boardId) {
    System.out.println("CommentController.delete");

    commentService.delete(id);
    return commentService.findAll(boardId);
  }

  @PostMapping("/update")
  public void update(@RequestParam("id") Long id,
                     @ModelAttribute CommentDTO commentDTO) {
    System.out.println("CommentController.update");

    commentService.update(commentDTO);
  }
}
