package com.project.piany.controller;

import com.project.piany.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class CartController {

  @Autowired
  private CartService cartService;
}
