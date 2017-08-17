<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" /><html>

<div class="container">
  <h2>입찰창</h2>
  <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p>            
  <table class="table">
    <thead>
      <tr>
        <th>입찰품명:</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>입찰가격:</td>
        <input type="int"><input type = "button" value = "입찰완료">
        </tr>
      <tr>
        <th>입찰 리스트</th>
      </tr>
      <tr>
      <td>입찰자 명<td>
    	<td>입찰 금액<td>
      </tr>
      <c:forEach var = "bid" items="${list}">
      <td>${bid.userBuyerId} </td>
      <td>${bid.bidPrice} </td>
      </c:forEach>
    </tbody>
  </table>
</div>
<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />
