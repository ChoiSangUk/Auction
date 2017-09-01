<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<div class="container-fluid">
	<!-- 왼쪽 여백 -->
	<div class="col-sm-1"></div>
	<!-- 가운데 메인 -->
	<div class="col-sm-10">
		<!-- 네이게이션 & 페이지 타이틀 -->
		<div class="row title">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span> <a
				href="${pageContext.request.contextPath}/main">홈</a> <span>></span>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain">마이페이지</a>
			<span>></span> <span style="color: #1266FF">나의등급/신용도</span>
			<h2>나의 정보관리</h2>
		</div>
		<!-- 내용1 -->
		<c:import url="/resources/module/mypage_info.jsp" charEncoding="UTF-8" />
		<!-- 내용2 -->
		<div class="row content">				
			<div class="row">
                <div class="col-md-6">                
				    <h3>구매자 신용도</h3>
            		<table class="table table-bordered">
            			<thead>
            				<tr>
            					<th class="text-center active"><a href="#none" onclick="getBuyInfo(1);" id="tabBuy1" class="tabBuys">최근1개월</a></th>
            					<th class="text-center active"><a href="#none" onclick="getBuyInfo(3);" id="tabBuy3" class="tabBuys">최근3개월</a></th>
            					<th class="text-center active"><a href="#none" onclick="getBuyInfo(6);" id="tabBuy6" class="tabBuys">최근6개월</a></th>
            					<th class="text-center active"><a href="#none" onclick="getBuyInfo(12);" id="tabBuy12" class="tabBuys active">최근12개월</a></th>
            				</tr>
            			</thead>
            			<tbody>
            				<tr>
            					<th colspan="2">정상거래</th>
            					<td colspan="2"><span id="buyInfo_trade">0</span>건</td>
            				</tr>
            				<tr>
            					<th colspan="2">미입금</th>
            					<td colspan="2"><span id="buyInfo_refuspayment">0</span>건</td>
            				</tr>
            				<tr>
            					<th colspan="2">구매거부/반품</th>
            					<td colspan="2">
            						<span id="buyInfo_denialbuy">0</span>
            						/ <span id="buyInfo_returned">0</span>건
            					</td>
            				</tr>
            				<tr>
            					<th colspan="2">사고율(실책 경매사고액/정산액)</th>
            					<td colspan="2"><span id="buyInfo_trouble_percent">0</span>%</td>
            				</tr>
            				<tr>
            					<th colspan="2">현재경매참여건수</th>
            					<td colspan="2"><span id="buyInfo_currentbid">0</span>건</td>
            				</tr>
            			</tbody>
            		</table>            
                </div>
                <div class="col-md-6">                
				    <h3>판매자 신용도</h3>
				    <table class="table table-bordered">
				        <thead>
				            <tr>
				                <th class="text-center active"><a href="#none" onclick="getSellInfo(1);" id="tabSell1" class="tabSells active">최근1개월</a></th>
            					<th class="text-center active"><a href="#none" onclick="getSellInfo(3);" id="tabSell3" class="tabSells ">최근3개월</a></th>
            					<th class="text-center active"><a href="#none" onclick="getSellInfo(6);" id="tabSell6" class="tabSells ">최근6개월</a></th>
            					<th class="text-center active"><a href="#none" onclick="getSellInfo(12);" id="tabSell12" class="tabSells ">최근12개월</a></th>
			                </tr>
			            </thead>
				        <tbody>
				            <tr>
				                <th colspan="2">정상거래</th>
				                <td colspan="2"><span id="sellInfo_trade">0</span>건</td>
			                </tr>
				            <tr>
				                <th colspan="2">판매/구매거부</th>
				                <td colspan="2"><span id="sellInfo_denialall">0</span>건</td>
			                </tr>
				            <tr>
				                <th colspan="2">반품</th>
				                <td colspan="2">
				                	상태 : <span id="sellInfo_damaged">0</span>건,
	                				진위 : <span id="sellInfo_original">0</span>건,
	                				기타 : <span id="sellInfo_etc">0</span>건
				                </td>
			                </tr>
				            <tr>
				                <th colspan="2">사고율(실책 경매사고액/정산액)</th>
				                <td colspan="2"><span id="sellInfo_trouble_percent">0</span>%</td>
			                </tr>
				            <tr>
				                <th colspan="2">낙찰율(낙찰건수/등록건수 비율)</th>
				                <td colspan="2"><span id="sellInfo_bidrate">0</span>%</td>
			                </tr>
			                <tr>
			                	<th colspan="2">문의게시판 응답률</th>
			                	<td colspan="2">
			                		<span id="sellInfo_boardanswer_percent">0</span>%
			                		(문의건수 :<span id="sellInfo_boardanswerall">0</span>)
			                	</td>
			                </tr>
			                <tr>
			                	<th colspan="2">현재진행경매</th>
			                	<td colspan="2"><span id="sellInfo_currentitem">0</span>건</td>
			                </tr>
			            </tbody>
			        </table>
                </div>
			</div>

		</div>
	</div>			
	<!-- 오른쪽 여백 -->		
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />