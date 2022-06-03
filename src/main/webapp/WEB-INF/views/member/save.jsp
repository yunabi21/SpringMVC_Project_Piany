<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: PM 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>피아니 회원가입 페이지</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="../../../resources/css/member/saveForm.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<main>
  <div class="signup-container">
    <div class="signup-title">
      <h2>회원가입</h2>
    </div>

    <div class="signup-input">
      <div class="input-memberId-wrap">
        <div class="label-memberId-wrap">
          <label for="input-memberId">아이디</label>
          <span class="input-result" id="id-result"></span>
        </div>
        <div class="input-memberId">
          <input type="text" name="memberId" class="input-memberId" id="input-memberId">
        </div>

        <div class="input-memberPassword-wrap">
          <div class="label-memberPassword-wrap">
            <label for="input-memberPassword">비밀번호</label>
            <span class="input-result" id="pw-result"></span>
          </div>
          <div class="input-memberPassword-wrap">
            <input type="password" name="memberPassword" class="input-memberPassword" id="input-memberPassword">
          </div>
        </div>

        <div class="input-membePassword-again-wrap">
          <div class="label-memberPassword-again-wrap">
            <label for="input-memberPassword-again">비밀번호 확인</label>
            <span class="input-result" id="pw-again-result"></span>
          </div>
          <div class="input-memberPassword-again-wrap">
            <input type="password" class="input-memberPassword-again" id="input-memberPassword-again">
          </div>
        </div>

        <div class="input-memberName-wrap">
          <div class="label-memberName-wrap">
            <label for="input-memberName">이름</label>
            <span class="input-result" id="name-result"></span>
          </div>
          <div class="input-memberName-wrap">
            <input type="text" name="memberName" class="input-memberName" id="input-memberName">
          </div>
        </div>

        <div class="input-memberEmail-wrap">
          <div class="label-memberEmail-wrap">
            <label for="input-memberEmail">이메일</label>
            <span class="input-result" id="email-result"></span>
          </div>
          <div class="input-memberEmail-wrap">
            <input type="text" name="memberEmail" class="input-memberEmail" id="input-memberEmail">
          </div>
        </div>

        <div class="input-memberMobile-wrap">
          <div class="label-memberMobile-wrap">
            <label for="input-memberMobile">전화번호</label>
            <span class="input-result" id="mobile-result"></span>
          </div>
          <div class="input-memberMobile-wrap">
            <input type="text" name="memberMobile" class="input-memberMobile" id="input-memberMobile">
          </div>
        </div>

        <div class="input-memberAddress-container">
          <div class="label-memberAddress-wrap">
            <label>주소</label>
            <span class="input-result" id="address-result"></span>
          </div>
          <div class="input-address-container">
            <div class="input-memberZipcode-wrap">
              <input type="text" name="memberZipcode" placeholder="우편번호" readonly>
            </div>
            <div class="btn-address-search-wrap">
              <input type="button" value="주소 검색">
            </div>
          </div>
          <div class="input-address-wrap">
            <div class="input-memberAddress1-wrap">
              <input type="text" name="memberAddress1" placeholder="주소" readonly>
            </div>
            <div class="input-memberAddress2-wrap">
              <input type="text" name="memberAddress2" placeholder="상세주소">
            </div>
          </div>
        </div>

        <div class="btn-submit-form">
          <input type="button" value="가입하기">
        </div>
      </div>
    </div>
  </div>
</main>
</body>
</html>
