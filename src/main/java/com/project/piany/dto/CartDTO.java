package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDTO {
  private Long id;  // 장바구니 번호
  private String memberId;  // 회원 아이디
  private Long productId; // 상품 아이디
  private Integer productQuantity;  // 상품 수량
}
