<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" /><html>

<div class="container">
  <h2>����â</h2>
  <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p>            
  <table class="table">
    <thead>
      <tr>
        <th>����ǰ��:</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>��������:</td>
        <input type="int"><input type = "button" value = "�����Ϸ�">
        </tr>
      <tr>
        <th>���� ����Ʈ</th>
      </tr>
      <tr>
      <td>������ ��<td>
    	<td>���� �ݾ�<td>
      </tr>
      <c:forEach var = "bid" items="${list}">
      <td>${bid.userBuyerId} </td>
      <td>${bid.bidPrice} </td>
      </c:forEach>
    </tbody>
  </table>
</div>
<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />
