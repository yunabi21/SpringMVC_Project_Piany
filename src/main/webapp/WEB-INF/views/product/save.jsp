<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-09
  Time: PM 4:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 상품등록 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/product/save.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<main>
  <form action="/product/save" method="post" enctype="multipart/form-data">
    <div class="save-container">
      <div class="save-title">
        <h2>상품 등록</h2>
      </div>
      <div class="product-title">
        <label>제목</label>
        <input type="text" name="productName">
      </div>
      <div class="product-contents">
        <label>설명</label>
        <input type="text" name="productContents">
      </div>
      <div class="product-price">
        <label>가격</label>
        <input type="text" name="productPrice">
      </div>
      <div class="product-stock">
        <label>재고</label>
        <input type="text" name="productStock">
      </div>
      <div class="product-image-main">
        <label>메인 이미지</label>
        <input type="file" name="productImage">
      </div>
      <div class="update-submit-button">
        <input type="submit" value="제출">
      </div>
    </div>
  </form>
</main>
</body>
</html>
