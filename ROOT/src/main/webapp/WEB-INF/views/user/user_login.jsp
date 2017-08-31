<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<style>
.login-box {
	width: 550px;
	vertical-align: middle;
}
.control-label {
	padding: 0;
}
.row {
	margin: 30px 0 15px 0 !important;
}
.loginQbtn {
	width: 200px;
}
.form-horizontal .control-label{
    text-align: left;
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
		</div>
		<div class="row content">	
			<div class="row login-box well">
		    	<form class="form-horizontal" id="login" action="${pageContext.request.contextPath}/user/userLogin" method="post">		    		
		    		<div class="col-md-8 col-sm-12  form-horizontal">		
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
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<label class="radio-inline"><input type="radio" name="idSaveCheck" value="on">아이디 저장</label>
								<label class="radio-inline"><input type="radio" name="autoLoginCheck" value="off">자동 로그인</label>
							</div>
						</div>
					</div>	
					<input class="btn btn-primary btn-lg" type="submit" id="loginBtn" value="로그인" >
				</form>
			</div>																	
				<div class="form-group">
					<label class="col-sm-3 control-label text-left">아직 Auction 회원이 아니신가요?</label>
					<div class="col-sm-9">
					<a class="btn btn-default loginQbtn" href="${pageContext.request.contextPath}/user/userJoin">회원가입</a>
					</div>
					<label class="col-sm-3 control-label">아이디/비밀번호를 잊어버리셨나요?</label>
					<div class="col-sm-9">
					<a class="btn btn-default loginQbtn" href="#">아이디/비밀번호찾기</a>
					</div>
				</div>
		</div>													    					
	</div>
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />