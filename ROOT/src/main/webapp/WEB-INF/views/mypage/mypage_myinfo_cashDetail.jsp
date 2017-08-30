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
			<span>></span> <span style="color: #1266FF">캐쉬관리</span>
			<h2>나의 정보관리</h2>
		</div>
		<!-- 내용1 -->
		<c:import url="/resources/module/mypage_info.jsp" charEncoding="UTF-8" />
		<!-- 내용2 -->
		<div class="row content">
			<!-- 캐쉬 상세내역 -->
			<div>
				<h3>캐쉬 관리</h3>
				<ul>
					<li>캐쉬 입출금 거래내역입니다.</li>
					<li>캐쉬 대금결제는 낙찰대금 [입금신청]시 사용 하실 수 있습니다.</li>
					<li>기타 문의 사항은 고객센터<strong class="text-info"> 상담도우미</strong>를
						이용해 주시기 바랍니다.
					</li>
				</ul>
			</div>

			<div class="row mt30 clearfix table-bordered">
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12 ">
						<div class="box my-money-box text-center box-txt">
							<span class="fs15 ">사용 가능한 캐쉬</span>
						</div>
					</div>
					<div class="col-md-9 col-sm-6 col-xs-12 clearfix">
						<div class="box box-gray my-money-box clearfix">
							<p class="pull-left fs18 fcBlue">
								<strong>${userDetailInfo.userTotalcash} 원</strong>
							</p>
							<p class="pull-right btn-col-3">
								<a href="#">충전관리</a> <a href="#">출금관리</a> <a href="#">상세내역</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row text-center mt30">
				<a href="${pageContext.request.contextPath}/mypage/myinfo/Cash"
					class="btn btn-info">충전신청</a> <a
					href="${pageContext.request.contextPath}/mypage/myinfo/CashWithdraw"
					class="btn btn-info">출금신청</a>
			</div>
			<form name="CashDetailForm" id="CashDetailForm" method="post"
				class="form-horizontal" action="${pageContext.request.contextPath}/mypage/myinfo/CashDetail">
				<div class="row mt50">
					<h3>조회</h3>
					<div class="tableDefault mb30">
						<div class="tableDefault mb30">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th class="text-center active">결제구분</th>
									<td>
										
											<div class="visible-lg visible-md">
												<label class="checkbox-inline"> <input
													type="checkbox" value="충전" name="cashState"> 캐쉬충전
												</label><label class="checkbox-inline"> <input
													type="checkbox" value="출금" name="cashState"> 캐쉬출금
												</label><!-- <label class="checkbox-inline"> <input
													type="checkbox" value="30" name="deltype">
													환불(반품/판매취소)
												</label> <label class="checkbox-inline"> <input
													type="checkbox" value="60" name="deltype"> 광고신청
												</label> 
												<label class="checkbox-inline"> <input
													type="checkbox" value="10" name="deltype"> 물품구매
												</label>  -->
											</div>
										</td>
									</tr>
									<tr>
										<th class="text-center active" rowspan="2">조회방법</th>
										<td>
											
											<div class="visible-lg visible-md">
												<label class="radio-inline"> 
												<input type="radio" name="cashDate"> 전체보기
												</label> <label class="radio-inline"> <input type="radio"
													value="day" name="cashDate"> 일별보기
												</label> <label class="radio-inline"> <input type="radio"
													value="range-7d" name="cashDate"> 최근일주
												</label> <label class="radio-inline"> <input type="radio"
													value="range-1m" name="cashDate"> 최근1개월
												</label> <label class="radio-inline"> <input type="radio"
													value="range-3m" name="cashDate"> 최근3개월
												</label> <label class="radio-inline"> <input type="radio"
													value="range-6m" name="cashDate" checked> 최근6개월
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="visible-lg visible-md">
												<label class="radio-inline"> <input type="radio"
													name="cashDate"> 기간검색
												</label>
											</div>
											<div class="form-inline">
												<div class="col-sm-2 input-group date"
													data-provide="datepicker" id="date1">
													<input class="form-control" type="text"
														name="adApplyStartDate">
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-th"></span>
													</div>
												</div>
												<span>~</span>
												<div class="col-sm-2 input-group date"
													data-provide="datepicker" id="date2">
													<input class="form-control" type="text"
														name="adApplyEndDate">
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-th"></span>
													</div>
												</div>
											</div>
										</td>
									</tr>
									
								</tbody>

							</table>
						</div>
					</div>
					<!--// 조회 테이블 -->

					<div class="row text-center btn-col-2">
						<button class="btn btn-info" type="submit">검색</button>
						<a class="btn btn-default"
							href="${pageContext.request.contextPath}/mypage/mypageMain">뒤로가기</a>
					</div>
					<!--결과값  -->
					<div class="tableDefault mb30 col-sm-8">
					<table class="table table-bordered">
						<c:if test="${cashDetail ne null}">
						<h3>검색결과</h3>
						<tr>
							<th class="text-center active">금액</th>
							<th class="text-center active">날짜</th>
							<th class="text-center active">상태</th>
						</tr>
						</c:if>
						<c:forEach var="cashDetail" items="${cashDetail}">
						<tr>
						
							<td>${cashDetail.cashPrice}원</td>
							<td>${cashDetail.cashDate}</td>
							<td>${cashDetail.cashState}</td>
						
						</tr>
						</c:forEach>
					</table>
					
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script type="text/javascript">

</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />