package com.project.piany.service;

import com.project.piany.repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HistoryService {

  @Autowired
  private HistoryRepository historyRepository;
}
