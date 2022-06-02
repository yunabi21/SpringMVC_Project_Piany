package com.project.piany.controller;

import com.project.piany.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class CommentController {

  @Autowired
  private CommentService commentService;
}
