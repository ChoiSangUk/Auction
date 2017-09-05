<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<form name="AdminUserSeach" id="AdminUserSeach" method="post"
			class="form-horizontal" action="${pageContext.request.contextPath}/user/adminUserSearch">
	<div class="col-sm-10">
		<div class="row title">
		<!-- 메인화면  -->
		<h1>회원검색</h1>
		</div>
		
		<div class="row content">
			<div class="tableDefault mb30">
						<div class="tableDefault mb30">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th class="text-center active">회원구분</th>
									<td>
										
											<div>
												<label class="checkbox-inline"> <input
													type="checkbox" value="구매자" name="userLevel"> 구매자
												</label><label class="checkbox-inline"> <input
													type="checkbox" value="판매자" name="userLevel"> 판매자
												</label>
												
											</div>
										</td>
										
									</tr>
									<tr>
										<th class="text-center active">회원성별</th>
									<td>
										
											<div>
												<label class="checkbox-inline"> <input
													type="checkbox" value="남" name="userGender"> 남
												</label><label class="checkbox-inline"> <input
													type="checkbox" value="여" name="userGender"> 여
												</label>
												
											</div>
										</td>
										
									</tr>
									<tr>
										<th class="text-center active" rowspan="2">조회방법</th>
										<td>
											
											<div class="visible-lg visible-md">
												<label class="radio-inline"> <input type="radio"
													value="day" name="cashDate"> 일반회원
												</label> <label class="radio-inline"> <input type="radio"
													value="range-7d" name="cashDate"> 우수회원
												</label> <label class="radio-inline"> <input type="radio"
													value="range-1m" name="cashDate"> VIP
												</label> <label class="radio-inline"> <input type="radio"
													value="range-3m" name="cashDate"> VVIP
												</label> 
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="col-sm-2">
												<select class="form-control" name="sk">
													<option value="userId">아이디</option>
													<option value="adApplyState">입찰제한</option>
													<option value="adApplyState">이름</option>
													<option value="adApplyState">연락처</option>
												<option value="adApplyState">캐쉬보유</option>
													
												</select>
											</div>
											<div class="input-group col-sm-4">
												<input type="text" class="form-control" name="sv" placeholder="Search">
											</div>
										</td>
									</tr>
								</tbody>

							</table>
						</div>
					</div>
					<div class="row text-center btn-col-2">
						<input class="btn btn-info btn-lg" type="submit" id="submitBtn" value="검색">
						<input class="btn btn-lg" type="reset" id="resetBtn" value="검색삭제">
					</div>
				</div>

		<!-- 결과값 테이블 -->
		<div class="row content text-center">
			<c:if test="${userSearch ne null }">
				<h1>검색결과</h1>
			<table class="table table-bordered">
				<thead>
					<tr class="active">
						<th>아이디</th>
						<th>권한</th>
						<th>등급</th>
						<th>제한</th>
						<th>이름</th>
						<th>성별</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>주소</th>
						<th>상세주소</th>
						<th>보유캐쉬</th>
					</tr>
				</thead>
			<c:forEach var="userSearch" items="${userSearch}">
				<tbody>
					<tr>
						<td>${userSearch.userDetailVo.userId}</td>
						<td>${userSearch.userDetailVo.userLevel}</td>
						<td>${userSearch.gradeVo.gradeName}</td>
						<td>${userSearch.restrictVo.restrictState}</td>
						<td>${userSearch.userDetailVo.userName}</td>
						<td>${userSearch.userDetailVo.userGender}</td>
						<td>${userSearch.userDetailVo.userPhone}</td>
						<td>${userSearch.userDetailVo.userEmail}</td>
						<td>${userSearch.userDetailVo.userAddr}</td>
						<td>${userSearch.userDetailVo.userAddrdetail}</td>
						<td>${userSearch.userDetailVo.userTotalcash}</td>
								
					</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
		</div>
	</div>
	</form>
	<div class="col-sm-1"></div>
	
</div>

<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />