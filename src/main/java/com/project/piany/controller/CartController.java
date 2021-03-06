package com.project.piany.controller;

import com.project.piany.dto.CartDTO;
import com.project.piany.dto.ProductDTO;
import com.project.piany.service.CartService;
import com.project.piany.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

  @Autowired
  private CartService cartService;

  @Autowired
  private ProductService productService;

  @GetMapping("/save")  // 장바구니에 상품 저장
  public @ResponseBody String save(@ModelAttribute CartDTO cartDTO) {
    System.out.println("CartController.save");

    return cartService.save(cartDTO);
  }

  @GetMapping("/list")  // 장바구니의 상품 목록
  public String list(@RequestParam("memberId") String memberId, Model model) {
    System.out.println("CartController.list");

    List<CartDTO> cartDTOList = cartService.findAll(memberId);
    List<ProductDTO> productDTOList = new ArrayList<>();

    for (CartDTO cartDTO : cartDTOList) {
      productDTOList.add(productService.findByProductIdForCart(cartDTO.getProductId()));
    }

    model.addAttribute("productList", productDTOList);
    return "/cart/list";
  }

  @GetMapping("/delete")  // 상품 삭제
  public @ResponseBody String delete(@ModelAttribute CartDTO cartDTO) {
    System.out.println("CartController.delete");

    return cartService.delete(cartDTO);
  }
}
