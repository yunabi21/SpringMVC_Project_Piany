package com.project.piany.controller;

import com.project.piany.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ProductController {

  @Autowired
  private ProductService productService;
}
