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
			<a href="${pageContext.request.contextPath}/mypage/mypageMain">마이페이지</a>
			<span>></span> <span style="color: #1266FF">내 계좌수정</span>
			<h2>나의 정보관리</h2>
		</div>
		<!-- 내용1 -->
		<c:import url="/resources/module/mypage_info.jsp" charEncoding="UTF-8" />
		<!-- 내용2 -->
		<div class="row content">
			<!-- 캐쉬 상세내역 -->
			<form role="form" id="AccountUpdateForm"
				action="${pageContext.request.contextPath}/mypage/myinfo/MyinfoAccountUpdate"
				method="post">
				<div class="form-group">
					<label for="accountBankName">은행명</label> <input type="text"
						class="form-control" id="accountBankName" name="accountBankName" placeholder="은행명" value="${account.accountBankName}">
				</div>
				<div class="form-group">
					<label for="accountHolderName">예금주</label> <input type="text"
						class="form-control" id="accountHolderName" name="accountHolderName"
						placeholder="예금주" value="${account.accountHolderName}">
				</div>
				<div class="form-group">
					<label for="accountNo">계좌번호</label> <input type="text"
						class="form-control" id="accountNo" name="accountNo"
						placeholder="계좌번호" value="${account.accountNo}">
				</div>
					<button type="submit" class="btn btn-info">
						계좌수정<i class="fa fa-check spaceLeft"></i>
					</button>
			</form>
		</div>
	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />