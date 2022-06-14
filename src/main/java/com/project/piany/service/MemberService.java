package com.project.piany.service;

import com.project.piany.dto.MemberDTO;
import com.project.piany.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

  @Autowired
  private MemberRepository memberRepository;

  public MemberDTO login(MemberDTO memberDTO) {
    System.out.println("MemberService.login");
    return memberRepository.login(memberDTO);
  }

  public boolean save(MemberDTO memberDTO) {
    System.out.println("MemberService.save");

    int saveResult = memberRepository.save(memberDTO);
    return saveResult > 0;
  }

  public MemberDTO findMemberId(String memberEmail) {
    System.out.println("MemberService.findMemberId");
    return memberRepository.findMemberId(memberEmail);
  }

  public MemberDTO findMemberPw(MemberDTO memberDTO) {
    System.out.println("MemberService.findMemberPw");
    return memberRepository.findMemberPw(memberDTO);
  }

  public MemberDTO findById(Long id) {
    System.out.println("MemberService.findById");
    return memberRepository.findById(id);
  }

  public String passwordConfirm(MemberDTO memberDTO) {
    System.out.println("MemberService.passwordConfirm");

    int result = memberRepository.passwordConfirm(memberDTO);
    String confirmResult;
    if (result > 0) {
      confirmResult = "ok";
    } else {
      confirmResult = "no";
    }
    return confirmResult;
  }

  public String passwordConfirm2(MemberDTO memberDTO) {
    System.out.println("MemberService.passwordConfirm2");

    int result = memberRepository.passwordConfirm(memberDTO);
    String confirmResult;
    if (result > 0) {
      confirmResult = "yes";
    } else {
      confirmResult = "no";
    }
    return confirmResult;
  }

  public void delete(Long id) {
    System.out.println("MemberService.delete");
    memberRepository.delete(id);
  }

  public void update(MemberDTO memberDTO) {
    System.out.println("MemberService.update");
    memberRepository.update(memberDTO);
  }

  public String duplicateCheck(String memberId) {
    System.out.println("MemberService.duplicateCheck");

    MemberDTO memberDTO = memberRepository.duplicateCheck(memberId);
    String result;
    if (memberDTO != null) {
      result = "no";
    } else {
      result = "ok";
    }
    return result;
  }
}
