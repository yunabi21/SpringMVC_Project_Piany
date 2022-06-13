<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: PM 3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>피아니 상품목록 페이지</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="../../../resources/css/product/list.css">
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <script src="../../../resources/js/jquery.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://kit.fontawesome.com/6d0fda0f7c.js" crossorigin="anonymous"></script>
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

<div class="row row-cols-1 row-cols-md-4 g-4 list-container">

  <c:forEach var="product" items="${productList}">
    <div class="col">
      <div class="card">
        <a href="${pageContext.request.contextPath}/product/detail?id=${product.id}"><img src="/upload/product/${product.productImageName}" alt=".."></a>
        <div class="card-body">
          <div class="product-name-wrap">
            <h5 class="card-title">${product.productName}</h5>
          </div>
          <div class="contents-wrap">
            <p class="card-text">${product.productContents}</p>
          </div>
          <div class="item-price-wrap">
            <li class="item-price">₩</li><li id="item-price${product.id}" class="item-price2"> ${product.productPrice}</li>
<%--            <a id="iconHover${product.id}" class="icon-hover" onmouseover="iconOver(${product.id})" onmouseleave="iconLeave(${product.id})"--%>
<%--               href="${pageContext.request.contextPath}/cart/save?productId=${product.id}">--%>
<%--              <i class="fa-regular fa-heart ms-2 heart-icon"></i>--%>
<%--            </a>--%>
          </div>
        </div>
      </div>
    </div>
  </c:forEach>
</div>
<jsp:include page="../layout/footer.jsp" />
</body>
<script>
  const iconOver = (productId) => {
    const icon = document.getElementById('iconHover' + productId);
    icon.innerHTML = "<i class='fa-solid fa-heart ms-2 heart-icon'></i>";
  }

  const iconLeave = (productId) => {
    const icon = document.getElementById('iconHover' + productId);
    icon.innerHTML = "<i class='fa-regular fa-heart ms-2 heart-icon'></i>";
  }
</script>
</html>
