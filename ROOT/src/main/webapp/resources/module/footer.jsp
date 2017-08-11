<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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