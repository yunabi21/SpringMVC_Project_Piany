<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-15
  Time: AM 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>피아니 구매내역 페이지</title>

  <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../resources/css/history/list.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="order-list-container">
  <div class="order-list-title">
    <h2>구매내역</h2>
  </div>
</div>

<div class="container-wrap">
  <div class="table-container">
    <table class="table table-striped table-hover">
      <thead>
      <tr>
        <th>번호</th>
        <th>상품 이름</th>
        <th>가격</th>
        <th>수량</th>
        <th>결제한 총 가격</th>
        <th>구매일자</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${historyList}" var="history">
        <tr>
          <td>${history.id}</td>
          <td>${history.productName}</td>
          <td>${history.productPrice}</td>
          <td>${history.productQuantity}</td>
          <td>${history.productPrice * history.productQuantity}</td>
          <td><fmt:formatDate value="${history.historyCreatedDate}" pattern="yyyy-MM-dd HH:mm" /></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<jsp:include page="../layout/footer.jsp" />
</body>
</html>
