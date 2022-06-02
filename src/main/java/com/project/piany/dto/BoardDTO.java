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
  private Long id;
  private String boardWriter;
  private String boardTitle;
  private String boardContents;
  private Timestamp boardCreatedDate;
  private Integer boardHits;
  private String boardFileName;
  private List<MultipartFile> boardFile;
}
