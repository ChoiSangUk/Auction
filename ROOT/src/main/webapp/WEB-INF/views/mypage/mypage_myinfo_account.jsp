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
			<span>></span> <span style="color: #1266FF">내 계좌관리</span>
			<h2>나의 정보관리</h2>
		</div>
		<!-- 내용1 -->
		<c:import url="/resources/module/mypage_info.jsp" charEncoding="UTF-8" />
		<!-- 내용2 -->
		<div class="row content">
			<!-- 캐쉬 상세내역 -->
			<div>
				<h3>나의 계좌관리</h3>
				<h5>꼭 읽어주세요!</h5>
				<ul>


					<li>본인 명의의 계좌를 등록하여 주시기 바랍니다 (아이디 실명에 한하여 송금이 가능합니다.)<span
						class="text-info"></span></li>
					<li>환불 및 판매대금을 송금 받고자 하는 계좌번호를 등록해주세요.</li>
					<li>계좌를 입력하지 않은 경우 물품 배송정보 확인 및 반품신청을 하실 수 없습니다.<strong
						class="text-info"></strong>
					</li>
					<li>※ 원활한 출금작업을 위하여 아래 해당은행의 계좌를 입력해 주시기 바랍니다. (농협중앙회, 국민은행,
						우리은행, 신한(조흥)은행, 우체국, KEB하나은행)<strong class="text-info"></strong>
					</li>
				</ul>
			</div>

		</div>
	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />