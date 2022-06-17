package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageDTO {
  private int page; // 현재 페이지
  private int startPage;  // 시작 페이지
  private int endPage;  // 끝 페이지
  private int maxPage;  // 최대 페이지
}
