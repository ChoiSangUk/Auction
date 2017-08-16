<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<form action="${pageContext.request.contextPath}/user/userLogin">
<div>
	<div>
		<div>
			<label>아이디</label>
			<c:forEach var="u" items="${UserId}">
                <tr>
                    <td>${u.userId}</td>
                </tr>
            </c:forEach>
			<div>
				<input type="text" id="userId" name="userId" class="form-control"
					placeholder="아이디">
			</div>
		</div>
		<div>
			<label>비밀번호</label>
			<div>
				<input type="password" id="userPassword" name="userPassword"
					class="form-control" onkeyup="if(event.keyCode==13)doLogin();"
					placeholder="비밀번호">
			</div>
		</div>
		<div>
			<div>
				<label> <input type="checkbox" id="idSaveCheck"
					name="idSaveCheck"> 아이디 저장
				</label> <label> <input type="checkbox" id="autoLoginCheck"
					name="autoLoginCheck"> 자동 로그인
				</label>

			</div>
		</div>
	</div>
	<div>
	<a href="${pageContext.request.contextPath}/user/userJoin">회원가입</a>
	<a href="#">아이디/비밀번호찾기</a>
		<input type="submit" class="btn btn-default" value="로그인">
	</div>
</div>
</form>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />