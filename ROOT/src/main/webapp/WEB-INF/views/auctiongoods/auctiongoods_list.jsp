<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />


<!-- ---------------------------대분류 부분------------------------ -->
	<div class="dp3-list visible-lg visible-md visible-sm">
		<h3 class="visible-lg visible-md visible-sm">전체</h3><br>
		<ul class="row list-unstyled">
			<li class="col-sm-4 col-md-3 active"  ><a href="#" type="text-decoration:none" >전체보기</a></li>
			<c:forEach var="largeCategory" items="${largeCategory}" >
			<li class="col-sm-4 col-md-3 ">
			<a href="${pageContext.request.contextPath}/auctiongoods/auctiongoodslist_middle?largeCategoryCode=${largeCategory.largeCategoryCode}">
			${largeCategory.largeCategoryName}  <!-- 대분류 코드 값을 넣어 전달하여 중분류 선택  -->
			</a>
			</li>
			</c:forEach> 
		</ul>
	</div>
<hr>
<!-- ---------------------------대분류 부분 end------------------------ -->

<!-- ---------------------------중분류 부분------------------------ -->
<div class="dp3-list visible-lg visible-md visible-sm">
		<h3 class="visible-lg visible-md visible-sm">중분류 전체</h3><br>
		
		<ul class="row list-unstyled">
			<li class="col-sm-4 col-md-3 active"  ><a href="#" type="text-decoration:none" >전체보기</a></li>
			<c:forEach var="middleCategory" items="${middleCategoryList}" >
			<li class="col-sm-4 col-md-3 "><a href="#">${middleCategory.middleCategoryName }</a></li>
			</c:forEach> 
		</ul>
	</div>	
<!-- ---------------------------중분류 부분 end------------------------ -->	

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