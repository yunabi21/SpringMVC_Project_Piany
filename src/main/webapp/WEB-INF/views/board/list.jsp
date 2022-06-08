<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: AM 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>피아니 커뮤니티</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../resources/css/board/list.css">

</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="board-list-container">
  <div class="board-list-title">
    <h2>자유게시판</h2>
  </div>
</div>

<div class="container-wrap">
  <div class="table-container">
    <table class="table table-striped table-hover">
      <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일자</th>
        <th>조회수</th>
      </tr>
      </thead>
      <tbody>
        <c:forEach items="${boardList}" var="board">
          <tr>
            <td>${board.id}</td>
            <td><a href="${pageContext.request.contextPath}/board/detail?id=${board.id}">${board.boardTitle}</a></td>
            <td>${board.boardWriter}</td>
            <td><fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd"/></td>
            <td>${board.boardHits}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <div class="btn-list-container">
    <div class="save-btn-wrap">
      <a href="/board/save" class="btn btn-default">글 쓰기</a>
    </div>
  </div>

  <div class="text-center">
    <ul class="pagination">
      <li><a href="#">이전</a></li>
      <li><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">다음</a></li>
    </ul>
  </div>
</div>
</body>

<script>
  const wrapOver = () => {
    const wrap = document.getElementById("search-icon-wrap");
    wrap.style.backgroundColor = "#eaeaea";
  }

  const wrapLeave = () => {
    const wrap = document.getElementById("search-icon-wrap");
    wrap.style.backgroundColor = "#f5f5f5";
  }
</script>

</html>
