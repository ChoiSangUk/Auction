<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<div>
	<h3>서비스 이용약관</h3>
	<div>
		<iframe width="100%" src="${pageContext.request.contextPath}/user/test"
			frameborder="1"></iframe>
	</div>
	<div>
		<p>‘서비스 이용약관’을 확인하고 이에 동의하십니까?</p>
		<p>
			<label class="checkbox-inline"> 
			<input type="radio" value="Y" name="agree1" id="agree1y"> 동의함
			</label> 
			<label class="checkbox-inline"> 
			<input type="radio"	value="N" name="agree1" id="agree1n"> 동의하지 않습니다.
			</label>
		</p>
	</div>
</div>

<div>
	<a href="${pageContext.request.contextPath}/user/userSellerInsertForm">회원가입</a>
</div>
<div></div>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />