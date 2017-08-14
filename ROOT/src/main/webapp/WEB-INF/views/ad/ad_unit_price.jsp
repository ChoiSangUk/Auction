<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8"/>

<c:forEach var="ad" items="${list}">
	
	${ad.adUnitPirceName}
	${ad.adUnitPricePrice}
	${ad.adUnitPriceState}

</c:forEach>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>