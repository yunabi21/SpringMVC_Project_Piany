package com.project.piany.controller;

import com.project.piany.dto.CommentDTO;
import com.project.piany.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
