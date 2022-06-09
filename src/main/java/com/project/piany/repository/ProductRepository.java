package com.project.piany.repository;

import com.project.piany.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductRepository {

  @Autowired
  private SqlSessionTemplate sql;

  public void save(ProductDTO productDTO) {
    System.out.println("ProductRepository.save");
    sql.insert("Product.save", productDTO);
  }

  public List<ProductDTO> findAll() {
    System.out.println("ProductRepository.findAll");
    return sql.selectList("Product.findAll");
  }
}
