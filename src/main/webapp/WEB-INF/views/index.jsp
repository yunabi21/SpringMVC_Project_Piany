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
  <script src="../../resources/js/jquery.js"></script>
  <script src="../../resources/js/slider.js"></script>
</head>
<body>
<jsp:include page="layout/header.jsp" />

<div class="slider">
  <ul class="clearfix">
    <li><a href="#"><img src="../../resources/img/land1.jpg" alt="Landscape Photo 1"></a></li>
    <li><a href="#"><img src="../../resources/img/land2.jpg" alt="Landscape Photo 2"></a></li>
    <li><a href="#"><img src="../../resources/img/land3.jpg" alt="Landscape Photo 3"></a></li>
  </ul>
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
