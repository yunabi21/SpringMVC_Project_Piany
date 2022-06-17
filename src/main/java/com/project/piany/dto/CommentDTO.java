package com.project.piany.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {
  private Long id;  // 댓글 번호
  private Long boardId; // 글 번호
  private String commentWriter; // 댓글 작성자
  private String commentContents; // 댓글 내용
  private Timestamp commentCreatedDate; // 댓글 작성일자
}
