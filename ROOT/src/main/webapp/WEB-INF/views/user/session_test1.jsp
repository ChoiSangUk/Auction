<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<title>Session 사용</title>
</head>
<body>
<h2>Session 사용</h2>
<p>세션 이름 : <b>${userLoginInfo.userName}</b></p>
<p>세션 아이디:<b>${userLoginInfo.userId}</b></p>
<p>아이디:<b>${userId}</b></p>
<p>세션 권한 : <b>${userLoginInfo.userLevel}</b></p>
<p>세션  등급코드: <b>${userLoginInfo.gradeCode}</b></p> 
<p>등급: <b>${grade.gradeName}</b></p>
<p>캐쉬총액: <b>${userLoginInfo.userTotalcash}</b></p>

<P>페이지 상단에 &lt;%@ page session="<font color="red">true</font>" %&gt; 선언함</P>
</body>
</html>
