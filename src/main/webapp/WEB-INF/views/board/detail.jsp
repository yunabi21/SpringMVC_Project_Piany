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
  <script src="../../../resources/js/jquery.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
        <input type="hidden" id="commentWriter" name="commentWriter" value="${sessionScope.loginMemberId}">
        <input type="text" id="commentContents" name="commentContents" class="input-text" placeholder="댓글 내용을 입력하세요..">
        <input type="button" onclick="commentSaveBTN()" class="add-btn" value="댓글 작성">
      </div>

      <div class="list-comment-container" id="comment-list">
        <c:forEach var="comment" items="${commentList}">
          <div class="list-comment">
            <div class="comment-writer">
              <li>${comment.commentWriter}</li>
            </div>
            <div class="comment-symbol">
              <li>|</li>
            </div>
            <div class="comment-contents">
              <li>${comment.commentContents}</li>
            </div>
            <div class="comment-symbol">
              <li>|</li>
            </div>
            <div class="comment-date">
              <li><fmt:formatDate value="${comment.commentCreatedDate}" pattern="yyyy-MM-dd" /> </li>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</main>
</body>
<script>
  const listBTN = () => {
    location.href = '/board/list?page=${page}';
  }

  const updateBTN = () => {
    location.href = '/board/update?id=${board.id}';
  }

  const deleteBTN = () => {
    location.href = '/board/delete?id=${board.id}';
  }

  const commentSaveBTN = () => {
    const commentWriter = document.getElementById("commentWriter").value;
    const commentContents = document.getElementById("commentContents").value;
    const boardId = '${board.id}';

    $.ajax({
      url: '/comment/save',
      type: 'post',
      data: {"boardId": boardId,
              "commentWriter": commentWriter,
              "commentContents": commentContents},
      dataType: 'json',
      success: function (result) {
        console.log(result);
        let output;

        for (let i in result) {
          console.log(result[i]);
              output = "<div class='list-comment'>";

              output += "<div class='comment-writer'>";
              output += "<li>" + result[i].commentWriter + "</li>";
              output += "</div>";

              output += "<div class='comment-symbol'>";
              output += "<li>|</li>";
              output += "</div>";

              output += "<div class='comment-contents'>";
              output += "<li>" + result[i].commentContents + "</li>";
              output += "</div>";

              output += "<div class='comment-symbol'>";
              output += "<li>|</li>";
              output += "</div>";

              output += "<div class='comment-date'>";
              output += "<li>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD") + "</li>";
              output += "</div>";

              output += "</div>";
        }

        document.getElementById("comment-list").innerHTML = output;
        document.getElementById("commentContents").value = '';
      },
      err: function () {
        alert('실패');
      }
    });
  }
</script>
</html>
