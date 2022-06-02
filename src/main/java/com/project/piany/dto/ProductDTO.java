package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
  private Long id;
  private String productName;
  private String productContents;
  private Integer productPrice;
  private Integer productStock;
  private String productImageName;
  private List<MultipartFile> productImage;
}
