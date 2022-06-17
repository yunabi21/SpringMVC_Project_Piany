package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
  private Long id;  // 상품 번호
  private String productName; // 상품 이름
  private String productContents; // 상품 설명
  private Integer productPrice; // 상품가격
  private Integer productStock; // 상품 재고
  private MultipartFile productImage; // 상품 이미지 파일
  private String productImageName;  // 상품 이미지 파일 이름
}
