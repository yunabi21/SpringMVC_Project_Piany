package com.project.piany.controller;

import com.project.piany.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MemberController {

  @Autowired
  private MemberService memberService;
}
