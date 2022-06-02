package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HistoryDTO {
  private Long id;
  private String memberId;
  private Long productId;
  private Integer productQuantity;
  private Integer productPrice;
  private Timestamp historyCreatedDate;
}
