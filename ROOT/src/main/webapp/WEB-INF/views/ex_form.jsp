<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm-12 text-left"> 
			<h1>광고단가 수정 화면</h1>
	    	<form class="form-horizontal" action="${pageContext.request.contextPath}" method="post">
		   		<div class="form-group">
		   			<label class="col-sm-2 control-label">속성명</label>
		   			<div class="col-sm-3">
					<input  class="form-control" type="text" name="" value = "" readonly> <!-- 회원코드는 핸드폰뒷자리 중복일경우 +1 -->
				</div>
				</div>
				<div class="form-group">
		   			<label class="col-sm-2 control-label">라디오버튼 속성명</label>
		   			<div class="col-sm-3">
					<label class="radio-inline"><input type="radio" name="" checked="checked" value="M">남</label>
					<label class="radio-inline"><input type="radio" name="" value="F">여</label>
					</div>
				</div>
				<div class="form-group">
			   		<label class="col-sm-2 control-label"></label>&nbsp;&nbsp;&nbsp;
					<input class="btn btn-default" type ="submit" value = "등록">
					<input class="btn btn-default" type ="reset" value = "다시쓰기">
				</div>
			</form>    	
		</div>
	</div>
</div>