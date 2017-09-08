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
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<a href="${pageContext.request.contextPath}/main">홈</a>
			<span>></span>
			<span style="color: #1266FF">아이디/비밀번호찾기</span>
			<h2>아이디/비밀번호찾기</h2>
		</div>
		<!-- 내용1 -->
		<div class="row content">				
			
				<h3>
					<strong>아이디 찾기</strong>
				</h3>
				<p>
					실명확인이 가능한 14세 이상<br> 구매/판매회원
				</p>
				<div>
					<p>
						<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/user/userFindIdForm">아이디찾기
						</a>
					</p>
				</div>
			
				<div>
					<h3>
						<strong>비밀번호 찾기</strong>
					</h3>
					<p>
						실명확인이 가능한 14세 이상<br>구매/판매회원
					</p>
					<div>
						<p>
							<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/user/userFindPwForm">비밀번호 찾기</a>
						</p>
					</div>
					
				</div>
			</div>
		</div>

		</div>
		<!-- 내용2 -->
		<div class="row content">				
			

		</div>
			
	<!-- 오른쪽 여백 -->		
	<div class="col-sm-1"></div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />