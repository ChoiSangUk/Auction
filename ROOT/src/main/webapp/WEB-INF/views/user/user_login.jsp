<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm-12"> 
			<h1>로그인 화면</h1>
	    	<form class="form-horizontal" action="${pageContext.request.contextPath}/user/userLogin" method="post">
		   		<div class="form-group">
		   			<label class="col-sm-2 control-label">아이디</label>
		   			<div class="col-sm-3">
					<input type="text" id="userId" name="userId" class="form-control" placeholder="아이디" value="id002">
					</div>
				</div>
				<div class="form-group">
		   			<label class="col-sm-2 control-label">비밀번호</label>
		   			<div class="col-sm-3">
					<input type="password" id="userPassword" name="userPassword"
					class="form-control" onkeyup="if(event.keyCode==13)doLogin();"
					placeholder="비밀번호" value="pw002">
					</div>
				</div>
				<div class="form-group">
		   			<div class="col-sm-3">
					<input type="checkbox" id="idSaveCheck" name="idSaveCheck"> 아이디 저장
					<input type="checkbox" id="autoLoginCheck" name="autoLoginCheck"> 자동 로그인
					</div>
				</div>
				<div class="form-group">
				<a href="${pageContext.request.contextPath}/user/userJoin">회원가입</a>
				<a href="#">아이디/비밀번호찾기</a>
				</div>
				<div class="form-group">
			   		<label class="col-sm-2 control-label"></label>&nbsp;&nbsp;&nbsp;
					<input class="btn btn-default" type ="submit" value = "로그인">
					<input class="btn btn-default" type ="reset" value = "다시쓰기">
				</div>
			</form>    	
		</div>
	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />