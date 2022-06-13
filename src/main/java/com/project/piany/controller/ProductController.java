package com.project.piany.controller;

import com.project.piany.dto.ImageDTO;
import com.project.piany.dto.ProductDTO;
import com.project.piany.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

  @GetMapping("/detail")
  public String detail(@RequestParam("id") Long id, Model model) {
    System.out.println("ProductController.detail");

    ProductDTO productDTO = productService.findById(id);
    List<ImageDTO> imageDTOList = productService.findByProductId(id);
    model.addAttribute("product", productDTO);
    model.addAttribute("imageList", imageDTOList);
    return "/product/detail";
  }

  @GetMapping("/saveImg")
  public String saveImg(@RequestParam("id") Long productId, Model model) {
    System.out.println("ProductController.saveImg");

    model.addAttribute("productId", productId);
    return "/product/saveImg";
  }

  @PostMapping("/saveImg")
  public String saveImg(@ModelAttribute ImageDTO imageDTO) throws IOException {
    System.out.println("ProductController.saveImg");

    productService.saveImg(imageDTO);
    return "redirect:/product/detail?id=" + imageDTO.getProductId();
  }
}
