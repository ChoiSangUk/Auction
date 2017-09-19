<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<style>
.listMargin{
	margin-top: 5px;
	margin-bottom: 5px;
	
}
.blue{
	color:blue;
}
td,th {
	font-size: 15px;
	width: 200px;
	padding: 5px 8px 5px 8px;
	text-align: center;
}

</style>
<div style="margin-left:80px; margin-right:80px; margin-bottom:50px">
	<div class="container" style="margin-top:50px; margin-bottom:80px; text-align:center ">
		<h1>판매 안내</h1>
		<hr>
	</div>
	<div style="text-align:center; font-size:medium">
		<h2>저희 사이트가 처음이신가요?</h2>
		모든 구매자와 판매자에게 열려있는 오픈마켓! 당신을 환영합니다.<br>
		더 이상 헤매지 마십시오. 다 있습니다.
	</div>
	
	<div class="row" style="text-align:left; margin-bottom:30px">
		<h3 class="subTitle2"><span class="glyphicon glyphicon-asterisk" style="color:blue"></span> 판매를 하시기 전에 꼭! 확인해주세요.</h3>
		<ul style="list-style:none; font-size:medium">
		<li class="listMargin"><span class="glyphicon glyphicon-ok blue"></span> 판매를 이용하시려면 먼저 회원가입이 필요합니다.</li>
		<li class="listMargin"><span class="glyphicon glyphicon-ok blue"></span> 위조, 가짜, 법령상 판매가 제한 또는 금지된 품목은 등록할 수 없습니다.</li>
		<li class="listMargin"><span class="glyphicon glyphicon-ok blue"></span> 과대광고, 허위사실을 기재할 수 없습니다.</li>
		<li class="listMargin"><span class="glyphicon glyphicon-ok blue"></span> 정상적인 거래완료 후, 구매 수수료 공제 후 송금됩니다.</li>
		<li class="listMargin"><span class="glyphicon glyphicon-ok blue"></span> 품목 별 수수료가 상이합니다.</li>
		<li class="listMargin"><span class="glyphicon glyphicon-ok blue"></span> 가격을 올리기 위한 불법행위를 엄격히 제한 및 관리하고 있습니다.</li>
		</ul>
	</div>
	<div style="text-align:center; margin-bottom:50px;">
		<h1>판매 과정</h1>
		<br>
		<div style="border:1px solid grey; border-radius:2em;">
		<img style="width:100%;height:100%; border-radius:2em;" src="../resources/img/sellprocess.PNG" >
		</div>
	</div>
	<div class="row" align="center" style="width:100%" >
		<div class="col-sm-12 col-md-5 image" style="border:1px solid grey; border-radius:2em; margin:30px">
		<h3><span class="glyphicon glyphicon-usd"></span><span><b>판매 보증금</b></span></h3>
		<table class="sellerInfoTable">
			<tbody class="table-striped">
			<tr>
				<th>시작가(캐쉬)</th>
				<th>보증금(캐쉬)</th>
			</tr>
			<tr>
				<td>5000</td>
				<td>1000</td>
			</tr>
			<tr>
				<td>5000 ~ </td>
				<td>5000</td>
			</tr>
			<tr>
				<td>50000 ~ </td>
				<td>10000</td>
			</tr>
			<tr>
				<td>200000 ~ </td>
				<td>30000</td>
			</tr>
			<tr>
				<td>500000 ~</td>
				<td>50000</td>
			</tr>
			<tr>
				<td>2000000 ~</td>
				<td>100000</td>
			</tr>
			</tbody>
		</table>
		</div>
		<div class="col-sm-12 col-md-5 image" align="center" style="border:1px solid grey; border-radius:2em;margin:30px">
		<h3><span class="glyphicon glyphicon-usd"></span><span><b>판매 수수료</b></span></h3>
		<table class="sellerInfoTable">
			<tbody class="table-striped">
			<tr>
				<th>낙찰가</th>
				<th>수수료</th>
			</tr>
			<tr>
				<td>10만캐쉬 미만</td>
				<td>판매 대금의 5%</td>
			</tr>
			<tr>
				<td>10만캐쉬 이상</td>
				<td>판매 대금의 9%</td>
			</tr>
			
			</tbody>
		</table>
		</div>
	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />