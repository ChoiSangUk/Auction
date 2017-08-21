<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<div class="container text-left">
	<h3>나의 정보관리</h3>

	<div class="row">
		<div>
			<ul>
				<li><a href="#">회원정보수정</a></li>
				<li><a href="#">회원탈퇴</a></li>
				<li><a href="#">사업자회원 전환</a></li>
				<li><a href="#">나의 등급/신용도</a></li>
				<li><a href="#">캐쉬 관리</a></li>
				<li><a href="#">나의 계좌관리</a></li>
			</ul>
		</div>
	</div>
	<!--// submenu -->

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

	<div class="row mt30 clearfix">
		<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="box my-money-box text-center box-txt">
					<span class="fs15">사용 가능한 캐쉬</span>
				</div>
			</div>
			<div class="col-md-9 col-sm-6 col-xs-12 clearfix">
				<div class="box box-gray my-money-box clearfix">
					<p class="pull-left fs18 fcBlue">
						<strong>${userLoginInfo.userTotalcash} 원</strong>
					</p>
					<p class="pull-right btn-col-3">
						<a href="#">충전관리</a> <a href="#">출금관리</a> <a href="#">상세내역</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row text-center mt30">
		<a href="#">출금신청</a>
	</div>

	<form name="inputForm" id="inputForm" method="post" action="${pageContext.request.contextPath}/mypage/myinfo/Cash">
		<input type="hidden" name="cmd" id="cmd" value="in"> <input
			type="hidden" name="bankcode" id="bankcode" value=""> <input
			type="hidden" name="payMethod" id="payMethod" value="normalAcct">
		<input type="hidden" name="cashphone1" id="cashphone1" value="010">
		<input type="hidden" name="cashphone2" id="cashphone2" value="9065">
		<input type="hidden" name="cashphone3" id="cashphone3" value="0107">
		<input type="hidden" name="deltype" id="deltype" value="20"> <input
			type="hidden" name="pmtype" id="pmtype" value="10">
		<!-- 조회 테이블 -->
		<div class="row mt50">
			<div class="tableDefault mb30">
				<table class="table-vertical">
					<tbody>
						<tr>
							<th>입금방법</th>
							<td>
								<div class="checkbox">
									<label> <input type="radio" value="5" name="payck" checked=""> 무통장입금</label>
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
										<input type="text" id="bankmoney" name="cashSum"
											maxlength="10" class="form-control dpInblock w160 mr5"><span
											class="mr10">원</span>
										<p class="visible-xs">&nbsp;</p>
										<button type="button" class="btn btn-dark-gray mr10">지우기</button>
										<strong class="mr10 fcBlue" id="moneyTxt"></strong>
									</div>
									<p class="mb5 visible-xs"></p>
									<span>*1000원 이상 신청가능</span>
								</div>
							</td>
						</tr>
						<tr >
							<th>은행명</th>
							<td>
								<div class="col-md-4 col-xs-12">
									<select class="form-control">

										<option value="">선택하세요</option>

										<option value="30">농협 [ 501075-52-087677 : 예금주 :  (주)강박송이 ]</option>

									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>입금<br class="visible-xs">c예정인
							</th>
							<td>
								<div class="form-inline">
									<input type="text" name="moneysendname" id="moneysendname"
										maxlength="20" value="이어진" class="form-control mr10">
									<span>예) 홍길동</span>
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
											maxlength="3" value="010"> <span>-</span> <input
											type="text" class="form-control dpInblock w60" name="sms2"
											id="sms2" maxlength="4" value="9065"> <span>-</span>
										<input type="text" class="form-control dpInblock w60"
											name="sms3" id="sms3" maxlength="4" value="0107">
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
				<button type="submit">충전하기</button>
				<a href="#">뒤로가기</a>
			</div>
		</div>
	</form>
</div>
<!-- 충전 누를시 충전하시겠습니까? Y/N 구현해야되-->
<script type="text/javascript">
function inputBankMoney(vl) {
	$("#bankmoney").val(vl);
}

</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />