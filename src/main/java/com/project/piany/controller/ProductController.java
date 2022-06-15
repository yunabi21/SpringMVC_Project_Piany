package com.project.piany.controller;

import com.project.piany.dto.ImageDTO;
import com.project.piany.dto.MemberDTO;
import com.project.piany.dto.ProductDTO;
import com.project.piany.service.MemberService;
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

  @Autowired
  private MemberService memberService;

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
    return "redirect:/product/list";
  }

  @GetMapping("/detail")
  public String detail(@RequestParam("id") Long id,
                       Model model) {
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

  @GetMapping("/confirmBeforePay")
  public String confirmBeforePay(@RequestParam("id") Long id,
                                 @RequestParam("memberId") String memberId,
                                 @RequestParam("productQuantity") int productQuantity,
                                 Model model) {
    System.out.println("ProductController.confirmBeforePay");

    MemberDTO memberDTO = memberService.findByMemberId(memberId);
    ProductDTO productDTO = productService.findById(id);

    model.addAttribute("member", memberDTO);
    model.addAttribute("product", productDTO);
    model.addAttribute("quantity", productQuantity);
    return "/product/confirmBeforePay";
  }

  @PostMapping("/updateQuantity")
  public @ResponseBody String updateQuantity(@RequestParam("productId") Long productId,
                                             @RequestParam("productQuantity") Integer productQuantity) {
    System.out.println("ProductController.updateQuantity");

    return productService.updateQuantity(productId, productQuantity);
  }

  @GetMapping("/delete")
  public String delete(@RequestParam("id") Long id) {
    System.out.println("ProductController.delete");

    productService.delete(id);
    return "redirect:/product/list";
  }

  @GetMapping("/search")
  public String search(@RequestParam("query") String query, Model model) {
    System.out.println("ProductController.search");

    List<ProductDTO> productDTOList = productService.search(query);
    model.addAttribute("productList", productDTOList);

    return "/product/list";
  }
}
