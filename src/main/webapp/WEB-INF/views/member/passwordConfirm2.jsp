<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: AM 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 비밀번호 확인 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/member/passwordConfirm.css">
  <script src="../../../resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" />
<div class="input-container">
  <div class="input-container-title">
    <a>비밀번호 확인</a>
  </div>
  <input type="hidden" id="id" name="id" value="${id}">
  <div class="input-memberPassword">
    <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호">
  </div>

  <div class="submit-button-container">
    <input type="button" onclick="passwordConfirm()" value="비밀번호 확인">
  </div>

  <div class="result-container">
    <span id="result-msg" class="result-msg"></span>
  </div>
</div>
</body>
<script>
  const passwordConfirm = () => {
    const pw = document.getElementById("memberPassword").value;
    const id = document.getElementById("id").value;

    $.ajax({
      url: '/member/passwordConfirm2',
      type: 'post',
      data: {"id": id,
              "memberPassword": pw},
      dataType: 'text',
      success: function (result) {
        console.log(result);
        if (result === 'yes') {
          if (confirm('정말로 탈퇴할까요?')) {
            location.href = '/member/delete?id=' + id;
          } else {
            location.href = '/member/detail?id=' + id;
          }
        } else {
          alert('비밀번호가 다릅니다.');
        }
      },
      err: function () {
        alert('실패');
      }
    });
  }
</script>
</html>
