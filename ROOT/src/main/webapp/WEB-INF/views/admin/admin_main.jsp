<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title">
			<h1>회사 매입매출 그래프</h1>						
		</div>
		<div class="row content">
			<div class="panel panel-default">
  				<div class="panel-heading">
  				<button class="btn btn-default">월별 매입매출</button>
  				</div>
  				<div class="panel-body">
					<div id="curve_chart" style="width: 100%; height: 700px; margin: auto;"></div>
				</div>	
			</div>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<script>
$.ajax({
	url: '${pageContext.request.contextPath}/mSalesLogAjax',
	type: 'post',
	success: function(requestData){
		console.log(requestData);
 		var chartDate = new Array();
		var salesPrice = new Array();
		var expensesPrice = new Array();
		for(var i=0; i<requestData.length; i++) {
			chartDate[i] = requestData[i].chartDate;
			salesPrice[i] = requestData[i].salesPrice;
			expensesPrice[i] = requestData[i].expensesPrice;
		} 
		
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ 'Month', '매출', '매입' ], 
					['01월', salesPrice[0], expensesPrice[0]],
					['02월', salesPrice[1], expensesPrice[1]],
					['03월', salesPrice[2], expensesPrice[2]],
					['04월', salesPrice[3], expensesPrice[3]],
					['05월', salesPrice[4], expensesPrice[4]],
					['06월', salesPrice[5], expensesPrice[5]],
					['07월', salesPrice[6], expensesPrice[6]],
					['08월', salesPrice[7], expensesPrice[7]],
					['09월', salesPrice[8], expensesPrice[8]],
					['10월', salesPrice[9], expensesPrice[9]],
					['11월', salesPrice[10], expensesPrice[10]],
					['12월', salesPrice[11], expensesPrice[11]],
			        ]);

			var options = {
				title : '월별 매입매출',
				curveType : 'function',
				legend : {
					position : 'bottom'
				}
			};

			var chart = new google.visualization.LineChart(document
					.getElementById('curve_chart'));

			chart.draw(data, options);
		} 	 
	},
	error: function(data){
		console.log('error'+data);
	}	
});
		
	


	
</script>
<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />