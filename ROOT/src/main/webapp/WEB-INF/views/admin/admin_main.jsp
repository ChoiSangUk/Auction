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
  				<button class="btn btn-default">년별 매입매출</button>
  				</div>
  				<div class="panel-body">
					<div id="curve_chart" style="width: 80%; height: 600px; margin: auto;"></div>
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
					[chartDate[0]+'월', salesPrice[0], expensesPrice[0]],
					[chartDate[1]+'월', salesPrice[1], expensesPrice[1]],
					[chartDate[2]+'월', salesPrice[2], expensesPrice[2]],
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