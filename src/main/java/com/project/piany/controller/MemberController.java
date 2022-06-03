package com.project.piany.controller;

import com.project.piany.dto.MemberDTO;
import com.project.piany.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Autowired
  private MemberService memberService;

  @GetMapping("/save")
  public String saveForm() {
    System.out.println("MemberController.saveForm");
    return "/member/save";
  }

  @PostMapping("/save")
  public String save(MemberDTO memberDTO) {
    System.out.println("MemberController.save");

//    memberService.save(memberDTO);
    return "/member/login";
  }

  @GetMapping("/login")
  public String login() {
    return "/member/login";
  }

}
