package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageDTO {
  private Long id;  // 이미지 번호
  private Long productId; // 상품 번호
  private MultipartFile imageFile;  // 이미지 파일
  private String imageFileName; // 이미지 파일 이름
}
