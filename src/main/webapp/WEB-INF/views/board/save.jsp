<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: PM 5:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 글 작성 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/board/save.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />
<main>
  <form action="/board/save" method="post">
  <div class="main-container">
    <div class="title-container">
      <div class="title">
        <h2>글 작성</h2>
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
        <input type="text" name="boardTitle" placeholder="제목을 입력하세요.">
      </div>
    </div>

    <div class="contents-container">
      <div class="contents">
        <textarea onkeydown="resize(this)" name="boardContents" placeholder="내용을 입력하세요."></textarea>
      </div>
    </div>

    <div class="button-container">
      <div class="submit-button">
        <input type="submit" value="게시하기">
      </div>
    </div>
  </div>
  </form>
</main>
<jsp:include page="../layout/footer.jsp" />
</body>
<script>
  const resize = (obj) => {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
  }
</script>
</html>
