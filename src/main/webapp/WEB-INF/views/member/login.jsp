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
  <script src="../../../resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="login-container">
  <div class="login-title">
    <h2>로그인</h2>
  </div>

<form action="/member/login" method="post">
  <div class="input-container">
    <div class="input-memberId-wrap">
      <div class="label-memberId">
        <label for="input-memberId">아이디</label>
      </div>
      <div class="input-memberId">
        <input type="text" name="memberId" id="input-memberId">
      </div>
    </div>
    <div class="input-memberPassword-wrap">
      <div class="label-memberPassword">
        <label for="input-memberPassword">패스워드</label>
      </div>
      <div class="input-memberPassword">
        <input type="password" name="memberPassword" id="input-memberPassword">
      </div>
    </div>

    <div class="input-result-wrap">
      <span id="input-result"></span>
    </div>
  </div>

  <div class="find-wrap">
    <li><a href="javascript:void(0)" onclick="findMemberId()" class="find-wrap-a">아이디 찾기</a></li>
    <li class="find-wrap-symbol">|</li>
    <li><a href="javascript:void(0)" onclick="findMemberPw()" class="find-wrap-a">비밀번호 찾기</a></li>
    <li class="find-wrap-symbol">|</li>
    <li><a href="${pageContext.request.contextPath}/member/save" class="find-wrap-a">회원가입</a></li>
  </div>

  <div class="enter-wrap">
    <input type="submit" id="submit-button" class="btn" value="로그인">
  </div>
</form>
</div>
<jsp:include page="../layout/footer.jsp" />
</body>
<script>
  const findMemberId = () => {
    window.open('/member/findMemberId', 'findMemberId', 'width=400, height=300, scrollbars=yes, resizable=no');
  }

  const findMemberPw = () => {
    window.open('/member/findMemberPw', 'findMemberPw', 'width=400, height=400, scrollbars=yes, resizable=no');
  }

  $(function () {
    const inputId = document.getElementById("input-memberId");
    inputId.focus();
  });
</script>
</html>
