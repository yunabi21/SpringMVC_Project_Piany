package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageDTO {
  private Long id;
  private Long productId;
  private MultipartFile imageFile;
  private String imageFileName;
}
