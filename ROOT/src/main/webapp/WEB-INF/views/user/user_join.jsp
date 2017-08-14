<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<div>
	<h1>회원가입</h1>
</div>
<div class="row visible-lg visible-md visible-sm">
	<ul class="join-stop clearfix">
		<li class="on"><span class="step">STEP01</span><span
			class="step-tit">회원선택</span><a class="glyphicon glyphicon-hand-right"></a></li>
		<li><span class="step">STEP02</span><span class="step-tit">약관동의
				및<br> 본인확인
		</span></li>
		<li><span class="step">STEP03</span><span class="step-tit">정보입력</span></li>
		<li><span class="step">STEP04</span><span class="step-tit">가입완료</span></li>
	</ul>
</div>	
<div>
	<h3>
		<strong>구매자 회원</strong>
	</h3>
	<p>
		실명확인이 가능한 14세 이상<br> 구매회원
	</p>
	<div>
		<p>
			<a href="${pageContext.request.contextPath}/user/userBuyerClause">가입하기
			</a>
		</p>
	</div>
	<div>
		<img src="../images/member/join-individual-icon.png"
			class="img-responsive" alt="">
	</div>
</div>
<div>
	<h3>
		<strong>판매자 회원</strong>
	</h3>
	<p>
		실명확인이 가능한 14세 이상<br>구매/판매회원
	</p>
	<div>
		<p>
			<a href="${pageContext.request.contextPath}/user/userSellerClause">가입하기</a>
		</p>
	</div>
	<div>
		<img src="../images/member/join-business-icon.png"
			class="img-responsive" alt="">
	</div>
</div>
<ul>
	<li>회원 유형별로 가입절차가 다르게 이루어지니, 반드시 해당하시는 유형을 선택하여 회원가입을 해주시기 바랍니다.</li>
	<li>회원가입시 제공하신 개인정보는 강박송이 서비스에 이용되며, 그 이외 용도로는 절대 사용되지 않습니다.</li>
</ul>


<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />