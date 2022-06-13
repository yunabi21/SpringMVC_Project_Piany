package com.project.piany.repository;

import com.project.piany.dto.CartDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartRepository {

  @Autowired
  private SqlSessionTemplate sql;

  public String save(CartDTO cartDTO) {
    System.out.println("CartRepository.save");

    CartDTO result = duplicateCheck(cartDTO);
    if (result != null) {
      return "no";
    } else {
      sql.insert("Cart.save", cartDTO);
      return "yes";
    }
  }

  public CartDTO duplicateCheck(CartDTO cartDTO) {
    System.out.println("CartRepository.duplicateCheck");
    return sql.selectOne("Cart.duplicateCheck", cartDTO);
  }

  public List<CartDTO> findAll(String memberId) {
    System.out.println("CartRepository.findAll");
    return sql.selectList("Cart.findAll", memberId);
  }
}
