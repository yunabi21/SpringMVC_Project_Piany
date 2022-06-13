<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: AM 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 정보수정 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/member/saveForm.css">
  <script src="../../../resources/js/member/save.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<main>
  <div class="signup-container">
    <div class="signup-title">
      <h2>회원 정보 수정</h2>
    </div>

    <form action="/member/update" method="post" name="memberSaveForm">
      <input type="hidden" name="id" value="${member.id}">
      <div class="signup-input">
        <div class="input-memberId-wrap">
          <div class="label-memberId-wrap">
            <label for="input-memberId">아이디</label>
            <span class="input-result" id="id-result"></span>
          </div>
          <div class="input-memberId">
            <input type="text" value="${member.memberId}" name="memberId" class="input-memberId" id="input-memberId" readonly>
          </div>

          <div class="input-memberName-wrap">
            <div class="label-memberName-wrap">
              <label for="input-memberName">이름</label>
              <span class="input-result" id="name-result"></span>
            </div>
            <div class="input-memberName-wrap">
              <input type="text" value="${member.memberName}" name="memberName" class="input-memberName" id="input-memberName" readonly>
            </div>
          </div>

          <div class="input-memberEmail-wrap">
            <div class="label-memberEmail-wrap">
              <label for="input-memberEmail">이메일</label>
              <span class="input-result" id="email-result"></span>
            </div>
            <div class="input-memberEmail-wrap">
              <input type="text" value="${member.memberEmail}" name="memberEmail" class="input-memberEmail" id="input-memberEmail">
            </div>
          </div>

          <div class="input-memberMobile-wrap">
            <div class="label-memberMobile-wrap">
              <label for="input-memberMobile">전화번호</label>
              <span class="input-result" id="mobile-result"></span>
            </div>
            <div class="input-memberMobile-wrap">
              <input type="text" value="${member.memberMobile}" name="memberMobile" class="input-memberMobile" id="input-memberMobile">
            </div>
          </div>

          <div class="input-memberAddress-container">
            <div class="label-memberAddress-wrap">
              <label>주소</label>
              <span class="input-result" id="address-result"></span>
            </div>
            <div class="input-address-container">
              <div class="input-memberZipcode-wrap">
                <input type="text" id="memberZipCode" value="${member.memberZipCode}" name="memberZipCode" placeholder="우편번호" required>
              </div>
              <div class="btn-address-search-wrap">
                <input type="button" onclick="addressAPI()" value="주소 검색">
              </div>
            </div>
            <div class="input-address-wrap">
              <div class="input-memberAddress1-wrap">
                <input type="text" id="memberAddress1" value="${member.memberAddress1}" name="memberAddress1" placeholder="주소" required>
              </div>
              <div class="input-memberAddress2-wrap">
                <input type="text" id="memberAddress2" value="${member.memberAddress2}" name="memberAddress2" placeholder="상세주소">
              </div>
            </div>
          </div>

          <div class="btn-submit-form">
            <input type="button" onclick="submit()" value="수정하기">
          </div>
        </div>
      </div>
    </form>
  </div>
</main>
<jsp:include page="../layout/footer.jsp" />
</body>
</html>
