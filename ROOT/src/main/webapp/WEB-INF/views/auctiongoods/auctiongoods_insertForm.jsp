<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<div class="container-fluid text-center" style="margin-right: 100px; margin-left: 100px;">
	<div class="row content">
		<h1>물품 등록</h1>
		<div class="col-sm-12 category text-left">
			<div class="col-sm-4">
				<h3>대분류 카테고리 선택</h3>
				<br>
				<div class="list-group" style="overflow: auto; height: 300px;">
					<c:forEach var="largeCategory" items="${largeCategory}">

						<!-- a 태그 클릭시 값을 form의 input에 넘겨주고 이동 -->
						<div class="list-group-item btn-default btn-default largeCategory"<%--  onclick="location.href='/auctiongoods/auctiongoodsinsert_middle?largeCategoryCode=${largeCategory.largeCategoryCode}'" --%>>
							<span class="largeCategoryCode" style="display: none">${largeCategory.largeCategoryCode}</span>
							<span class="largeCategoryName">${largeCategory.largeCategoryName}</span>
							<!-- 대분류 코드 값을 넣어 전달하여 중분류 선택  -->
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="col-sm-4">
				<h3>중분류 전체</h3>
				<br>

				<div class="list-group" id="middleCategory" style="overflow: auto; height: 300px;">
						<div class="list-group-item btn-default">중분류</div>
				</div>
			</div>	
			
			<div class="col-sm-4">
				<h3>소분류 전체</h3>
				<br>

				<div class="list-group" id="smallCategory"  style="overflow: auto; height: 300px;">
					<div class="list-group-item btn-default">소분류</div>
				</div>
			</div>
		</div>

		<div class="container col-sm-12"   style="margin:auto;">
			<div class="col-sm-2" align="right">
				<label class ="control-label" >선택된 카테고리</label>
			</div>
			<div class="col-sm-9">
				<label class="col-sm-2" id="largeCategoryLable"></label>
				<label class="col-sm-2" id="middleCategoryLable"></label>
				<label class="col-sm-2" id="smallCategoryLable"></label> 
			</div>
		</div>
		
			<div class="container col-sm-12"  style="margin:auto;">
			<hr>
				<form class="form-horizontal"
					action="${pageContext.request.contextPath}/auctiongoods/auctiongoodsinsert" method="post" id="frm">
					
						<input type="text"  name="userId" value="${userLoginInfo.userId}" style="display:none;">
					<!-- 카테고리 코드가 담아져서 전달되는곳 -->
						<div style="display:none;">
							<div class="col-sm-4">
							<input type="text" class="form-control" id="largeCategoryCode" name="largeCategoryCode"	value="" readonly /> 
							</div>
							<div class="col-sm-4">
							<input type="text" class="form-control" id="middleCategoryCode"	name="middleCategoryCode" value="" readonly /> 
						 	</div>
							<div class="col-sm-4">
							<input type="text" class="form-control" id="smallCategoryCode" name="smallCategoryCode"	value="" readonly />
							</div>
							<br>
							<br>
						</div>
						<br>
						
					<div class="form-group">
						<label class="col-sm-2 control-label">물품명</label>
						<div class="col-sm-3">
							<input class="form-control" type="text" name="auctionGoodsName" value="">
						</div>
					</div>
					
					<div class="form-group">
						<hr>
						<label class="col-sm-2 control-label">경매방식</label>
						<div class="col-sm-3">
							<label class="radio-inline">
							<input type="radio" name="auctionGoodsSys" value="normal" >일반</label> 
							<label class="radio-inline">
							<input type="radio" name="auctionGoodsSys" value="blind">블라인드</label>
						</div>
					</div>
					<!-- 일반 경매 선택시 노출되게 -->
					<div class="form-group" id="auctionGoodsBidSys" style="display:none">
						<hr>
						<label class="col-sm-2 control-label">입찰방식</label>
						<div class="col-sm-3">
							<label class="radio-inline">
							<input type="radio" name="auctionGoodsBidSys" value="normal">일반</label> 
							<label class="radio-inline">
							<input type="radio" name="auctionGoodsBidSys" value="blind">블라인드</label>
						</div>
					</div>
					
					<!--  시작가 -->
					<div class="form-group" >
						<hr>
						<div>
							<label class="col-sm-1 control-label">최소 입찰가</label>
							<div class="col-sm-2">
								<input class="form-control" id ="auctionGoodsStartPrice" type="text" name="auctionGoodsStartPrice" value="">
							</div>
							<label class="col-sm-2 control-label">판매 보증금 :</label>
							<input type="text" class="col-sm-2" id="sellerDepositPrice" name="sellerDepositPrice" readonly>
							<label class="col-sm-1 control-label">캐쉬</label>
							<label class="col-sm-2 control-label" >보유 캐쉬 :</label>
							<label class="col-sm-2 control-label" id="userTotalCash">${userLoginInfo.userTotalcash} 캐쉬</label>
						</div>

						<div class="form-group" id="bidUnit" style="display:none">
							<label class="col-sm-2 control-label">입찰 단위(원)</label>
							<div class="col-sm-1">
								<select name="auctionGoodsBidUnit" id="bidUnit">
									<option value="3">100</option>
									<option value="4">500</option>
									<option value="5">1000</option>
									<option value="6">5000</option>
									<option value="7">10000</option>
									<option value="8">50000</option>
									<option value="9">100000</option>
								</select>
							</div>
						</div>
						
						<div class="form-group" id="instantBuyState" style="display:none">
						<hr>
							<label class="col-sm-2 control-label">즉시구매여부</label>
							<div class="col-sm-3">
								<label class="radio-inline">
								<input type="radio" name="auctionGoodsInstantBuyState" value="on">가능</label> 
								<label class="radio-inline">
								<input type="radio" name="auctionGoodsInstantBuyState" value="off" >불가</label>
							</div>
							
							<div class="col-sm-5" id="instantBuyPrice" style="display:none">
								<label class="col-sm-3 control-label">즉시구매가</label>
								<input type="text" name="auctionGoodsInstantBuyPrice">
							</div>
						</div>
					</div>
					
					<div class="form-group">
					<hr>
						<label class="col-sm-2 control-label">경매시작날짜</label>
						<div class="col-sm-2">
							<input type="text" id="startDate" placeholder="클릭해보세요" name="auctionGoodsStartDate" readonly>
						</div>
						<label class="col-sm-2 control-label">경매 기간</label>
						<div class="col-sm-1">
							<select name="auctionGoodsTerm" id="goodsTerm">
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="10">10</option>
								<option value="13">13</option>
								<option value="14">14</option>
							</select>
						</div>
						
						<label class="col-sm-2 control-label">경매종료날짜</label>
						<div class="col-sm-2">
							<input type="text" id="endDate" placeholder="시작 날짜를 입력하세요" name="auctionGoodsEndDate" readonly>
						</div>
					</div>	
					
					<!-- 상세 내용 입력 및 사진 추가 에디터 -->
					<div class="form-group">
						<textarea name="auctionGoodsContents" id="ir1" rows="10" cols="100" style="width:100%; height:700px;">
						</textarea>
					</div>
					
					<div class="form-group">
<!-- 						<label class="col-sm-2 control-label"></label> -->
						<input class="btn btn-default" type="button" id="savebutton" value="등록">
						<input class="btn btn-default" type="reset" value="다시쓰기">
					</div>
				</form>
			</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/smarteditor/js/HuskyEZCreator.js"  charset="utf-8">
</script>
<script>
//datepicker 속성 지정
var minDate = moment().add('day',1).format('YYYY-MM-DD'); //내일부터 시작 가능
var maxDate = moment().add('day',12).format('YYYY-MM-DD'); 
console.log(minDate);
console.log(maxDate);
$('#startDate').datepicker({		
	language: 'ko',
	startDate: minDate,
	endDate: maxDate 
});

var oEditors = [];
//스마트에디터 프레임생성
$(function(){
nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",
		sSkinURI: "${pageContext.request.contextPath}/resources/smarteditor/SmartEditor2Skin.jsp",	
		htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		} 	//boolean
			
	});
});


	$(document).ready(function() {
		
		//전송버튼
		$("#savebutton").click(function(){
		  //id가 ir1인 textarea에 에디터에서 대입
		  oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

		  	//폼 submit
			 	// var tmp =  $('#ir1').val()
		 		// alert(tmp+'왜 안되냐?')
		  $("#frm").submit();
		});
		
		//최소 입찰가가 바뀔 때 보유캐쉬와 보증금을 비교
			$('#auctionGoodsStartPrice').change(function(){
				var auctionGoodsStartPrice = $('#auctionGoodsStartPrice').val();
				if(auctionGoodsStartPrice<5000){
					alert('최소 입찰가를 5000원 이상으로 입력하시오!')
					$('#auctionGoodsStartPrice').val('')
					$('#sellerDepositPrice').val('')
				}else{
					if(auctionGoodsStartPrice%100 != 0){
						alert('최소입찰가는 100의 배수로 입력해주세요!')
						$('#auctionGoodsStartPrice').val('')
						$('#sellerDepositPrice').val('')
					}else{			
					//console.log('최소입찰금액 : '+ auctionGoodsStartPrice);
					var userTotalCash = ${userLoginInfo.userTotalcash};
					console.log('보유금액 : '+ userTotalCash);
					
					$.ajax({
			            type : "GET",
			            url : "${pageContext.request.contextPath}/sellerdepositajax",
			            error : function(){
			                alert('통신실패!!');
			            },
			            success : function(data){
			                //alert("통신데이터 값 : " + data) ;
			               // console.log('ajax 후에 auctionGoodsStartPrice'+auctionGoodsStartPrice)
			               
			              //최소입찰가가 정해지면 보증금이 자동으로 정해짐
			               if(auctionGoodsStartPrice < 50000){
			            	   $('#sellerDepositPrice').val('5000')
			               }else if(auctionGoodsStartPrice >=50000 && auctionGoodsStartPrice <200000){
			            	   $('#sellerDepositPrice').val('10000')
			               }else if(auctionGoodsStartPrice >=200000 && auctionGoodsStartPrice <500000){
			            	   $('#sellerDepositPrice').val('30000')
			               }else if(auctionGoodsStartPrice >=500000 && auctionGoodsStartPrice <2000000){
			            	   $('#sellerDepositPrice').val('50000')
			               }else if(auctionGoodsStartPrice >=200000){
			            	   $('#sellerDepositPrice').val('100000')
			               }
			               
			               
			        	}
					});  
					}
				}
			});
		
		//startDate가 바뀌면 ajax로 endDate 설정
			$('#startDate').change(function(){
				var endDate = moment($('#startDate').val()).add('day',$('#goodsTerm').val()).format('YYYY-MM-DD'); 
				console.log('endDate : '+endDate)
				var endDateParam = {
					"endDate" : endDate
				};
				$.ajax({
		            type : "GET",
		            url : "${pageContext.request.contextPath}/enddateajax",
		            data : endDateParam,
		            contentType : 'application/json; charset=UTF-8',
		            error : function(){
		                alert('통신실패!!');
		            },
		            success : function(data){
		                //alert("통신데이터 값 : " + data) ;
 		                $('#endDate').val(endDate);
		                }
		        });
			});
			
		
		//goodsTerm이 바뀌면 ajax로 endDate 설정
			$('#goodsTerm').change(function(){
				var endDate = moment($('#startDate').val()).add('day',$('#goodsTerm').val()).format('YYYY-MM-DD');
				var endDateParam = {
						"endDate" : endDate
					};
				$.ajax({
		            type : "GET",
		            url : "${pageContext.request.contextPath}/enddateajax",
		            data : endDateParam,
		            contentType : 'application/json; charset=UTF-8',
		            error : function(){
		                alert('통신실패!!');
		            },
		            success : function(data){
		                //alert("통신데이터 값 : " + data) ;
 		                $('#endDate').val(endDate);
		                }
		        });
			});
		
		//대분류 카테고리를 클릭했을때의 동작
		$('.largeCategory').click(function() {
			var largeCategoryName = $(this).find('.largeCategoryName').text();
			var largeCategoryCode = $(this).find('.largeCategoryCode').text();

			//console.log(largeCategoryName);
			//alert(largeCategoryCode);
			var largeParam = {
				"largeCategoryCode" : largeCategoryCode
				//"largeCategoryName" : largeCategoryName
			};
			
			//console.log(largeParam);
			
			//대분류 카테고리를 누를때마다 중분류를 지워주고  다시 뿌림
			$('#middleCategory').children().remove();
			$('#middleCategoryCode').val("");
			$('#middleCategoryLable').text("");
			
			$('#smallCategoryCode').val("");
			$('#smallCategoryLable').text("");

			$.ajax({
				url : '${pageContext.request.contextPath}/auctiongoods/auctiongoodsinsert_middle',
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
						var spanTagMiddleCategoryName = $('<span style="display:none"></span>');
						
						//태그에 들어갈 클래스들을 추가
						divTag.addClass('list-group-item btn-default');
						divTag.addClass('middleCategory');
						
						spanTagLargeCategoryCode.addClass('largeCategoryCode');
						spanTagMiddleCategoryCode.addClass('middleCategoryCode');
						spanTagMiddleCategoryName.addClass('middleCategoryName');
						
						//태그에 속한 텍스트 내용을 추가
						spanTagLargeCategoryCode.append(largeCategoryCode);
						spanTagMiddleCategoryCode.append(middleCategoryCode);
						spanTagMiddleCategoryName.append(middleCategoryName);
						
						//div 태그에 각 span들을 추가
						divTag.append(middleCategoryName);
						divTag.append(spanTagLargeCategoryCode);
						divTag.append(spanTagMiddleCategoryCode);
						divTag.append(spanTagMiddleCategoryName);
						
						//만들어둔 태그들을 기존의 태그 안에 추가
						$('#middleCategory').append(divTag);
						//$('#middleCategory').append(spanTagLargeCategoryCode);
						//$('#middleCategory').append(spanTagMiddleCategoryCode);
					}

					$('#largeCategoryCode').val(largeCategoryCode);
					$('#largeCategoryLable').text(largeCategoryName+' > ');
					
					$('.middleCategory').click(function() {
						
						var largeCategoryCode = $(this).find('.largeCategoryCode').text();
						var middleCategoryCode = $(this).find('.middleCategoryCode').text();
						var middleCategoryName = $(this).find('.middleCategoryName').text();
						
						console.log('미들카테고리네임 ?' + middleCategoryName);
						
						var middleParam = {
								"largeCategoryCode" : largeCategoryCode,
								"middleCategoryCode" : middleCategoryCode
						};
						
						//원래있던 소분류를 지워주고 다시 뿌려주기 
						$('#smallCategory').children().remove();
						$('#smallCategoryCode').val("");
						$('#smallCategoryLable').text("");

						$.ajax({
							url : '${pageContext.request.contextPath}/auctiongoods/auctiongoodsinsert_small',
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
									var spanTagSmallCategoryName = $('<span style="display:none"></span>');
									
									//태그에 들어갈 클래스들을 추가
									divTag.addClass('list-group-item btn-default');
									divTag.addClass('smallCategory');
									
									spanTagLargeCategoryCode.addClass('largeCategoryCode');
									spanTagMiddleCategoryCode.addClass('middleCategoryCode');
									spanTagSmallCategoryCode.addClass('smallCategoryCode');
									spanTagSmallCategoryName.addClass('smallCategoryName');
									
									//태그에 속한 텍스트 내용을 추가
									spanTagLargeCategoryCode.append(largeCategoryCode);
									spanTagMiddleCategoryCode.append(middleCategoryCode);
									spanTagSmallCategoryCode.append(smallCategoryCode);
									spanTagSmallCategoryName.append(smallCategoryName);
									
									divTag.append(smallCategoryName);
									divTag.append(spanTagLargeCategoryCode);
									divTag.append(spanTagMiddleCategoryCode);
									divTag.append(spanTagSmallCategoryCode);
									divTag.append(spanTagSmallCategoryName);
									
									//만들어둔 태그들을 기존의 태그 안에 추가
									$('#smallCategory').append(divTag);
									//$('#smallCategory').append(spanTagLargeCategoryCode);
									//$('#smallCategory').append(spanTagMiddleCategoryCode);
									//$('#smallCategory').append(spanTagSmallCategoryCode);
								
								}
								
								$('#middleCategoryCode').val(middleCategoryCode);
								$('#middleCategoryLable').text(middleCategoryName+' > ');
								
								$('.smallCategory').click(function() {
									var smallCategoryCode = $(this).find('.smallCategoryCode').text();
									var smallCategoryName = $(this).find('.smallCategoryName').text();
									console.log(smallCategoryCode);
									$.ajax({
										url : '${pageContext.request.contextPath}/auctiongoods/auctiongoodsinsert',
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
											$('#smallCategoryLable').text(smallCategoryName);
											}
												
										});
									
								});
							}
							
						});
						
					});
				}
			});
		});
		
		
		//일반 라디오버튼 선택시 입찰 방식 보이게 토글 버튼으로 만듦
		 $('input[name=auctionGoodsSys]').click(function () {
		        if ($(this).val() == 'normal') {
		        	$('#auctionGoodsBidSys').show(); //경매방식이 일반일때 입찰방식 보임
		        	$('#bidUnit').show();		 	 //경매방식이 일반일때 입찰단위 보임	
		        	$('#instantBuyState').show();	 //경매방식이 일반일때 즉시구매여부 보임
		        } else {
		        	$('#auctionGoodsBidSys').hide();
		        	$('#bidUnit').hide();
		        	$('#instantBuyState').hide();
		        }
		 });
		
		//즉시구매가 가능일 때
		 $('input[name=auctionGoodsInstantBuyState]').click(function (){
			 if($(this).val() == 'on'){
				 $('#instantBuyPrice').show(); //즉시구매가 입력 보임
			 }else {
		        	$('#instantBuyPrice').hide();
		     }
		 });
		

	});
	
</script>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />