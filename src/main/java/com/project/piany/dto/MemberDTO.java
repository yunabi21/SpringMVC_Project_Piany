package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.ResultHandler;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
  private Long id;
  private String memberId;
  private String memberPassword;
  private String memberName;
  private String memberEmail;
  private String memberMobile;
  private String memberZipCode;
  private String memberAddress1;
  private String memberAddress2;
}
