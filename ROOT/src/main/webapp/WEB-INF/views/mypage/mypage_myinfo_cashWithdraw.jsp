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
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<a href="${pageContext.request.contextPath}/main">홈</a>
			<span>></span>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain">마이페이지</a>
			<span>></span>
			<span style="color: #1266FF">캐쉬출금</span>
			<h2>나의 정보관리</h2>
		</div>
		<!-- 내용1 -->
		<c:import url="/resources/module/mypage_info.jsp" charEncoding="UTF-8" />
		<!-- 내용2 -->
		<div class="row content">				
			<!-- 캐쉬 상세내역 -->
	<div>
		<h3>캐쉬 출금신청</h3>
		<ul>


			<li>출금신청은 하루에 한번만 하실 수 있습니다.<span
				class="text-info"></span></li>
			<li>출금신청후 익일 출금됩니다.(토요일/공휴일 제외)</li>
			<li>출금 계좌정보가 다를 경우 출금신청이 취소 될 수 있습니다.<strong
				class="text-info"></strong>
			</li>
		</ul>
	</div>

	<div class="row mt30 clearfix">
		<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="box my-money-box text-center box-txt">
					<span class="fs15">출금 가능한 캐쉬</span>
				</div>
			</div>
			<div class="col-md-9 col-sm-6 col-xs-12	 clearfix">
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
		<a href="${pageContext.request.contextPath}/mypage/myinfo/Cash" class="btn btn-info">충전신청</a>
	</div>
	<form name="inputForm" id="inputForm" method="post"
		action="${pageContext.request.contextPath}/mypage/myinfo/CashWithdraw">
		<input type="hidden" name="cmd" id="cmd" value="in">
				<!-- 조회 테이블 -->
		<div class="row mt50">
			<div class="tableDefault mb30">
				<table class="table-vertical">
					<tbody>

						<tr>
							<th>출금금액</th>
							<td>
								<div class="form-group mb10">
									<div class="btn-list-ea">
										<button type="button" class="btn btn-basic-green"
											onclick="inputBankMoney(1000);">1000원</button>
										<button type="button" class="btn btn-basic-green"
											onclick="inputBankMoney(5000);">5000원</button>
										<button type="button" class="btn btn-basic-green"
											onclick="inputBankMoney(10000);">10,000원</button>
										<button type="button" class="btn btn-basic-green"
											onclick="inputBankMoney(50000);">50,000원</button>
										<button type="button" class="btn btn-basic-green"
											onclick="inputBankMoney(100000);">100,000원</button>
										<button type="button" class="btn btn-basic-green"
											onclick="inputBankMoney(500000);">500,000원</button>
										<button type="button" class="btn btn-basic-green"
											onclick="inputBankMoney(1000000);">1,000,000원</button>
									</div>
								</div>
								<div class="form-inline">
									<div class="input-group">
										<input type="number" id="bankmoney" name="cashPrice" maxlength="10" class="form-control">*1000원 이상 신청가능
										<button type="button" class="btn btn-dark-gray mr10">지우기</button>
										<strong class="mr10 fcBlue" id="moneyTxt"></strong>
									</div>
									<p class="mb5 visible-xs"></p>
									<span>원</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>출금계좌
							</th>
							<td>
								<div class="form-inline">
									<input type="text" name="moneysendname" id="moneysendname"
										maxlength="20" value="${account.accountNo}  ${account.accountBankName}"
										class="form-control mr10" readonly="readonly"> 
									<span>
									<c:if test="${account.accountBankName eq null}">
										<a href="${pageContext.request.contextPath}/mypage/myinfo/MyinfoAccountInsert">계좌추가</a>
									</c:if>
									<c:if test="${account.accountBankName ne null}">
										<a href="${pageContext.request.contextPath}/mypage/myinfo/MyinfoAccount">계좌변경</a>
									</c:if>
									
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!--// 조회 테이블 -->

			<div class="row text-center btn-col-2">
				<button type="submit" class="btn btn-info">출금하기</button>
				<a class="btn btn-info" href="${pageContext.request.contextPath}/mypage/mypageMain">뒤로가기</a>
			</div>
		</div>
	</form>
</div>
</div>
</div>

<!-- 충전 누를시 충전하시겠습니까? Y/N 구현해야되-->
<script type="text/javascript">
	function inputBankMoney(vl) {
		$("#bankmoney").val(vl);
	}
</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />