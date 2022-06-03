<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: PM 6:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Title</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../../../resources/css/header.css">
</head>
<body>
<header>
  <div class="header-container">
    <div class="header-logo">
      <a class="piany-home" href="/"><img class="logo" alt="" src="../../../resources/img/logo.png"></a>
    </div>

    <div class="header-menu">
      <a class="piany-piano-shop" href="/product/list">상품목록</a>
      <a class="piany-community-board" href="/board/list">커뮤니티</a>
    </div>

    <div class="header-search">
      <div id="search-icon-wrap" class="search-icon-wrap">
        <img class="search-icon" alt="" src="../../../resources/img/icon_search.png">
      </div>
      <input type="text" onmouseover="wrapOver()" onmouseleave="wrapLeave()" class="header-search-input" name="query" placeholder=" 검색할 내용을 입력해주세요">
    </div>

    <div class="header-side-menu">
      <a href="${pageContext.request.contextPath}/member/detail?id=${sessionScope.loginId}"><img class="user-icon" alt="" src="../../../resources/img/user.png"></a>
      <a href="${pageContext.request.contextPath}/cart/list?id=${sessionScope.loginId}"><img class="shopping-cart-icon" alt="" src="../../../resources/img/shopping-cart.png"></a>
      <a href="/member/login" class="side-menu-text">로그인</a>
      <a href="${pageContext.request.contextPath}/member/save" class="side-menu-text">회원가입</a>
    </div>
  </div>
</header>
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
