<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: AM 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 상품 상세 정보 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/product/detail.css" />
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="../../../resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="product-detail-container">
  <div class="product-detail-title">
    <h2>상품 상세 페이지</h2>
  </div>
  <c:choose>
    <c:when test="${sessionScope.loginMemberId eq 'admin'}">
      <div class="product-detail-img-add">
        <input type="button" class="btn btn-outline-dark" onclick="detailImgAdd(${product.id})" value="상세 사진 등록">
      </div>
    </c:when>
  </c:choose>
</div>

<div class="detail-container">
  <div class="img-wrap">
    <img src="/upload/product/${product.productImageName}" alt="...">
  </div>
  <div class="detail-content-wrap">
    <div class="product-title-wrap">
      <h2>${product.productName}</h2>
    </div>
    <div class="product-price-wrap">
      <div class="fake-price">
        <span>₩</span>
        <span>${product.productPrice + 200000}</span>
      </div>
      <div class="real-price">
        <span>₩</span>
        <span>${product.productPrice}</span>
      </div>
    </div>
    <div class="product-stock-wrap">
      <span class="stock-title">재고 : </span>
      <span class="product-stock">${product.productStock}</span>
    </div>
    <div class="product-contents-wrap">
      <span class="product-contents">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</span>
    </div>
    <div class="quantity-buttons-wrap row gx-5 mb-7">
      <div class="product-quantity col-12 col-lg-auto">
        <select class="form-select mb-2">
          <option value="1" selected>1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </div>
      <div class="purchase-wrap col-12 col-lg">
        <button type="submit" class="btn w-100 btn-dark mb-2">구매하기
          <i class="fa fa-shopping-cart ms-2"></i>
        </button>
      </div>
      <div class="cart-button-wrap col-12 col-lg-auto">
<%--        <input type="button" onclick="cartSave()" class="btn btn-outline-dark w-100 mb-2" value="장바구니에 담기">--%>
        <button onclick="cartSave()" class="btn btn-outline-dark w-100 mb-2" data-toggle="button">장바구니에 담기
          <i class="fa fa-heart ms-2"></i>
        </button>
      </div>
    </div>
  </div>
</div>

<div class="detail-img-container">
  <div class="detail-img-title-wrap">
    <h2>상품 상세 이미지</h2>
  </div>
  <div class="detail-img-wrap">
    <c:forEach items="${imageList}" var="image">
      <img class="detail-img" src="/upload/product/${image.imageFileName}" alt="..">
    </c:forEach>
  </div>
</div>

<jsp:include page="../layout/footer.jsp" />
</body>

<script>
  const detailImgAdd = (id) => {
    location.href = '/product/saveImg?id=' + id;
  }

  const cartSave = () => {
    const memberId = '${sessionScope.loginMemberId}';
    const productId = '${product.id}';
    const productQuantity = document.querySelector('.form-select').value;

    $.ajax({
      url: '/cart/save',
      type: 'get',
      data: {"memberId": memberId,
              "productId": productId,
              "productQuantity": productQuantity},
      success: function (result) {
        console.log(result);

        if (result === 'no') {
          alert('이미 장바구니에 있어요!');
        } else {
          alert('장바구니에 상품을 넣었어요!');
        }
      },
      err: function () {
        alert('에러');
      }
    });
  }
</script>
</html>
