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
			<span style="color: #1266FF">캐쉬충전</span>
			<h2>나의 정보관리</h2>
		</div>
		<!-- 내용1 -->
		<div>
			<c:import url="/resources/module/mypage_info.jsp" charEncoding="UTF-8" />
		</div>
		<!-- 내용2 -->
		<div class="row content">				
			<!-- 캐쉬 상세내역 -->
	<div>
		<h3>캐쉬 충전신청</h3>
		<ul>
			<li>캐쉬 충전신청 후 입금을 해주시면 입금 30분~1시간 이내로 캐쉬 충전됩니다. <span
				class="text-info">(단, 충전신청 금액, 입금액 및 입금자명 동일시)</span></li>
			<li>입금[충전]신청 후 7일 동안 입금확인이 되지 않는 경우 입금오류로 변경되오며, 고객님의 이의제기가 없을 시
				자동 삭제됩니다.</li>
			<li>캐쉬 충전신청 후 입금하였으나 1시간 이후로도 정상적으로 캐쉬 충전이 되지 않을 경우 <strong
				class="text-info">일대일상담</strong>으로 문의바랍니다.
			</li>
		</ul>
	</div>

	<div class="row mt30 clearfix table-bordered">
		<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="box my-money-box text-center box-txt">
					<span class="fs15">사용 가능한 캐쉬</span>
				</div>
			</div>
			<div class="col-md-9 col-sm-6 col-xs-12 clearfix">
				<div class="box box-gray my-money-box clearfix">
					<p class="pull-left fs18 fcBlue">
						<strong>${userDetailInfo.userTotalcash} 원</strong>
					</p>
					<p class="pull-right btn-col-3">
						 <a href="${pageContext.request.contextPath}/mypage/myinfo/CashDetail">충전/출금 상세내역</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row text-center mt30">
		<a href="${pageContext.request.contextPath}/mypage/myinfo/CashWithdraw" class="btn btn-info">출금신청</a>
	</div>

	<form name="inputForm" id="inputForm" method="post" 
		action="${pageContext.request.contextPath}/mypage/myinfo/Cash">
		<input type="hidden" name="cmd" id="cmd" value="in">
				<!-- 조회 테이블 -->
		<div class="row mt50">
			<div class="tableDefault mb30 table-bordered well form-search">
				<table class="table-vertical">
					<tbody>
						<tr>
							<th>입금방법</th>
							<td>
								<div class="checkbox">
									<label> <input type="radio" value="5" name="payck"
										checked=""> 무통장입금
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>충전금액</th>
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
							<th>은행명</th>
							<td>
								<div class="col-md-4 col-xs-12">
									<select class="form-control">

										<option value="">선택하세요</option>

										<option value="30">농협 [ 501075-52-087677 : 예금주 :
											(주)강박송이 ]</option>

									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>입금<br class="visible-xs">예정인
							</th>
							<td>
								<div class="form-inline">
									<input type="text" name="moneysendname" id="moneysendname"
										maxlength="20" value="${userLoginInfo.userName}"
										class="form-control mr10"> <span>예) 홍길동</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>입금/결제정보 SMS로 받기</th>
							<td>
								<div class="form-inline">
									<div class="form-group">
										<input type="checkbox" name="recvbankcode" value="Y"
											checked=""> <input type="text"
											class="form-control dpInblock w60" name="sms1" id="sms1"
											maxlength="3" value="${userLoginInfo.userPhone}">
									</div>
									※ 수신이 가능한 휴대폰번호를 입력하세요.
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!--// 조회 테이블 -->

			<div class="row text-center btn-col-2">
				<button type="submit" class="btn btn-info">충전하기</button>
				<a class ="btn btn-info" href="${pageContext.request.contextPath}/mypage/mypageMain">뒤로가기</a>
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