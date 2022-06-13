<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: AM 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 상품 상세 이미지 등록</title>

  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">

  <style>
    .input-img-container,
    .input-id {
      display: flex;
      margin-left: 40%;
    }

    .input-id {
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<form action="/product/saveImg" method="post" enctype="multipart/form-data">
  <input type="text" class="input-id" name="productId" value="${productId}">
  <div class="input-img-container">
    <div class="input-file-wrap">
      <input type="file" name="imageFile">
    </div>
    <div class="button-submit-wrap">
      <input type="submit" class="btn btn-outline-dark" value="등록하기">
    </div>
  </div>
</form>

<jsp:include page="../layout/footer.jsp" />
</body>
</html>
