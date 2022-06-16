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

  @PostMapping("/save") // 댓글 저장 처리
  public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO) {
    System.out.println("CommentController.save");

    commentService.save(commentDTO);
    return commentService.findAll(commentDTO.getBoardId());
  }

  @GetMapping("/delete")  // 댓글 삭제 처리
  public @ResponseBody List<CommentDTO> delete(@RequestParam("id") Long id,
                                               @RequestParam("boardId") Long boardId) {
    System.out.println("CommentController.delete");

    commentService.delete(id);
    return commentService.findAll(boardId);
  }

  @PostMapping("/update") // 댓글 수정 처리
  public void update(@ModelAttribute CommentDTO commentDTO) {
    System.out.println("CommentController.update");

    commentService.update(commentDTO);
  }
}
