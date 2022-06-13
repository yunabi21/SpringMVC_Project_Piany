<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: PM 6:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <a class="piany-home" href="${pageContext.request.contextPath}/"><img class="logo" alt="" src="../../../resources/img/logo.png"></a>
    </div>
    <c:choose>
      <c:when test="${sessionScope.loginMemberId eq 'admin'}">
        <div class="header-menu">
          <a class="piany-piano-shop" href="${pageContext.request.contextPath}/product/list">상품목록</a>
          <a class="piany-community-board" href="${pageContext.request.contextPath}/board/list">커뮤니티</a>
          <a class="piany-product-save" href="/product/save">상품등록</a>
        </div>
      </c:when>
      <c:otherwise>
        <div class="header-menu">
          <a class="piany-piano-shop" href="${pageContext.request.contextPath}/product/list">상품목록</a>
          <a class="piany-community-board" href="${pageContext.request.contextPath}/board/list">커뮤니티</a>
        </div>
      </c:otherwise>
    </c:choose>

    <div class="header-search">
      <div id="search-icon-wrap" class="search-icon-wrap">
        <img class="search-icon" alt="" src="../../../resources/img/icon_search.png">
      </div>
      <input type="text" onmouseover="wrapOver()" onmouseleave="wrapLeave()" class="header-search-input" name="query" placeholder=" 검색할 내용을 입력해주세요">
    </div>

    <c:choose>
      <c:when test="${sessionScope.loginId != null}">
        <div class="header-side-menu">
          <a href="${pageContext.request.contextPath}/member/detail?id=${sessionScope.loginId}"><img class="user-icon" alt="" src="../../../resources/img/user.png"></a>
          <a href="${pageContext.request.contextPath}/cart/list?memberId=${sessionScope.loginMemberId}"><img class="shopping-cart-icon" alt="" src="../../../resources/img/shopping-cart.png"></a>
          <a href="${pageContext.request.contextPath}/member/logout" class="side-menu-text">${sessionScope.loginMemberId} 님 로그아웃</a>
        </div>
      </c:when>
      <c:otherwise>
        <div class="header-side-menu">
          <a href="${pageContext.request.contextPath}/member/detail?id=${sessionScope.loginId}"><img class="user-icon" alt="" src="../../../resources/img/user.png"></a>
          <a href="${pageContext.request.contextPath}/cart/list?memberId=${sessionScope.loginMemberId}"><img class="shopping-cart-icon" alt="" src="../../../resources/img/shopping-cart.png"></a>
          <a href="${pageContext.request.contextPath}/member/login" class="side-menu-text">로그인</a>
          <a href="${pageContext.request.contextPath}/member/save" class="side-menu-text">회원가입</a>
        </div>
      </c:otherwise>
    </c:choose>
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
