<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<script>  

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}

</script>
<!--
user_level = 구매자
grade_code = grade1
restrict_code =	restrict1
user_totalcash = 0
defult 값
-->

<div>
	<form role="form" id="addForm"
		action="${pageContext.request.contextPath}/user/userLogin">
		<div class="form-group">
			<label for="userId">아이디</label> <input type="text"
				class="form-control" id="userId" name="userId" placeholder="아이디">
		</div>
		<div class="form-group">
			<label for="userPassword">비밀번호</label> <input type="password"
				class="form-control" id="userPassword" name="userPassword"
				placeholder="비밀번호">
		</div>
		<div class="form-group">
			<label for="chkpassword">비밀번호 확인</label> <input type="password"
				class="form-control" id="chkpassword" name="chkpassword"
				placeholder="비밀번호 확인">
			<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
		</div>
		<div class="form-group">
			<label for="userName">이름</label> <input type="text"
				class="form-control" id="userName" name="userName"
				placeholder="이름을 입력해 주세요">
		</div>
		<div class="form-group">
			<label for="userGender">성별</label> <input type="text"
				class="form-control" id="userGender" name="userGender"
				placeholder="이름을 입력해 주세요">
		</div>
		<div class="form-group">
			<label for="userBirth">주민번호</label> <input type="text"
				class="form-control" id="userBirth" name="userBirth"
				placeholder="이름을 입력해 주세요">
		</div>
		<div class="form-group">
			<label for="user_phone">연락처</label> <input type="text"
				class="form-control" id="user_phone" name="user_phone"
				placeholder="이름을 입력해 주세요">
		</div>
		<div class="form-group">
			<label for="user_email">이메일</label> <input type="email"
				class="form-control" id="user_email" name="user_email"
				placeholder="이름을 입력해 주세요">
		</div>
		<label for="user_email">주소</label> 
		<input type="text" id="sample6_postcode" placeholder="우편번호"> 
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> 
			<input type="text" id="sample6_address" placeholder="주소" class="form-control"> 
			<input type="text" id="sample6_address2" placeholder="상세주소" class="form-control">

		<div class="form-group text-center">
			<button type="submit" class="btn btn-info">
				회원가입<i class="fa fa-check spaceLeft"></i>
			</button>
			<button type="submit" class="btn btn-warning">
				가입취소<i class="fa fa-times spaceLeft"></i>
			</button>
		</div>
	</form>
</div>



<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />