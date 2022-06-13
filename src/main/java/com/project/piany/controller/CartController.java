package com.project.piany.controller;

import com.project.piany.dto.CartDTO;
import com.project.piany.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/cart")
public class CartController {

  @Autowired
  private CartService cartService;

  @GetMapping("/save")
  public @ResponseBody String save(@ModelAttribute CartDTO cartDTO) {
    System.out.println("CartController.save");

    return cartService.save(cartDTO);
  }
}
