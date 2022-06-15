package com.project.piany.repository;

import com.project.piany.dto.ImageDTO;
import com.project.piany.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

  public ProductDTO findById(Long id) {
    System.out.println("ProductRepository.findById");
    return sql.selectOne("Product.findById", id);
  }

  public void saveImg(ImageDTO imageDTO) {
    System.out.println("ProductRepository.saveImg");
    sql.insert("Product.saveImg", imageDTO);
  }

  public List<ImageDTO> findByProductId(Long id) {
    System.out.println("ProductRepository.findByProductId");
    return sql.selectList("Product.findByProductId", id);
  }

  public ProductDTO findByProductIdForCart(Long id) {
    System.out.println("ProductRepository.findByProductIdForCart");
    return sql.selectOne("Product.findByProductIdForCart", id);
  }


  public int updateQuantity(Map<String, Long> updateParam) {
    System.out.println("ProductRepository.updateQuantity");
    return sql.update("Product.updateQuantity", updateParam);
  }

  public void delete(Long id) {
    System.out.println("ProductRepository.delete");
    sql.delete("Product.delete", id);
  }

  public List<ProductDTO> search(String query) {
    System.out.println("ProductRepository.search");
    return sql.selectList("Product.search", query);
  }
}
