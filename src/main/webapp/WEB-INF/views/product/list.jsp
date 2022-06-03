<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: PM 3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>피아니 상품목록 페이지</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="../../../resources/css/product/list.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="item-list-container">
  <div class="item-list-title">
    <h2>상품목록</h2>
  </div>
  <div class="item-list-see-more">
    <a class="view-more-a" href="#"><h4>+ 더보기</h4></a>
  </div>
</div>

<div class="item-list-wrap">
  <div class="item">
    <img src="../../../resources/img/banner1.png">
  </div>
  <div class="item">
    <img src="../../../resources/img/banner2.png">
  </div>
  <div class="item">
    <img src="../../../resources/img/banner1.png">
  </div>
  <div class="item">
    <img src="../../../resources/img/banner2.png">
  </div>
</div>

<div class="item-list-text-wrap">
  <div class="item-text">
    <h4>피아노1</h4>
  </div>
  <div class="item-text">
    <h4>피아노2</h4>
  </div>
  <div class="item-text">
    <h4>피아노3</h4>
  </div>
  <div class="item-text">
    <h4>피아노4</h4>
  </div>
</div>

<div class="item-list-text-wrap">
  <div class="item-text2">
    <h5 class="item-sub-text">ㄴㄷㄹㄴㄷㄹㄴㅇㄹㄴㄷㄹㄴㅇㄹㄴㄷㄹㄴㅇㄹㅇㄴㄹㄷㄹ</h5>
    <div class="item-price">
      <h5>₩ 200,000</h5>
    </div>
  </div>
  <div class="item-text2">
    <h5 class="item-sub-text">ㄴㅇㄹㄴㅇㄹㄴㅇㄹㅇㄴㄹㄴㅇㄹㄴㅇㄹ</h5>
    <div class="item-price">
      <h5>₩ 200,000</h5>
    </div>
  </div>
  <div class="item-text2">
    <h5 class="item-sub-text">ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㄹㄴㄹㄴㅇㄹ</h5>
    <div class="item-price">
      <h5>₩ 200,000</h5>
    </div>
  </div>
  <div class="item-text2">
    <h5 class="item-sub-text">ㅁㄴㅇㅁㄴㅇㅁㄻㄴㄻㄻㄴㄻㄴㄻㄴㄻㄻㄹㄴㄹ</h5>
    <div class="item-price">
      <h5>₩ 200,000</h5>
    </div>
  </div>
</div>

<div class="item-list-wrap">
  <div class="item">
    <img src="../../../resources/img/banner1.png">
  </div>
  <div class="item">
    <img src="../../../resources/img/banner2.png">
  </div>
  <div class="item">
    <img src="../../../resources/img/banner1.png">
  </div>
  <div class="item">
    <img src="../../../resources/img/banner2.png">
  </div>
</div>

<div class="item-list-text-wrap">
  <div class="item-text">
    <h4>피아노1</h4>
  </div>
  <div class="item-text">
    <h4>피아노2</h4>
  </div>
  <div class="item-text">
    <h4>피아노3</h4>
  </div>
  <div class="item-text">
    <h4>피아노4</h4>
  </div>
</div>

<div class="item-list-text-wrap">
  <div class="item-text2">
    <h5 class="item-sub-text">ㄴㅇㄹㄴㅇㄹㄴㄷㄹㄴㄹㄴㄷㄹㄴㄹㄴㄷㄹㄴㅇㄹㄴㄷㄹㄴㄷㄹ</h5>
    <div class="item-price">
      <h5>₩ 200,000</h5>
    </div>
  </div>
  <div class="item-text2">
    <h5 class="item-sub-text">ㄴㅇㄹㄴㅇㄹㄴㅇㄹㅇㄴㄹㄴㅇㄹㄴㅇㄹ</h5>
    <div class="item-price">
      <h5>₩ 200,000</h5>
    </div>
  </div>
  <div class="item-text2">
    <h5 class="item-sub-text">ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㄹㄴㄹㄴㅇㄹ</h5>
    <div class="item-price">
      <h5>₩ 200,000</h5>
    </div>
  </div>
  <div class="item-text2">
    <h5 class="item-sub-text">ㅁㄴㅇㅁㄴㅇㅁㄻㄴㄻㄻㄴㄻㄴㄻㄴㄻㄻㄹㄴㄹ</h5>
    <div class="item-price">
      <h5>₩ 200,000</h5>
    </div>
  </div>
</div>
</body>

<script>
  const wrapOver = () => {
    const wrap = document.getElementById("search-icon-wrap");
    wrap.style.backgroundColor = "#eaeaea";
  }

  const wrapLeave = () => {
    const wrap = document.getElementById("search-icon-wrap");
    wrap.style.backgroundColor = "#f5f5f5";
  }
</script>
</html>
