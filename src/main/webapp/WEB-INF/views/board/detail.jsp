<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: PM 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 게시판 상세 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/board/detail.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<main>
  <div class="detail-container">
    <div class="title-container">
      <div class="title-wrap">
        <h2>${board.boardTitle}</h2>
      </div>
    </div>

    <div class="info-container">
      <div class="writer">
        <li>${board.boardWriter}</li>
      </div>
      <div class="date-hits-container">
        <div class="date">
          <li><fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd"/></li>
        </div>
        <div class="hits">
          <li>조회수 ${board.boardHits}</li>
        </div>
      </div>
    </div>

    <div class="contents-container">
      <div class="contents">
        <li>${board.boardContents}</li>
      </div>
    </div>

    <c:choose>
      <c:when test="${sessionScope.loginMemberId eq board.boardWriter}">
        <div class="button-container">
          <div class="list-button">
            <input type="button" onclick="listBTN()" class="list-btn" value="목록">
          </div>
          <div class="edit-button">
            <input type="button" onclick="updateBTN()" class="edit-btn" value="수정">
          </div>
          <div class="delete-button">
            <input type="button" onclick="deleteBTN()" class="delete-btn" value="삭제">
          </div>
        </div>
      </c:when>
      <c:when test="${sessionScope.loginMemberId eq 'admin'}">
        <div class="button-container">
          <div class="list-button">
            <input type="button" onclick="listBTN()" class="list-btn" value="목록">
          </div>
          <div class="delete-button">
            <input type="button" onclick="deleteBTN()" class="delete-btn" value="삭제">
          </div>
        </div>
      </c:when>
      <c:otherwise>
        <div class="button-container">
          <div class="list-button">
            <input type="button" onclick="listBTN()" class="list-btn" value="목록">
          </div>
        </div>
      </c:otherwise>
    </c:choose>

    <div class="comment-container">
      <div class="add-comment-container">
        <input type="text" class="input-text" placeholder="댓글 내용을 입력하세요..">
        <input type="button" class="add-btn" value="댓글 작성">
      </div>

      <div class="list-comment-container">
        <div class="list-comment">
          <div class="comment-writer">
            <li>댓글 작성자1</li>
          </div>
          <div class="comment-symbol">
            <li>|</li>
          </div>
          <div class="comment-contents">
            <li>댓글 내용</li>
          </div>
          <div class="comment-symbol2">
            <li>|</li>
          </div>
          <div class="comment-date">
            <li>2022-02-02</li>
          </div>
        </div>

        <div class="list-comment">
          <div class="comment-writer">
            <li>댓글 작성자2</li>
          </div>
          <div class="comment-symbol">
            <li>|</li>
          </div>
          <div class="comment-contents">
            <li>댓글 내용</li>
          </div>
          <div class="comment-symbol2">
            <li>|</li>
          </div>
          <div class="comment-date">
            <li>2022-04-04</li>
          </div>
        </div>

      </div>

    </div>

  </div>
</main>
</body>
<script>
  const listBTN = () => {
    location.href = '/board/list';
  }

  const updateBTN = () => {
    location.href = '/board/update?id=${board.id}';
  }

  const deleteBTN = () => {
    location.href = '/board/delete?id=${board.id}';
  }
</script>
</html>
