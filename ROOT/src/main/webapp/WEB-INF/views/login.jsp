<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="subContentsWrap" class="mobilePd">
		
		<div class="container">
	
			<!-- 회원가입 -->
            <div class="row visible-lg visible-md visible-sm">
                <ul class="join-stop clearfix">
                	<li class="on"><span class="step">STEP01</span><span class="step-tit">회원선택</span></li>
                	<li><span class="step">STEP02</span><span class="step-tit">약관동의 및<br> 본인확인</span></li>
                	<li><span class="step">STEP03</span><span class="step-tit">정보입력</span></li>
                	<li><span class="step">STEP04</span><span class="step-tit">가입완료</span></li>
                </ul>
            </div>
			<div class="row default">
			    <div class="col-md-6 col-default mb20">
			        <div class="boxBar box-black">
			            <h3 class="fs-md mb30"><strong>14세 이상 회원</strong></h3>
			            <p class="fs16 mb20">실명확인이 가능한 14세 이상<br>
			                내국인 구매/판매회원</p>
			            <div class="row default">
			                <p class=" col-sm-6 col-md-6 col-default"> <a href="#none" onclick="proc('SS');" class="btn btn-blue btn-lg text-left fs15i wp100">가입하기 <i class="fa fa-angle-right pull-right fs20"></i></a> </p>
			            </div>
                        <div class="join-ico"><img src="../images/member/join-individual-icon.png" class="img-responsive" alt=""></div>
		            </div>
		        </div>
			    <div class="col-md-6 col-default mb20">
			        <div class="boxBar box-black">
			            <h3 class="fs-md mb30"><strong>사업자 회원</strong></h3>
			            <p class="fs16 mb20"> 사업자등록증을 보유한<br>구매/판매회원</p>
			            <div class="row default">
			                <p class=" col-sm-6 col-default"> <a href="#none" onclick="proc('CS');" class="btn btn-blue btn-lg text-left fs15i wp100">가입하기 <i class="fa fa-angle-right pull-right fs20i"></i></a> </p>
			            </div>
                        <div class="join-ico"><img src="../images/member/join-business-icon.png" class="img-responsive" alt=""></div>
		            </div>
		        </div>
		    </div>
            <div class="row">
                <ul class="list-default list-bul-blue fs16">
                	<li>회원 유형별로 가입절차가 다르게 이루어지니, 반드시 해당하시는 유형을 선택하여 회원가입을 해주시기 바랍니다.</li>
                	<li>회원가입시 제공하신 개인정보는 코베이 서비스에 이용되며, 그 이외 용도로는 절대 사용되지 않습니다.</li>
                </ul>
            </div>
			<!--// 회원가입 -->
            
		</div>

	</div>
</body>
</html>