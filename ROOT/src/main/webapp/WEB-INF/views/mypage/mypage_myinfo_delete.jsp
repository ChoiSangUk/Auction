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
			<a href="${pageContext.request.contextPath}/mypage/mypageMain">마이페이지</a>
			<span>></span>
			<span style="color: #1266FF">회원탈퇴</span>
			<h2>나의 정보관리</h2>
		</div>
		<!-- 내용1 -->
		<c:import url="/resources/module/mypage_info.jsp" charEncoding="UTF-8" />
		<!-- 내용2 -->
		<div class="row content">				
			<div class="text-center well">
                	<h2><strong>회원 탈퇴</strong>를 하시겠습니까?</h2>
                    <p>아래 약관 내용을 참조하신 후 신중하게 버튼을 클릭하여 주시기 바랍니다.</p>
		        </div>	

		</div>
	</div>			
	<!-- 오른쪽 여백 -->		
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />