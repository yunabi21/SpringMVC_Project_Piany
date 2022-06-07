package com.project.piany.controller;

import com.project.piany.dto.MemberDTO;
import com.project.piany.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

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

    boolean saveResult = memberService.save(memberDTO);
    if (saveResult) {
      System.out.println("회원가입 성공");
      return "/member/login";
    } else {
      System.out.println("회원가입 실패");
      return "index";
    }
  }

  @GetMapping("/login")
  public String loginForm() {
    System.out.println("MemberController.login");
    return "/member/login";
  }

  @PostMapping("/login")
  public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model) {
    System.out.println("MemberController.login");

    MemberDTO loginMemberDTO = memberService.login(memberDTO);
    if (loginMemberDTO != null) {
      session.setAttribute("loginId", loginMemberDTO.getId());
      session.setAttribute("loginMemberId", loginMemberDTO.getMemberId());

      return "index";
    } else {
      String msg = "아이디 또는 비밀번호가 다릅니다.";
      model.addAttribute("msg", msg);

      return "/member/login";
    }
  }

  @GetMapping("/logout")
  public String logout(HttpSession session) {
    System.out.println("MemberController.logout");

    session.invalidate();
    return "index";
  }

  @GetMapping("/findMemberId")
  public String findMemberId() {
    System.out.println("MemberController.findMemberId");
    return "/member/findMemberId";
  }

  @PostMapping("/findMemberId")
  public @ResponseBody MemberDTO findMemberId(@RequestParam("memberEmail") String memberEmail) {
    System.out.println("MemberController.findMemberId");

    MemberDTO memberDTO = null;
    memberDTO = memberService.findMemberId(memberEmail);
    return memberDTO;
  }

  @GetMapping("/findMemberPw")
  public String findMemberPw() {
    System.out.println("MemberController.findMemberPw");
    return "/member/findMemberPw";
  }

  @PostMapping("/findMemberPw")
  public @ResponseBody MemberDTO findMemberPw(@ModelAttribute MemberDTO memberDTO) {
    System.out.println("MemberController.findMemberPw");
    return memberService.findMemberPw(memberDTO);
  }

  @GetMapping("/detail")
  public String detail(@RequestParam("id") Long id, Model model) {
    System.out.println("MemberController.detail");

    MemberDTO member = memberService.findById(id);
    model.addAttribute("member", member);
    return "/member/detail";
  }

  @GetMapping("/passwordConfirm")
  public String passwordConfirm(@RequestParam("id") Long id, Model model) {
    System.out.println("MemberController.passwordConfirm");

    model.addAttribute("id", id);
    return "/member/passwordConfirm";
  }

  @PostMapping("/passwordConfirm")
  public String passwordConfirm(@ModelAttribute MemberDTO memberDTO) {
    System.out.println("MemberController.passwordConfirm");

    return memberService.passwordConfirm(memberDTO);
  }
}
