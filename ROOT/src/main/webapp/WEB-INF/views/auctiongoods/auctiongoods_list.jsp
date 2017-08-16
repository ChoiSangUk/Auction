<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />



	<div class="dp3-list visible-lg visible-md visible-sm">
		<h3 class="visible-lg visible-md visible-sm">전체</h3>
		<ul class="row list-unstyled">
			<li class="col-sm-4 col-md-3 active"  ><a href="#" type="text-decoration:none" >전체보기</a></li>
			<c:forEach var="largeCategory" items="${largeCategoryList}" ></c:forEach> <!-- 미구현 -->
			<li class="col-sm-4 col-md-3 "><a href="#">추천경매</a></li>
			<li class="col-sm-4 col-md-3 "><a href="#">인기경매</a></li>
			<li class="col-sm-4 col-md-3 "><a href="#">오늘마감</a></li>
			<li class="col-sm-4 col-md-3 "><a href="#">미술품</a></li>
			<li class="col-sm-4 col-md-3 "><a href="#">근현대생활사자료</a></li>
			

		</ul>
	</div>

<hr>
<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm-12 text-left">
			<h1>광고단가 수정 화면</h1>
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}" method="post">
				<div class="form-group">
					<label class="col-sm-2 control-label">속성명</label>
					<div class="col-sm-3">
						<input class="form-control" type="text" name="" value="" readonly>
						<!-- 회원코드는 핸드폰뒷자리 중복일경우 +1 -->
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">라디오버튼 속성명</label>
					<div class="col-sm-3">
						<label class="radio-inline"><input type="radio" name=""
							checked="checked" value="M">남</label> <label class="radio-inline"><input
							type="radio" name="" value="F">여</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"></label>&nbsp;&nbsp;&nbsp; <input
						class="btn btn-default" type="submit" value="등록"> <input
						class="btn btn-default" type="reset" value="다시쓰기">
				</div>
			</form>
		</div>
	</div>
</div>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />