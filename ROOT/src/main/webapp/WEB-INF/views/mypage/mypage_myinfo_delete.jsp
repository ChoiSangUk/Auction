<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<style>
th {
	vertical-align: middle !important;
	text-align: center !important;
}

dd {
	margin-bottom: 10px;
}
</style>
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
			<span>></span> <span style="color: #1266FF">회원탈퇴</span>
			<h2>나의 정보관리</h2>
		</div>
		<!-- 내용1 -->
		<c:import url="/resources/module/mypage_info.jsp" charEncoding="UTF-8" />
		<!-- 내용2 -->
		<form action="" method="post">
			<div class="row content">
				<div class="text-center well">
					<h2>
						<strong>회원 탈퇴</strong>를 하시겠습니까?
					</h2>
					<p>아래 약관 내용을 참조하신 후 신중하게 버튼을 클릭하여 주시기 바랍니다.</p>
					<p>(미구현)</p>
				</div>
				<div class="tableDefault table-vertical">

					<table class="table table-hover">
						<colgroup>
							<col>
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center active">약관</th>
								<td>
									<dl>
										<dt>[개인정보관리]</dt>
										<dd class="mb20">
											거래내역이 없는 경우: 탈퇴일로 부터 6개월이후 모든 개인정보 삭제. 단 ip는 영구보관.<br>
											거래내역이 있는 경우: 개인정보(이름,거래정보,결제정보,신용도) 탈퇴일로 부터 5년간 보관.
										</dd>
										<dt>
											[이머니잔액 환불]<br>
										</dt>
										<dd class="mb20">탈퇴신청 후 2일이내(공휴일제외)고객님의 은행계좌로 송금됩니다.</dd>
										<dt>[재가입 및 아이디 사용]</dt>
										<dd class="mb20">
											탈퇴 전 사용하였던 아이디는 다시 사용하실 수 없습니다.
										</dd>
										<dt>[탈퇴가 불가한 경우]</dt>
										<dd>
											<strong class="fcBlue">진행중인 물품</strong>(판매/구매)이 있는 경우 탈퇴신청이
											불가능합니다.
										</dd>
									</dl>
								</td>
							</tr>
							<tr>
								<th class="text-center active">탈퇴신청사유</th>
								<td><select name="userRemoveReason" id="userRemoveReason"
									class="form-control">
										<option value="재가입">재가입</option>
										<option value="미사용">미사용</option>
										<option value="기타">기타</option>
								</select></td>
							</tr>
							<tr>
								<th class="text-center active">탈퇴사유</th>
								<td><textarea name="userRemoveReasonDetail" id="userRemoveReasonDetail" rows="5"
										class="form-control"></textarea></td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
					<div class="row text-center btn-col-2">
						<button class="btn btn-danger" type="submit">탈퇴</button>
						<a class="btn btn-default"
							href="${pageContext.request.contextPath}/mypage/mypageMain">뒤로가기</a>
					</div>
		</form>
	</div>

	<!-- 오른쪽 여백 -->
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />