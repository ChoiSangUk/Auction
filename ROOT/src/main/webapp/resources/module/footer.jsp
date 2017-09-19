<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 문의관리 버튼 -->
<div class="container-fluid footerContainer">
	<div class="col-sm-1"></div>
	<div class="col-sm-10 text-center">
		<div class="row footerBox content">
			<div class="col-sm-3">
				<a class="glyphiconLink" href="#">
				<span class="glyphicon glyphicon-phone-alt" style="font-size: 50px;">
				</span><br>
				1:1문의
				</a>
			</div>
			<div class="col-sm-3">
				<a class="glyphiconLink" href="#">
				<span class="glyphicon glyphicon-list-alt" style="font-size: 50px;">
				</span><br>
				구매안내
				</a>
			</div>
			<div class="col-sm-3">
				<a class="glyphiconLink" href="#">
				<span class="glyphicon glyphicon-file" style="font-size: 50px;">
				</span><br>
				판매안내
				</a>
			</div>
			<div class="col-sm-3">
				<a class="glyphiconLink" href="${pageContext.request.contextPath}/mypage/mypageAdInfo">
				<span class="glyphicon glyphicon-check" style="font-size: 50px;">
				</span><br>
				광고안내
				</a>
			</div>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>
<footer class="container-fluid text-center">
	<p>kpsl</p>	
</footer>
</body>

<script>
/* 실시간 날짜,시간 출력 함수 */
$(function() {
	setInterval(function() {
		var Now = new Date(); // Tue Oct 20 2015 10:48:49 GMT+0900 (대한민국 표준시) 라고 표시됩니다.
		Now.getFullYear(); // 년도
		Now.getMonth(); // 월  // 월 단위의 경우 0부터 시작되기 때문에 +1 을 해줘야 됩니다.
		Now.getDate(); // 일
		Now.getHours(); // 시
		Now.getMinutes(); // 분
		Now.getSeconds(); // 초
		var Now = new Date();
		var NowTime = Now.getFullYear();
		var Month = Now.getMonth()+1;
		NowTime += '-' + Month
		NowTime += '-' + Now.getDate();
		NowTime += ' ' + Now.getHours();
		NowTime += ':' + Now.getMinutes();
		NowTime += ':' + Now.getSeconds();
        $("#time").text(NowTime);
    }, 1000);
});

</script>
</html>