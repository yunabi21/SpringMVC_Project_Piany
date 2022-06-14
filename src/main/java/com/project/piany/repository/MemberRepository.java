package com.project.piany.repository;

import com.project.piany.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {

  @Autowired
  private SqlSessionTemplate sql;

  public MemberDTO login(MemberDTO memberDTO) {
    System.out.println("MemberRepository.login");
    return sql.selectOne("Member.login", memberDTO);
  }

  public int save(MemberDTO memberDTO) {
    System.out.println("MemberRepository.save");
    return sql.insert("Member.save", memberDTO);
  }

  public MemberDTO findMemberId(String memberEmail) {
    System.out.println("MemberRepository.findMemberId");
    return sql.selectOne("Member.findMemberId", memberEmail);
  }

  public MemberDTO findMemberPw(MemberDTO memberDTO) {
    System.out.println("MemberRepository.findMemberPw");
    return sql.selectOne("Member.findMemberPw", memberDTO);
  }

  public MemberDTO findById(Long id) {
    System.out.println("MemberRepository.findById");
    return sql.selectOne("Member.findById", id);
  }

  public int passwordConfirm(MemberDTO memberDTO) {
    System.out.println("MemberRepository.passwordConfirm");
    return sql.selectOne("Member.passwordConfirm", memberDTO);
  }

  public void delete(Long id) {
    System.out.println("MemberRepository.delete");
    sql.delete("Member.delete", id);
  }

  public void update(MemberDTO memberDTO) {
    System.out.println("MemberRepository.update");
    sql.update("Member.update", memberDTO);
  }

  public MemberDTO duplicateCheck(String memberId) {
    System.out.println("MemberRepository.duplicateCheck");
    return sql.selectOne("Member.duplicateCheck", memberId);
  }
}
