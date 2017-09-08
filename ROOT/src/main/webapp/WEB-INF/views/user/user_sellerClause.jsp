<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<div class="container-fluid">
	<!-- 왼쪽 여백 -->
	<div class="col-sm-1"></div>
	<!-- 가운데 메인 -->
	<div class="col-sm-10">
		<!-- 네이게이션 & 페이지 타이틀 -->
		<div class="row title">
						<span class="glyphicon glyphicon-home" aria-hidden="true"></span> <a
				href="${pageContext.request.contextPath}/main">홈</a> <span>></span>
			<span style="color: #1266FF">회원가입</span> <span>></span> <span
				style="color: #1266FF">약관동의</span>
				<h1>회원가입</h1>
				<div>
				<ul>
					<li class="on"><span class="step">STEP01</span><span
						class="step-tit">회원선택</span><a
						class="glyphicon glyphicon-hand-right"></a></li>
					<li><span class="step">STEP02</span><span class="step-tit">약관동의</span></li>
					<li><span class="step">STEP03</span><span class="step-tit">정보입력</span></li>
					<li><span class="step">STEP04</span><span class="step-tit">가입완료</span></li>
				</ul>
			</div>
		</div>
		<!-- 내용1 -->
		<div class="row content">				
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
		<!-- 내용2 -->
		<div class="row content">				
			<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/user/userSellerInsertForm">회원가입</a>

		</div>
	</div>			
	<!-- 오른쪽 여백 -->		
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />