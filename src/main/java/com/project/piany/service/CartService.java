package com.project.piany.service;

import com.project.piany.dto.CartDTO;
import com.project.piany.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

  @Autowired
  private CartRepository cartRepository;

  public String save(CartDTO cartDTO) {
    System.out.println("CartService.save");
    return cartRepository.save(cartDTO);
  }

  public List<CartDTO> findAll(String memberId) {
    System.out.println("CartService.findAll");
    return cartRepository.findAll(memberId);
  }

  public String delete(CartDTO cartDTO) {
    System.out.println("CartService.delete");

    int result = cartRepository.delete(cartDTO);
    if (result > 0) {
      return "ok";
    } else {
      return "no";
    }
  }
}
