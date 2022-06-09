package com.project.piany.controller;

import com.project.piany.dto.ProductDTO;
import com.project.piany.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

  @Autowired
  private ProductService productService;

  @GetMapping("/list")
  public String list(Model model) {
    System.out.println("ProductController.list");

    List<ProductDTO> productDTOList = productService.findAll();
    model.addAttribute("productList", productDTOList);
    return "/product/list";
  }

  @GetMapping("/save")
  public String save() {
    System.out.println("ProductController.save");
    return "/product/save";
  }

  @PostMapping("/save")
  public String save(@ModelAttribute ProductDTO productDTO) throws IOException {
    System.out.println("ProductController.save");

    System.out.println("productDTO = " + productDTO);
    productService.save(productDTO);
    return "/product/list";
  }
}
