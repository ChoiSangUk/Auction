<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<style>
th {
	text-align: center;
	vertical-align: middle !important;
}
</style>

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
			<span style="color: #1266FF">1:1문의</span>
			<h2>1:1문의</h2>
		</div>
		<!-- 내용1 -->
		<div class="row content">
			<form class="form-horizontal" id="paymentForm" action="${pageContext.request.contextPath}/main" method="post">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="col-sm-2 active">분류</th>
							<td colspan="4">
								<div class="col-sm-4">
									<select class="form-control" name="">
										<option>선택하세요</option>
										<option>회원가입/탈퇴</option>
										<option>물품문의</option>
										<option>입금/결제문의</option>
										<option>반품/취소/환불문의</option>
										<option>기타문의</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<th class="col-sm-2 active">제목</th>
							<td colspan="4">
								<div class="col-sm-12">
									<input class="form-control" type="text" name=""
									value="" >
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">작성자</th>
							<td colspan="4">
								<div class="col-sm-3">
									<input class="form-control" type="text" name=""
									value="${userId}"  readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">내용</th>
							<td colspan="4">
								<div class="col-sm-12">
									<textarea class="form-control" rows="10"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">파일첨부</th>
							<td colspan="4">
								<div class="col-sm-5">
									<input class="form-control" type="file" name=""
									value=""  readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">개인정보 수집,<br>이용안내</th>
							<td colspan="4">
								<div class="col-sm-5">
									<p>수집, 이용 목적 : 문의에 대한 답변 완료시 알림 SMS, 메일 발송<br> 
									수집, 이용 항목 : 휴대전화번호, 이메일 주소 <br>
									수집, 이용 기간 : 문의에 대한 답변 완료 알림 후 즉시 삭제<br>
									</p>
									<input type="checkbox" value="" name="">
									위와 같이 개인정보 수집, 이용에 동의합니다.
								</div>
							</td>
						</tr>
					</tbody>
				</table>					
				<div class="form-group submit text-center">
					<input class="btn btn-info" type="submit" id="oToBtn" value="신청">
					<input class="btn btn-default" type="reset" id="resetBtn" value="다시쓰기">
				</div>
			</form>
		</div>

	</div>			
	<!-- 오른쪽 여백 -->		
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />