<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('.largeCategory').click(function() {	
		var largeCategoryName = $(this).text();	
		var largeCategoryCode = $(this).text();	
		
		console.log(largeCategoryName);
		alert(largeCategoryName);
		var param = 'a';
		$.ajax({
            url:'/auctiongoods/auctiongoodsinsert_middle?largeCategoryCode=${largeCategoryCode}',
            type:'get',
            data:param,
            datatype:text,
            contentType:'charset=UTF-8', 
            timeout:1000,
            error:function(xhr,status,e){
                   alert('ajax Error');
            },
            success: function(data){
            	console.log();
                  		$('#largeCategoryCode').val(param);
                   }
            });
            
	});
});


</script>
<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm-12 text-left">
			<h1>물품 등록</h1>
			
			<div class="col-md-4 visible-lg visible-sm ">
				<h3 class="visible-lg visible-md visible-sm">대분류 카테고리 선택</h3>
				<br>
				<div class="list-group " style="overflow: auto; height: 300px;">
					<a href="#" class="list-group-item list-group-item-info">전체보기</a>
					<c:forEach var="largeCategory" items="${largeCategory}">
						
						<!-- a 태그 클릭시 값을 form의 input에 넘겨주고 이동 -->
						<div class="list-group-item largeCategory" >
							<span class="largeCategoryCode" style="display:none">${largeCategory.largeCategoryCode}</span>
							<span class="largeCategoryName" >${largeCategory.largeCategoryName}</span> 
							<!-- 대분류 코드 값을 넣어 전달하여 중분류 선택  -->
						</div>

					</c:forEach>
				</div>
			</div>

			<div class="col-md-4 visible-lg visible-sm">
				<h3 class="visible-lg visible-md visible-sm">중분류 전체</h3>
				<br>

				<div class="list-group" style="overflow: auto; height: 300px;">
					<a class="list-group-item list-group-item-info" href="#">전체보기</a>
					<c:forEach var="middleCategory" items="${middleCategoryList}">
						<a class="list-group-item"
							href="${pageContext.request.contextPath}/auctiongoods/auctiongoodsinsert_small?largeCategoryCode=${middleCategory.largeCategoryCode}&middleCategoryCode=${middleCategory.middleCategoryCode}">${middleCategory.middleCategoryName }</a>
					</c:forEach>
				</div>
			</div>

			<div class="col-md-4 visible-lg visible-sm">
				<h3 class="visible-lg visible-md visible-sm">소분류 전체</h3>
				<br>

				<div class="list-group" style="overflow: auto; height: 300px;">
					<a class="list-group-item list-group-item-info" href="#">전체보기</a>
					<c:forEach var="smallCategory" items="${smallCategoryList}">
						<a class="list-group-item" href="#">${smallCategory.smallCategoryName }</a>
					</c:forEach>
				</div>
			</div>

			<form class="form-horizontal"
				action="${pageContext.request.contextPath}" method="post">
				<input type="text" id="largeCategoryCode" name="largeCategoryCode" value=""/>
				<input type="text" id="middleCategoryCode" name="middleCategoryCode" value=""/>
				<input type="text" id="smallCategoryCode" name="smallCategoryCode" value=""/>
				<div class="container">
					<h2>대분류 카테고리 선택</h2>
					<select class="form-control">
						<c:forEach var="largeCategory" items="${largeCategory}">
							<option class="list-group-item">
								
								<!-- 대분류 코드 값을 넣어 전달하여 중분류 선택  -->
							</option>

						</c:forEach>
					</select>
				</div>
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