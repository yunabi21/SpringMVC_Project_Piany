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
            <div id="comment${comment.id}" class="comment-contents">
              <li id="commentContents${comment.id}">${comment.commentContents}</li>
            </div>
            <c:choose>
              <c:when test="${sessionScope.loginMemberId eq comment.commentWriter}">
                <div class="comment-update-delete-button">
                  <div id="updateWrap${comment.id}" class="comment-update-button">
                    <input type="button" onclick="commentUpdateBTN(${comment.id})" value="수정">
                  </div>
                  <div id="deleteWrap${comment.id}" class="comment-delete-button">
                    <input type="button" onclick="commentDeleteBTN(${comment.id})" value="삭제">
                  </div>
                </div>
              </c:when>
              <c:otherwise>
                <div class="comment-update-delete-button">

                </div>
              </c:otherwise>
            </c:choose>
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
<jsp:include page="../layout/footer.jsp" />
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
        let output = '';
        const sessionId = '${sessionScope.loginMemberId}';

        for (let i in result) {
          let commentWriter = result[i].commentWriter;

          output += "<div class='list-comment'>";

          output += "<div class='comment-writer'>";
          output += "<li>" + result[i].commentWriter + "</li>";
          output += "</div>";

          output += "<div class='comment-symbol'>";
          output += "<li>" + "|" + "</li>";
          output += "</div>";

          output += "<div id='comment" + result[i].id + "' class='comment-contents'>";
          output += "<li id='commentContents" + result[i].id + "'>" + result[i].commentContents + "</li>";
          output += "</div>";

          if (sessionId === commentWriter) {
            output += "<div class='comment-update-delete-button'>";
            output += "<div class='comment-update-button'>";
            output += "<input type='button' onclick='commentUpdateBTN(" + result[i].id + ")' value='수정'>";
            output += "</div>";
            output += "<div class='comment-delete-button'>";
            output += "<input type='button' onclick='commentDeleteBTN(" + result[i].id + ")' value='삭제'>";
            output += "</div>";
            output += "</div>";
          } else {
            output += "<div class='comment-update-delete-button'>";
            output += "</div>";
          }

          output += "<div class='comment-symbol'>";
          output += "<li>" + "|" + "</li>";
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

  const commentDeleteBTN = (id) => {
    const boardId = '${board.id}';

    $.ajax({
      url: '/comment/delete?id=' + id,
      type: 'get',
      data: {"id": id,
              "boardId": boardId},
      dataType: 'json',
      success: function (result) {
        let output = '';
        const sessionId = '${sessionScope.loginMemberId}';

        for (let i in result) {
          let commentWriter = result[i].commentWriter;

          output += "<div class='list-comment'>";

          output += "<div class='comment-writer'>";
          output += "<li>" + result[i].commentWriter + "</li>";
          output += "</div>";

          output += "<div class='comment-symbol'>";
          output += "<li>" + "|" + "</li>";
          output += "</div>";

          output += "<div id='commentId" + result[i].id + "' class='comment-contents'>";
          output += "<li id='commentContents" + result[i].id + "'>" + result[i].commentContents + "</li>";
          output += "</div>";

          if (sessionId === commentWriter) {
            output += "<div class='comment-update-delete-button'>";
            output += "<div class='comment-update-button'>";
            output += "<input type='button' onclick='commentUpdateBTN(" + result[i].id + ")' value='수정'>";
            output += "</div>";
            output += "<div class='comment-delete-button'>";
            output += "<input type='button' onclick='commentDeleteBTN(" + result[i].id + ")' value='삭제'>";
            output += "</div>";
            output += "</div>";
          } else {
            output += "<div class='comment-update-delete-button'>";
            output += "</div>";
          }

          output += "<div class='comment-symbol'>";
          output += "<li>" + "|" + "</li>";
          output += "</div>";

          output += "<div class='comment-date'>";
          output += "<li>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD") + "</li>";
          output += "</div>";

          output += "</div>";
        }

        document.getElementById("comment-list").innerHTML = output;

      },
      err: function () {
        alert('실패');
      }
    });
  }

  const commentUpdateBTN = (id) => {
    const contentsForm = document.getElementById("comment" + id);
    const preContents = document.getElementById("commentContents" + id).innerHTML;

    console.log(preContents);
    const updateWrap = document.getElementById("updateWrap" + id);
    const cancelWrap = document.getElementById("deleteWrap" + id);

    contentsForm.innerHTML = "<input type='text' class='input-text' id='updateCommentContents' name='commentContents' value='" + preContents + "'>";
    updateWrap.innerHTML = "<input type='button' onclick='updateBTN2(" + id + ")' value='수정'>";
    cancelWrap.innerHTML = "<input type='button' onclick='cancelBTN2()' value='취소'>";
  }

  const updateBTN2 = (id) => {
    const contents = document.getElementById("updateCommentContents").value;
    const boardId = '${board.id}';

    $.ajax({
      url: '/comment/update?id=' + id,
      type: 'post',
      data: {"boardId": boardId,
              "id": id,
              "commentContents": contents},
      dataType: 'json',
      success: function () {

      },
      err: function () {
        alert('실패');
      }
    });
    location.href = '/board/detail?id=${board.id}';
  }

  const cancelBTN2 = () => {
    location.href = '/board/detail?id=${board.id}';
  }
</script>
</html>
