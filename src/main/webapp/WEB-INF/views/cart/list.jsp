<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: PM 5:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 장바구니 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/cart/list.css">
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <script src="../../../resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<main>
  <div class="cart-list-container">
    <div class="cart-list-title">
      <h2>장바구니</h2>
    </div>
  </div>

  <div class="cart-list-wrap">
    <div class="cart-list">
      <table class="cart-list-table">
        <thead>
        <tr class="theader">
          <th class="choice">선택</th>
          <th class="image">사진</th>
          <th class="productName">상품명</th>
          <th class="productPrice">가격</th>
          <th class="productQuantity">수량</th>
          <th class="productPriceToPay">주문 금액</th>
          <th class="productDelete">삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}">
          <tr>
            <td><input type="checkbox"></td>
            <td><img class="product-img" src="/upload/product/${product.productImageName}"></td>
            <td><a href="javascript:void(0)" onclick="productDetail(${product.id})"><span class="product-name">${product.productName}</span></a></td>
            <td><span>₩ </span><span id="productPrice" class="product-price">${product.productPrice}</span></td>
            <td><select class="form-select">
              <option value="0" selected>--</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select></td>
            <td><span class="won-symbol">₩ </span><span id="productPriceToPay" class="product-price-to-pay"></span></td>
            <td><input type="button" class="btn btn-outline-dark cancel-button" onclick="deleteProduct(${product.id})" value="삭제하기"></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
<%--      <div class="price-to-pay-container">--%>
<%--        <div class="price-to-pay-wrap">--%>
<%--          <span class="price-text">총 금액 : </span>--%>
<%--          <span class="won-symbol2">₩ </span>--%>
<%--          <span id="priceToPay" class="price-to-pay"></span>--%>
<%--        </div>--%>
<%--      </div>--%>
      <div class="button-container">
        <div class="pay-button-wrap">
          <input type="button" class="btn btn-dark pay-button" value="결제하기">
        </div>
        <div class="cancel-button-wrap">
          <input type="button" class="btn btn-outline-dark cancel-button" value="삭제하기">
        </div>
      </div>
    </div>
  </div>
</main>

<jsp:include page="../layout/footer.jsp" />
</body>

<script>

  $('.form-select').change(function (){
    let productPrice = parseInt(document.getElementById("productPrice").innerHTML);
    let quantity = parseInt($('.form-select').val());
    // let resultPriceVal = parseInt(document.getElementById("productPriceToPay").value);
    // let sumPriceVal = parseInt(document.getElementById("priceToPay").innerHTML);

    let resultPrice = document.getElementById("productPriceToPay");
    // let sumPrice = document.getElementById("priceToPay");

    resultPrice.innerHTML = productPrice * quantity;
    // let sumPrice2 = sumPriceVal + resultPriceVal;
    // console.log(sumPrice2);


    let symbol = document.querySelector('.won-symbol');
    // let symbol2 = document.querySelector('.won-symbol2');
    symbol.style.display = 'inline';
    // symbol2.style.display = 'inline';
  });

  const productDetail = (id) => {
    location.href = '/product/detail?id=' + id;
  }

  const deleteProduct = (id) => {
    const memberId = '${sessionScope.loginMemberId}';

    $.ajax({
      type: 'get',
      url: '/cart/delete',
      data: {"productId": id,
              "memberId": memberId},
      dataType: 'text',
      success: function (result) {
        console.log(result);

        if (result === 'ok') {
          alert('장바구니에서 삭제 했어요!');
          location.href = '/cart/list?memberId=' + memberId;
        } else {
          alert('삭제 할 상품이 없어요!');
        }
      }
    });
  }
</script>
</html>
