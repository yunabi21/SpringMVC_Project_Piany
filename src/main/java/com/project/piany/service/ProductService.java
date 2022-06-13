package com.project.piany.service;

import com.project.piany.dto.ImageDTO;
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

  public ProductDTO findById(Long id) {
    System.out.println("ProductService.findById");
    return productRepository.findById(id);
  }

  public void saveImg(ImageDTO imageDTO) throws IOException {
    System.out.println("ProductService.saveImg");

    MultipartFile productDetailImage = imageDTO.getImageFile();
    String productDetailImageName = productDetailImage.getOriginalFilename();
    productDetailImageName = System.currentTimeMillis() + "-" + productDetailImageName;
    String savePath = "D:\\project_img\\product\\" + productDetailImageName;

    if (!productDetailImage.isEmpty()) {
      imageDTO.setImageFileName(productDetailImageName);
      productDetailImage.transferTo(new File(savePath));
    }

    productRepository.saveImg(imageDTO);
  }

  public List<ImageDTO> findByProductId(Long id) {
    System.out.println("ProductService.findByProductId");
    return productRepository.findByProductId(id);
  }

  public ProductDTO findByProductIdForCart(Long id) {
    System.out.println("ProductService.findByProductIdForCart");
    return productRepository.findByProductIdForCart(id);
  }
}
