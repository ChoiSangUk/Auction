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
			var largeCategoryName = $(this).find('.largeCategoryName').text();
			var largeCategoryCode = $(this).find('.largeCategoryCode').text();

			//console.log(largeCategoryName);
			//alert(largeCategoryCode);
			var largeParam = {
				"largeCategoryCode" : largeCategoryCode,
				//"largeCategoryName" : largeCategoryName
			};
			
			//console.log(largeParam);
			
			//대분류 카테고리를 누를때마다 중분류를 지워주고  다시 뿌림
			$('#middleCategory').children().remove();
			$('#middleCategoryCode').val("");
			$('#smallCategoryCode').val("");

			$.ajax({
				url : '/auction/auctiongoods/auctiongoodsinsert_middle',
				type : 'get',
				data : largeParam,
				datatype : 'json',
				contentType : 'application/json; charset=UTF-8',
				timeout : 1000,
				error : function(xhr, status, e) {
					alert('ajax Error');
				},
				success : function(getData) {
					console.log('getData의 길이 :' + getData.length);
					console.log('getData 는? \n' + getData);

					var obj = jQuery.parseJSON(JSON.stringify(getData));
					console.log('obj의 length :'+obj.length);
					console.log(obj[1].largeCategoryCode);

					for (var i = 0; i < obj.length; i++) {
						var largeCategoryCode = obj[i].largeCategoryCode;
						var middleCategoryCode = obj[i].middleCategoryCode;
						var middleCategoryName = obj[i].middleCategoryName;
						
						//console.log(largeCategoryCode+middleCategoryCode+middleCategoryName);
						
						var divTag = $('<div></div>');
						var spanTagLargeCategoryCode = $('<span	style="display:none"></span>');
						var spanTagMiddleCategoryCode = $('<span style="display:none"></span>');
						
						//태그에 들어갈 클래스들을 추가
						divTag.addClass('list-group-item');
						divTag.addClass('middleCategory');
						
						spanTagLargeCategoryCode.addClass('largeCategoryCode');
						spanTagMiddleCategoryCode.addClass('middleCategoryCode');
						
						//태그에 속한 텍스트 내용을 추가
						spanTagLargeCategoryCode.append(largeCategoryCode);
						spanTagMiddleCategoryCode.append(middleCategoryCode);
						divTag.append(middleCategoryName);
						divTag.append(spanTagLargeCategoryCode);
						divTag.append(spanTagMiddleCategoryCode);
						//만들어둔 태그들을 기존의 태그 안에 추가
						$('#middleCategory').append(divTag);
						//$('#middleCategory').append(spanTagLargeCategoryCode);
						//$('#middleCategory').append(spanTagMiddleCategoryCode);
					}

					$('#largeCategoryCode').val(largeCategoryCode);
					
					$('.middleCategory').click(function() {
						
						var largeCategoryCode = $(this).find('.largeCategoryCode').text();
						var middleCategoryCode = $(this).find('.middleCategoryCode').text();
						var middleCategoryName = $(this).find('.largeCategoryName').text();
						
						console.log(largeCategoryCode);
						
						var middleParam = {
								"largeCategoryCode" : largeCategoryCode,
								"middleCategoryCode" : middleCategoryCode,
						};
						
						//원래있던 소분류를 지워주고 다시 뿌려주기 
						$('#smallCategory').children().remove();
						$('#smallCategoryCode').val("");
						
						$.ajax({
							url : '/auction/auctiongoods/auctiongoodsinsert_small',
							type : 'get',
							data : middleParam,
							datatype : 'json',
							contentType : 'application/json; charset=UTF-8',
							timeout : 1000,
							error : function(xhr, status, e) {
								alert('ajax Error : middle');
							},
							success : function(getData) {
								console.log('getData의 길이 :' + getData.length);
								console.log('getData 는? \n' + getData);

								var obj = jQuery.parseJSON(JSON.stringify(getData));
								console.log('middle 부분 obj의 length :'+obj.length);
								console.log(obj[1].smallCategoryCode);

								for (var i = 0; i < obj.length; i++) {
									var largeCategoryCode = obj[i].largeCategoryCode;
									var middleCategoryCode = obj[i].middleCategoryCode;
									var smallCategoryCode = obj[i].smallCategoryCode;
									var smallCategoryName = obj[i].smallCategoryName;
									
									//console.log(largeCategoryCode+middleCategoryCode+middleCategoryName);
									
									var divTag = $('<div></div>');
									var spanTagLargeCategoryCode = $('<span style="display:none"></span>');
									var spanTagMiddleCategoryCode = $('<span style="display:none"></span>');
									var spanTagSmallCategoryCode = $('<span style="display:none"></span>');
									
									//태그에 들어갈 클래스들을 추가
									divTag.addClass('list-group-item');
									divTag.addClass('smallCategory');
									
									spanTagLargeCategoryCode.addClass('largeCategoryCode');
									spanTagMiddleCategoryCode.addClass('middleCategoryCode');
									spanTagSmallCategoryCode.addClass('smallCategoryCode');
									
									//태그에 속한 텍스트 내용을 추가
									spanTagLargeCategoryCode.append(largeCategoryCode);
									spanTagMiddleCategoryCode.append(middleCategoryCode);
									spanTagSmallCategoryCode.append(smallCategoryCode);
									
									divTag.append(smallCategoryName);
									divTag.append(spanTagLargeCategoryCode);
									divTag.append(spanTagMiddleCategoryCode);
									divTag.append(spanTagSmallCategoryCode);
									
									//만들어둔 태그들을 기존의 태그 안에 추가
									$('#smallCategory').append(divTag);
									//$('#smallCategory').append(spanTagLargeCategoryCode);
									//$('#smallCategory').append(spanTagMiddleCategoryCode);
									//$('#smallCategory').append(spanTagSmallCategoryCode);
								}

								$('#middleCategoryCode').val(middleCategoryCode);
									
								$('.smallCategory').click(function() {
									var smallCategoryCode = $(this).find('.smallCategoryCode').text();
									console.log(smallCategoryCode);
									$.ajax({
										url : '/auction/auctiongoods/auctiongoodsinsert',
										type : 'get',
										//data : middleParam,
										//datatype : 'json',
										//contentType : 'application/json; charset=UTF-8',
										timeout : 1000,
										error : function(xhr, status, e) {
											alert('ajax Error : middle');
										},
										success : function(getData) {
											//console.log('getData의 길이 :' + getData.length);
											//console.log('getData 는? \n' + getData);
											console.log(smallCategoryCode);

											$('#smallCategoryCode').val(smallCategoryCode);
											}
												
										});
									
								});
							}
							
						});
						
					});
				}
			});
		});
	});
</script>
<div class="container-fluid text-center">
	<div class="row content">
		<h1>물품 등록</h1>
		<div class="col-sm-12 category text-left">
			<div class="col-sm-4 visible-lg visible-sm ">
				<h3 class="visible-lg visible-sm visible-sm">대분류 카테고리 선택</h3>
				<br>
				<div class="list-group " style="overflow: auto; height: 300px;">
					<c:forEach var="largeCategory" items="${largeCategory}">

						<!-- a 태그 클릭시 값을 form의 input에 넘겨주고 이동 -->
						<div class="list-group-item largeCategory"<%--  onclick="location.href='/auctiongoods/auctiongoodsinsert_middle?largeCategoryCode=${largeCategory.largeCategoryCode}'" --%>>
							<span class="largeCategoryCode" style="display: none">${largeCategory.largeCategoryCode}</span>
							<span class="largeCategoryName">${largeCategory.largeCategoryName}</span>
							<!-- 대분류 코드 값을 넣어 전달하여 중분류 선택  -->
						</div>

					</c:forEach>
				</div>
			</div>

			<div class="col-sm-4 visible-lg visible-sm">
				<h3 class="visible-lg visible-sm visible-sm">중분류 전체</h3>
				<br>

				<div class="list-group" id="middleCategory" style="overflow: auto; height: 300px;">
						<div class="list-group-item">중분류</div>
				</div>
			</div>	
			
			<div class="col-sm-4 visible-lg visible-sm">
				<h3 class="visible-lg visible-sm visible-sm">소분류 전체</h3>
				<br>

				<div class="list-group" id="smallCategory"  style="overflow: auto; height: 300px;">
					<div class="list-group-item">소분류</div>
				</div>
			</div>

			<div class="col-sm-12">
				<form class="form-horizontal"
					action="${pageContext.request.contextPath}" method="post">
					
						<h3 class="visible-lg visible-sm visible-sm">카테고리 코드</h3>
						<input type="text" id="largeCategoryCode" name="largeCategoryCode" value="" readonly/> 
						<input type="text" id="middleCategoryCode" name="middleCategoryCode" value="" readonly/> 
						<input type="text" id="smallCategoryCode" name="smallCategoryCode" value="" readonly/>
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
							<input class="form-control" type="text" name="" value=""
								readonly>
							<!-- 회원코드는 핸드폰뒷자리 중복일경우 +1 -->
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">라디오버튼 속성명</label>
						<div class="col-sm-3">
							<label class="radio-inline"><input type="radio" name=""
								checked="checked" value="M">남</label> <label
								class="radio-inline"><input type="radio" name=""
								value="F">여</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"></label>&nbsp;&nbsp;&nbsp;
						<input class="btn btn-default" type="submit" value="등록">
						<input class="btn btn-default" type="reset" value="다시쓰기">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>



<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />