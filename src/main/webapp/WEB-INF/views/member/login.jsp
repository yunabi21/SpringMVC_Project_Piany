<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: PM 4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>피아니 로그인 페이지</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="../../../resources/css/member/login.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="login-container">
  <div class="login-title">
    <h2>로그인</h2>
  </div>

  <div class="input-container">
    <div class="input-memberId-wrap">
      <div class="label-memberId">
        <label>아이디</label>
      </div>
      <div class="input-memberId">
        <input type="text" name="memberId">
      </div>
    </div>
    <div class="input-memberPassword-wrap">
      <div class="label-memberPassword">
        <label>패스워드</label>
      </div>
      <div class="input-memberPassword">
        <input type="password" name="memberPassword">
      </div>
    </div>

    <div class="input-result-wrap">
      <span id="input-result"></span>
    </div>
  </div>

  <div class="find-wrap">
    <li><a href="#" class="find-wrap-a">아이디 찾기</a></li>
    <li class="find-wrap-symbol">|</li>
    <li><a href="#" class="find-wrap-a">비밀번호 찾기</a></li>
    <li class="find-wrap-symbol">|</li>
    <li><a href="${pageContext.request.contextPath}/member/save" class="find-wrap-a">회원가입</a></li>
  </div>

  <div class="enter-wrap">
    <button type="submit" id="submit-button" class="btn btn-dark">로그인</button>
  </div>
</div>
</body>
</html>
