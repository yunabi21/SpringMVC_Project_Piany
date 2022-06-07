<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: PM 6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 회원정보 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/member/detail.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />
<div class="detail-container">
  <div class="detail-title">
    <h2>회원정보</h2>
  </div>

  <div class="memberId-wrap">
    <div class="memberId-label">
      <label>아이디</label>
    </div>
    <div class="memberId-value">
      <span>${member.memberId}</span>
    </div>
  </div>

  <div class="memberName-wrap">
    <div class="memberName-label">
      <label>이름</label>
    </div>
    <div class="memberName-value">
      <span>${member.memberName}</span>
    </div>
  </div>

  <div class="memberEmail-wrap">
    <div class="memberEmail-label">
      <label>이메일</label>
    </div>
    <div class="memberEmail-value">
      <span>${member.memberEmail}</span>
    </div>
  </div>

  <div class="memberMobile-wrap">
    <div class="memberMobile-label">
      <label>전화번호</label>
    </div>
    <div class="memberMobile-value">
      <span>${member.memberMobile}</span>
      <!-- <input type="text" value="010-0000-0000"> -->
    </div>
  </div>

  <div class="memberAddress-wrap">
    <div class="memberAddress-label">
      <label>주소</label>
    </div>
    <div class="memberAddress-value">
      <span>${member.memberZipCode} ${member.memberAddress1} ${member.memberAddress2}</span>
    </div>
  </div>

  <div class="button-wrap">
    <div class="update-button">
      <input type="button" onclick="updateBTN()" value="수정하기">
    </div>
    <div class="delete-button">
      <input type="button" value="탈퇴하기">
    </div>
  </div>
</div>
</body>
<script>
  const updateBTN = () => {
    location.href = '/member/passwordConfirm?id=${member.id}';
  }

</script>
</html>
