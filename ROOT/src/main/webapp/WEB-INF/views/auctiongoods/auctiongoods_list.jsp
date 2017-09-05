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
			<div class="list-group largeCategoryList" style="overflow: auto; height: 300px;">
				<a href="#" class="list-group-item list-group-item-info">전체보기</a>
				<c:forEach var="largeCategory" items="${largeCategory}">
					<a class="list-group-item"
						href="${pageContext.request.contextPath}/auctiongoods/auctiongoodslist_middle?largeCategoryCode=${largeCategory.largeCategoryCode}">
						<span class="largeCategoryCode" style="display:none;">${largeCategory.largeCategoryCode}</span>
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
						href="${pageContext.request.contextPath}/auctiongoods/auctiongoodslist_small?largeCategoryCode=${middleCategory.largeCategoryCode}&middleCategoryCode=${middleCategory.middleCategoryCode}">
						${middleCategory.middleCategoryName }
						</a>
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
						<div style="border-bottom:none;">
<!-- 							 <img src="#" onerror="#" border="0"/> -->
						</div>
						<div>
							<div class="auctionGoodsName">
								물품명
							</div>
							<div>
								<p class="nowPrice">현재가 : 1,000 원</p>
							</div>
							<div>
								<p>
									<strong class="remainingTime"> 남은시간 : 9일 22시간 </strong>
								</p>
							</div>
							<div>
								<p>
									<strong class="sellerId"> 판매자 아이디 </strong>
								</p>
							</div>
							<div style="border:1px">
								<span style="width:45%; display:inline-block; border-right:1px;">
									입찰수 :<span class="bidCount">0</span>
								</span>
								<span style="width:45%; display:inline-block;">		
										조회수 : <span class="auctionGoodsHits">0</span>
								</span>		
							</div>
						</div>
					</div>
					
					
					<!-- 각각의물품 div end -->
				</div>
				<!-- -----------------물품이 보여지는 곳 end----------------- -->
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		
		//대분류 코드를 뽑아서 
		var largeCategoryList =  $('.largeCategoryCode') //선택자를 변수에 담고
		var largeCategoryCode = new Array(); 			//선택자의 내용을 담을 변수 선언
		largeCategoryList.each(function(index){
		 	largeCategoryCode[index] = $(this).text();	//선택자의 개수만큼 각각의 largeCategoryCode[index]에 해당 선택자의 text 입력
		})
		
		$('.nowPrice').text('12341234')
		console.log($('.nowPrice').text())
	})		
</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />














