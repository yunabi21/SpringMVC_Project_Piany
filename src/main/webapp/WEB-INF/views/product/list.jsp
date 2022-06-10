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
        <img src="/upload/product/${product.productImageName}" alt="..">
        <div class="card-body">
          <div class="product-name-wrap">
            <h5 class="card-title">${product.productName}</h5>
          </div>
          <div class="contents-wrap">
            <p class="card-text">${product.productContents}</p>
          </div>
          <div class="item-price-wrap">
            <li class="item-price">₩</li><li id="item-price${product.id}" class="item-price"> ${product.productPrice}</li>
          </div>
        </div>
      </div>
    </div>
  </c:forEach>
</div>
</body>
<script>
  $(document).ready(function () {
    const productList = '${productList}';

    for (let i in productList) {
      let itemPrice = document.getElementById("item-price${productList.get(0).productPrice}");
      console.log(itemPrice);
    }
  });
</script>
</html>
