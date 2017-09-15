<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<style>
.login {
	padding-left: 50px;
}
.login-box {
	padding: 40px 58px 20px 70px;
	width: 100%;
	vertical-align: middle;
	border: 1px solid #BDBDBD;
	background-color: #F7F7F7;
}
.control-label {
	padding: 0;
}
.login-solid {
	margin: 30px 0 30px 0 !important;
	padding: 20px 50px 40px 50px;
	border-top: 2px solid #0000ED !important;
	border: 1px solid #BDBDBD;
}
.loginQbtn {
	width: 200px;
}
#loginBtn {
	min-width: 125px;
	max-height: 30px;
	min-height: 85px;
}
.form-horizontal .control-label{
    text-align: left;
}
#myCarousel {
	margin-top: 30px;
}
</style>

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10 login">
		<!-- 네이게이션 & 페이지 타이틀 -->
		<div class="row title">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<a href="${pageContext.request.contextPath}/main">홈</a>
			<span>></span>
			<span style="color: #1266FF">로그인</span>
			<h2>로그인</h2>
			<input type="hidden" id="loginCheck" value="${loginCheck}">
		</div>
		<div class="row content login-solid">	
			<div class="row col-sm-6 login">
			<div class="row login-box">
		    	<form class="form-horizontal" id="login" action="${pageContext.request.contextPath}/user/userLogin" method="post">		    		
		    		<div class="form-horizontal">		
		 			<div class="col-sm-8">
				   		<div class="form-group">
				   			<label class="col-sm-3 control-label">아이디</label>
				   			<div class="col-sm-9">
							<input type="text" id="userId" name="userId" class="form-control" placeholder="아이디" value="id002">
							</div>
						</div>
						<div class="form-group">
				   			<label class="col-sm-3 control-label">비밀번호</label>
				   			<div class="col-sm-9">
							<input type="password" id="userPassword" name="userPassword"
							class="form-control" onkeyup="if(event.keyCode==13)doLogin();"
							placeholder="비밀번호" value="pw002">
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<input class="btn btn-primary btn-md input-inline" type="submit" id="loginBtn" value="로그인" >
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10" style="padding-left: 25px;">
							<label class="radio-inline"><input type="radio" name="idSaveCheck" value="on">아이디저장</label>
							<label class="radio-inline"><input type="radio" name="autoLoginCheck" value="off">자동로그인</label>
						</div>
					</div>
					</div>						
				</form>
			</div>														
				<div class="form-group">
					<label class="col-sm-6 control-label text-left" style="padding-left: 20px;">아직 Auction 회원이 아니신가요?</label>
					<div class="col-sm-6">
					<a class="btn btn-default loginQbtn" href="${pageContext.request.contextPath}/user/userJoin">회원가입</a>
					</div>
					<label class="col-sm-6 control-label"  style="padding-left: 20px;">아이디/비밀번호를 잊어버리셨나요?</label>
					<div class="col-sm-6">
					<a class="btn btn-default loginQbtn" href="${pageContext.request.contextPath}/user/userFindIdPw">아이디/비밀번호찾기</a>
					</div>
				</div>
			</div>
			<div class="row col-sm-6">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- 메인배너 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>
					<!-- 메인배너 링크,이미지 -->
					<div class="carousel-inner" role="listbox">
						<div class="item active mainBanner">
							<a href="${pageContext.request.contextPath}/mypage/mypageAdInfo">
							<img src="${pageContext.request.contextPath}/resources/img/mainBanner.jpg" 
							style="width: 100%; height: 300px;" alt="Image" align="middle">
							</a>
						</div>
						<c:forEach var="ad" items="${adPaymentSuccessList}">
						<div class="item mainBanner">
							<a href="${pageContext.request.contextPath}/auctiongoods/auctiongoods_detail?auctionGoodsCode=${ad.adApplyVo.auctionGoodsCode}">
							<img src="${pageContext.request.contextPath}/resources/files/${ad.adImageVo.adImageName}" 
							style="width: 100%; height: 300px;" alt="Image" align="middle">
							</a>
						</div>
						</c:forEach>
					</div>
				
					<!-- 메인배너 선택기 -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
						aria-hidden="true"></span> <span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>													    					
	</div>
	<div class="col-sm-1"></div>
</div>

<script>
$('#loginBtn').click(function(){
	var loginCheck = $('#loginCheck').val();
	if(loginCheck === '1') {
		alert('아이디,비밀번호를 확인해주세요!');
	}
})

</script>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />