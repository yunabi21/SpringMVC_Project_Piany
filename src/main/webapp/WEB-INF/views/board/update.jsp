<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: PM 6:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 글 수정 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/board/save.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<main>
  <form action="${pageContext.request.contextPath}/board/update?id=${board.id}" method="post">
    <div class="main-container">
      <div class="title-container">
        <div class="title">
          <h2>글 수정</h2>
        </div>
      </div>

      <div class="writer-container">
        <div class="writer">
          <li>${sessionScope.loginMemberId}</li>
          <input type="hidden" name="boardWriter" value="${sessionScope.loginMemberId}">
        </div>
      </div>

      <div class="subject-container">
        <div class="subject">
          <input type="text" name="boardTitle" value="${board.boardTitle}" placeholder="제목을 입력하세요.">
        </div>
      </div>

      <div class="contents-container">
        <div class="contents">
          <textarea onkeydown="resize(this)" name="boardContents" placeholder="내용을 입력하세요.">${board.boardContents}</textarea>
        </div>
      </div>

      <div class="button-container">
        <div class="update-button">
          <input type="submit" value="수정하기">
        </div>
        <div class="cancel-button">
          <input type="button" onclick="cancelBTN()" value="취소하기">
        </div>
      </div>
    </div>
  </form>
</main>
</body>
<script>
  const resize = (obj) => {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
  }

  const cancelBTN = () => {
    location.href = '/board/detail?id=${board.id}';
  }
</script>
</html>
