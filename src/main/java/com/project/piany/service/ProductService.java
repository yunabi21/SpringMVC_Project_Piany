package com.project.piany.service;

import com.project.piany.dto.ProductDTO;
import com.project.piany.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class ProductService {

  @Autowired
  private ProductRepository productRepository;

  public void save(ProductDTO productDTO) throws IOException {
    System.out.println("ProductService.save");

    MultipartFile productImage = productDTO.getProductImage();
    String productImageName = productImage.getOriginalFilename();
    productImageName = System.currentTimeMillis() + "-" + productImageName;
    String savePath = "D:\\project_img\\product\\" + productImageName;

    if (!productImage.isEmpty()) {
      productDTO.setProductImageName(productImageName);
      productImage.transferTo(new File(savePath));
    }

    productRepository.save(productDTO);
  }

  public List<ProductDTO> findAll() {
    System.out.println("ProductService.findAll");
    return productRepository.findAll();
  }
}
