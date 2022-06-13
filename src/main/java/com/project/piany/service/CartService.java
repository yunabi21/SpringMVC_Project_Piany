package com.project.piany.service;

import com.project.piany.dto.CartDTO;
import com.project.piany.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

  @Autowired
  private CartRepository cartRepository;

  public String save(CartDTO cartDTO) {
    System.out.println("CartService.save");

    return cartRepository.save(cartDTO);
  }
}
