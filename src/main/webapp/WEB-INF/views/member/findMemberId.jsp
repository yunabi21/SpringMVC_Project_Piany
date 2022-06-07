<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: PM 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 아이디 찾기 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/member/findMemberId.css">
  <script src="../../../resources/js/jquery.js"></script>
</head>
<body>

  <div class="input-container">
    <div class="input-container-title">
      <a>아이디 찾기</a>
    </div>
    <div class="input-memberEmail">
      <input type="text" id="memberEmail" name="memberEmail" placeholder="이메일 입력">
    </div>

    <div class="submit-button-container">
      <input type="button" onclick="findMemberId()" value="아이디 찾기">
    </div>

    <div class="result-container">
      <span id="result-msg" class="result-msg"></span>
    </div>
  </div>

</body>

<script>
  const findMemberId = () => {
    const userEmail = document.getElementById("memberEmail").value;
    const result_span = document.getElementById('result-msg');

    $.ajax({
      url: '/member/findMemberId',
      type: 'post',
      data: {"memberEmail": userEmail},
      dataType: 'json',
      success: function (result) {
        console.log(result);
        if (result != null) {
          result_span.innerHTML = userEmail + '님의 아이디는 ' + result.memberId + '입니다.';
        } else {
          result_span.innerHTML = '조회 결과가 없습니다.';
        }
      },
      err: function () {
        alert("실패");
      }
    });
  }
</script>
</html>
