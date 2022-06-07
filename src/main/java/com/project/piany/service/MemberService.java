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
}
