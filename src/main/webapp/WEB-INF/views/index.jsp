<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: PM 6:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>피아니 메인 페이지</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../../resources/css/index.css">
</head>
<body>
<jsp:include page="layout/header.jsp" />

<div class="slide-container-wrap">
  <div class="slide-container">
    <div class="slide-inner">
      <img src="../../resources/img/banner1.png" alt="">
    </div>
    <div class="slide-inner">
      <img src="../../resources/img/banner2.png" alt="">
    </div>
    <div class="slide-inner">
      <img src="../../resources/img/banner3.png" alt="">
    </div>
  </div>

  <button class="btn1">1</button>
  <button class="btn2">2</button>
  <button class="btn3">3</button>
</div>

<jsp:include page="layout/footer.jsp" />
</body>
<script>
  document.querySelector('.btn1').addEventListener('click', function () {
    const container = document.querySelector('.slide-container');
    container.style.transform = 'translate(0vw)';
  });

  document.querySelector('.btn2').addEventListener('click', function () {
    const container = document.querySelector('.slide-container');
    container.style.transform = 'translate(-100vw)';
  });

  document.querySelector('.btn3').addEventListener('click', function () {
    const container = document.querySelector('.slide-container');
    container.style.transform = 'translate(-200vw)';
  });
</script>
</html>
