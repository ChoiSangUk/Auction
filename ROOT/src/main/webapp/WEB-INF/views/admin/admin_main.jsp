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
			<div id="curve_chart" style="width: 900px; height: 500px"></div>
			<c:forEach var="sales" items="${incomeList}">
				<span>${sales.salesLogDate}</span>
				<span>${sales.salesLogPrice}</span>
			</c:forEach>
			<span>----</span>
			<c:forEach var="sales" items="${outcomeList}">
				<span>${sales.salesLogDate}</span>
				<span>${sales.salesLogPrice}</span>
			</c:forEach>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<script>
$.ajax({
	url: '${pageContext.request.contextPath}/mSalesLogAjax',
	type: 'post',
	success: function(data){
		
		console.log(data);

		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ 'Month', '매출', '매입' ], 
					['2004',  1000,      400],
			        ['2005',  1170,      460],
			        ['2006',  660,       1120],
			        ['2007',  1030,      540]
			        ]);

			var options = {
				title : 'Company Performance',
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