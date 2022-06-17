package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
  private Long id;  // 글 번호
  private String boardWriter; // 글 작성자
  private String boardTitle;  // 글 제목
  private String boardContents; // 글 내용
  private Timestamp boardCreatedDate; // 글 작성일자
  private Integer boardHits;  // 조회수
}
