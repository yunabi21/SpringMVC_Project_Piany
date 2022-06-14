<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: PM 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 결제 전 확인 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/product/confirmBeforePay.css">
  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <script src="../../../resources/js/jquery.js"></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="pay-container">
  <div class="pay-title">
    <h2>상품 결제</h2>
  </div>

  <div class="product-detail-to-pay">
    <div class="product">
      <div class="product-name">
        <span class="product-detail-span">이미지</span>
      </div>
      <div class="product-name-value">
        <img src="/upload/product/${product.productImageName}" alt="..">
      </div>
    </div>
  </div>

  <div class="product-detail-to-pay">
    <div class="product">
      <div class="product-name">
        <span class="product-detail-span">상품 이름</span>
      </div>
      <div class="product-name-value">
        <span class="product-detail-value">${product.productName}</span>
      </div>
    </div>
  </div>

  <div class="product-detail-to-pay">
    <div class="product">
      <div class="product-name">
        <span class="product-detail-span">가격</span>
      </div>
      <div class="product-name-value">
        <span class="won-symbol">₩ </span><span class="product-detail-value price">${product.productPrice}</span>
      </div>
    </div>
  </div>

  <div class="product-detail-to-pay">
    <div class="product">
      <div class="product-name">
        <span class="product-detail-span">수량</span>
      </div>
      <div class="product-name-value">
        <span class="product-detail-value">${quantity}</span>
      </div>
    </div>
  </div>

  <div class="product-detail-to-pay">
    <div class="product">
      <div class="product-name">
        <span class="product-detail-span">총 가격</span>
      </div>
      <div class="product-name-value">
        <span class="won-symbol">₩ </span><span class="product-detail-value price">${product.productPrice * quantity}</span>
      </div>
    </div>
  </div>

  <div class="button-container">
    <div class="pay-button">
      <input type="button" class="btn btn-dark payBTN" onclick="paymentButton()" value="구매하기">
    </div>
  </div>
</div>

<jsp:include page="../layout/footer.jsp" />
</body>

<script>
  const paymentButton = () => {

    let IMP = window.IMP;
    IMP.init('imp12690123');  // 가맹점 코드
    IMP.request_pay({
      pg : "kakaopay",  // pg사 이름
      pay_method : 'card',  // 지불 방법
      merchant_uid : 'merchant_' + new Date().getTime(),  // 가맹점 주문번호
      name : '${product.productName}',  // 상품 명
      amount : '${product.productPrice * quantity}',  // 금액
      buyer_name : '${member.memberName}',
      buyer_email :  '${member.memberEmail}',
      buyer_tel : '${member.memberMobile}',
      buyer_postcode : '${member.memberZipCode}',
      buyer_addr : '${member.memberAddress1}' + '${member.memberAddress2}',
    }, function (rsp) {
      console.log(rsp)
      if (rsp.success) {
        alert('결제가 완료 되었어요!');

        let result = {
          "memberId" : rsp.buyer_name,
          "productName" : rsp.name,
          "productQuantity" : ${quantity},
          "productPrice" : rsp.paid_amount / ${quantity}
        }

        $.ajax({
          url: '/history/save',
          type: 'post',
          async: false,
          data: result,
          dataType: 'text',
          success: function (result) {
            console.log(result);

            if (result === 'ok') {
              alert('구매 내역에 저장했어요!');
            } else {
              alert('구매 내역에 저장이 안돼요!');
            }
          },
          err: function () {
            alert('실패');
          }

        });
      } else {
        let msg = '결제 실패';
        msg += '에러내용 : ' + rsp.error_msg;
        alert (msg);
      }
    });
  }
</script>
</html>
