<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<div style="margin-right: 100px; margin-left: 100px;">
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
				<!-- -----------------물품이 보여지는 곳 start----------------- -->
				<div class="row goodslist" style="margin-left: 20px">
					<div class="dpTable listLineBox col-sm-2"
						style="border: 1px solid #48BAE4; padding: 1px; margin: 8px">
						
						<div class="thum dpTableC " style="border-bottom: none;">

							<a href="/kobay/item/itemView.do?itemseq=1707DGECCL7"> <img
								src="#" onerror="this.src='/admin/images/noimg.gif';" border="0"
								title="[1707DGECCL7]물품의 이미지들을 봅니다." alt="작은이미지">
							</a>

						</div>
						<div class="spec dpTableC">
							<div class="fs22 strong">
								<a href="/kobay/item/itemView.do?itemseq=1707DGECCL7">물품명</a>
							</div>
							<div class="price">
								<p class="now strong fcBlue">현재가 : 1,000 원</p>
							</div>
							<div class="autionTime">
								<p class="fcBlue">
									<strong> 남은시간 : 9일 22시간 </strong>
								</p>
							</div>
							<div class="autionTime">
								<p class="fcBlue">
									<strong> 판매자 아이디 </strong>
								</p>
							</div>
							<div class="count" style="border:1px">
								<span style="width:45%; display:inline-block; border-right:1px;">
									입찰수 :<span>0</span>
								</span>
								<span style="width:45%; display:inline-block;">		
										조회수 : <span>0</span>
								</span>		
							</div>
						</div>
						 
					</div>

				</div>
				<!-- -----------------물품이 보여지는 곳 end----------------- -->
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {

	});
</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />