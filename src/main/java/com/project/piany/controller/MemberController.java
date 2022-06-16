package com.project.piany.controller;

import com.project.piany.dto.MemberDTO;
import com.project.piany.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Autowired
  private MemberService memberService;

  @GetMapping("/save")  // 회원가입 페이지 요청
  public String saveForm() {
    System.out.println("MemberController.saveForm");
    return "/member/save";
  }

  @PostMapping("/save") // 회원가입 처리
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

  @GetMapping("/login") // 로그인 화면 요청
  public String loginForm() {
    System.out.println("MemberController.login");

    return "/member/login";
  }

  @PostMapping("/login")  // 로그인 처리
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

  @GetMapping("/logout")  // 로그아웃 처리
  public String logout(HttpSession session) {
    System.out.println("MemberController.logout");

    session.invalidate();
    return "index";
  }

  @GetMapping("/findMemberId")  // 아이디 찾기 화면 요청
  public String findMemberId() {
    System.out.println("MemberController.findMemberId");

    return "/member/findMemberId";
  }

  @PostMapping("/findMemberId") // 아이디 찾기 처리
  public @ResponseBody MemberDTO findMemberId(@RequestParam("memberEmail") String memberEmail) {
    System.out.println("MemberController.findMemberId");

    MemberDTO memberDTO = null;
    memberDTO = memberService.findMemberId(memberEmail);
    return memberDTO;
  }

  @GetMapping("/findMemberPw")  // 비밀번호 찾기 화면 요청
  public String findMemberPw() {
    System.out.println("MemberController.findMemberPw");

    return "/member/findMemberPw";
  }

  @PostMapping("/findMemberPw") // 비밀번호 찾기 처리
  public @ResponseBody MemberDTO findMemberPw(@ModelAttribute MemberDTO memberDTO) {
    System.out.println("MemberController.findMemberPw");

    return memberService.findMemberPw(memberDTO);
  }

  @GetMapping("/detail")  // 회원 상세정보 화면 요청
  public String detail(@RequestParam("id") Long id, Model model) {
    System.out.println("MemberController.detail");

    MemberDTO member = memberService.findById(id);
    model.addAttribute("member", member);
    return "/member/detail";
  }

  @GetMapping("/passwordConfirm") // 비밀번호 확인 화면 요청
  public String passwordConfirm(@RequestParam("id") Long id, Model model) {
    System.out.println("MemberController.passwordConfirm");

    model.addAttribute("id", id);
    return "/member/passwordConfirm";
  }

  @PostMapping("/passwordConfirm")  // 비밀번호 확인 처리
  public @ResponseBody String passwordConfirm(@ModelAttribute MemberDTO memberDTO) {
    System.out.println("MemberController.passwordConfirm");

    return memberService.passwordConfirm(memberDTO);
  }

  @GetMapping("/passwordConfirm2")  // 비밀번호 확인 화면 요청
  public String passwordConfirm2(@RequestParam("id") Long id, Model model) {
    System.out.println("MemberController.passwordConfirm2");

    model.addAttribute("id", id);
    return "/member/passwordConfirm2";
  }

  @PostMapping("/passwordConfirm2") // 비밀번호 확인 처리
  public @ResponseBody String passwordConfirm2(@ModelAttribute MemberDTO memberDTO) {
    System.out.println("MemberController.passwordConfirm2");

    return memberService.passwordConfirm2(memberDTO);
  }

  @GetMapping("/delete")  // 회원 탈퇴 처리
  public String delete(@RequestParam("id") Long id, HttpSession session) {
    System.out.println("MemberController.delete");

    memberService.delete(id);
    session.invalidate();
    return "index";
  }

  @GetMapping("/update")  // 회원 정보 수정 화면 요청
  public String update(@RequestParam("id") Long id, Model model) {
    System.out.println("MemberController.update");

    MemberDTO memberDTO = memberService.findById(id);
    model.addAttribute("member", memberDTO);
    return "/member/update";
  }

  @PostMapping("/update") // 회원 정보 수정 처리
  public String update(@ModelAttribute MemberDTO memberDTO) {
    System.out.println("MemberController.update");

    memberService.update(memberDTO);
    return "redirect:/member/detail?id=" + memberDTO.getId();
  }

  @PostMapping("/duplicateCheck") // 아이디 중복체크
  public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
    System.out.println("MemberController.duplicateCheck");

    return memberService.duplicateCheck(memberId);
  }

  @PostMapping("/findByMemberId") // 회원아이디 기준 회원 찾기
  public @ResponseBody MemberDTO findByMemberId(@RequestParam("memberId") String memberId) {
    System.out.println("MemberController.findByMemberId");

    return memberService.findByMemberId(memberId);
  }

  @GetMapping("/list")  // 회원 리스트 화면 요청
  public String list(Model model) {
    System.out.println("MemberController.list");

    List<MemberDTO> memberDTOList = memberService.list();

    model.addAttribute("memberList", memberDTOList);
    return "/member/list";
  }

  @GetMapping("/deleteByAdmin") // 회원 삭제 처리
  public String deleteByAdmin(@RequestParam("id") Long id) {
    System.out.println("MemberController.delete");

    memberService.delete(id);
    return "redirect:/member/list";
  }
}
