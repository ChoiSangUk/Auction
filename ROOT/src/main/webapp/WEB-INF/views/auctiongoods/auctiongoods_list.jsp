<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />


<div class="col-md-12 container-fluid">
	<!-- ---------------------------대분류 부분------------------------ -->
	<div class="col-md-4 visible-lg visible-sm ">
		<h3 class="visible-lg visible-md visible-sm">대분류 전체</h3>
		<br>
		<div class="list-group " style="overflow: auto; height: 300px;">
			<a href="#" class="list-group-item list-group-item-info">전체보기</a>
			<c:forEach var="largeCategory" items="${largeCategory}">
				<a class="list-group-item"
					href="${pageContext.request.contextPath}/auctiongoods/auctiongoodslist_middle?largeCategoryCode=${largeCategory.largeCategoryCode}">
					${largeCategory.largeCategoryName} <!-- 대분류 코드 값을 넣어 전달하여 중분류 선택  -->
				</a>

			</c:forEach>
		</div>
	</div>
	<!-- ---------------------------대분류 부분 end------------------------ -->

	<!-- ---------------------------중분류 부분------------------------ -->
	<div class="col-md-4 visible-lg visible-sm">
		<h3 class="visible-lg visible-md visible-sm">중분류 전체</h3>
		<br>
		<div class="list-group" style="overflow: auto; height: 300px;">
			<a class="list-group-item list-group-item-info" href="#">전체보기</a>
			<c:forEach var="middleCategory" items="${middleCategoryList}">
				<a class="list-group-item"
					href="${pageContext.request.contextPath}/auctiongoods/auctiongoodslist_small?largeCategoryCode=${middleCategory.largeCategoryCode}&middleCategoryCode=${middleCategory.middleCategoryCode}">${middleCategory.middleCategoryName }</a>
			</c:forEach>
		</div>
	</div>
	<!-- ---------------------------중분류 부분 end------------------------ -->

	<!-- ---------------------------소분류 부분------------------------ -->
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
	<!-- ---------------------------소분류 부분 end------------------------ -->
</div>
<hr>
<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm-12 text-left">
			<h1>경매물품 리스트</h1>
			<hr>
			<div class="row goodslist">
			
			</div>
		</div>
	</div>
</div>
<script>

</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />