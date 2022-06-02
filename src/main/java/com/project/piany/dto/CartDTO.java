package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDTO {
  private Long id;
  private String memberId;
  private Long productId;
  private Integer productQuantity;
}
