package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.ResultHandler;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
  private Long id;  // 회원 번호
  private String memberId;  // 회원 아이디
  private String memberPassword;  // 회원 비밀번호
  private String memberName;  // 회원 이름
  private String memberEmail; // 회원 이메일
  private String memberMobile;  // 회원 전화번호
  private String memberZipCode; // 회원 우편번호
  private String memberAddress1;  // 회원 주소
  private String memberAddress2;  // 회원 상세주소
}
