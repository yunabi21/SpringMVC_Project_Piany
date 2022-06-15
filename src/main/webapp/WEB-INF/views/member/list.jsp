<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-15
  Time: PM 6:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 회원목록 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/member/list.css">
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="member-list-container">
  <div class="member-list-title">
    <h2>회원목록</h2>
  </div>
</div>

<div class="container-wrap">
  <div class="table-container">
    <table class="table table-striped table-hover">
      <thead>
      <tr>
        <th>회원번호</th>
        <th>아이디</th>
        <th>이름</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>주소</th>
        <th></th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${memberList}" var="member">
        <tr>
          <td>${member.id}</td>
          <td>${member.memberId}</td>
          <td>${member.memberName}</td>
          <td>${member.memberEmail}</td>
          <td>${member.memberMobile}</td>
          <td>${member.memberZipCode} ${member.memberAddress1} ${member.memberAddress2}</td>
          <td><a href="javascript:void(0)" onclick="deleteMember(${member.id})">삭제</a></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<jsp:include page="../layout/footer.jsp" />
</body>
<script>
  const deleteMember = (id) => {
    location.href = '/member/deleteByAdmin?id=' + id;
  }
</script>
</html>
