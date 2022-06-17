package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HistoryDTO {
  private Long id;  // 구매 내역 번호
  private String memberId;  // 회원 아이디
  private String productName; // 상품 이름
  private Integer productQuantity;  // 상품 수량
  private Integer productPrice; // 상품 가격
  private Timestamp historyCreatedDate; // 구매 내역 생성일자
}
