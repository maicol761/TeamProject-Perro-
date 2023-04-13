<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<%@ include file ="/WEB-INF/views/admin/include/aheader.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<body>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		type: 'GET',
		headers: {
			Accept: "application/json; charset=utf-8",
			"Content-type": "application/json; charset=utf-8"
		},
		url: 'sales_record_chart',
		success: function(result) {
			// 최신 버전의 구글 코어차트 패키지 로드해준다.
			google.charts.load('current', {'packages':['bar']});
			// 차트API가 로드완료했을 때 실행할 콜벡함수 선언
			google.charts.setOnLoadCallback(function() {
				drawChart(result);
			});
		},
		error: function() {
			alert("Chart drawing error!");
		}
	});
	
	function drawChart(result) {
		// 차트 그리는데 사용할 데이터 객체 생성
		var data = new google.visualization.DataTable();
		
		data.addColumn("string", "date");
		data.addColumn("number", "quantity");
		
		// 콘트롤러에서 json타입으로 전달된 데이터를 
		// 자바스크립트의 배열로 저장
		var dataArray = [];
		$.each(result, function(i, obj){
			dataArray.push([obj.date, obj.quantity]);
		})
		
		// data객체에 dataArray의 내용을 저장
		data.addRows(dataArray);
		
		// 바차트 그리기
		var barchart_options = {
			title: '제품별 판매 실적',
			vAxis: {title: '매출'},
	        hAxis: {title: '달'},
			width: 1000,
			height: 500
		};
	
		 var options = {
		        chartArea: {width: '80%'},
		        hAxis: {
		          title: '명',
		        },
		        vAxis: {
		          title: '경로'
		        }
		      };
		
		 var chart = new google.charts.Bar(document.getElementById('barchart_div'));
		chart.draw(data, barchart_options);
	}
	
});
</script>

 <div class="container-fluid px-2 px-md-4">
      <div class="page-header min-height-300 border-radius-xl mt-4" style="background-image: url('https://images.unsplash.com/photo-1531512073830-ba890ca4eba2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');">
        <span class="mask  bg-gradient-primary  opacity-6"></span>
   
      </div>
      <div class="card card-body mx-3 mx-md-4 mt-n6">
        <div class="row gx-4 mb-2">
          <div class="col-auto">
            <div class="avatar avatar-xl position-relative">
            
            </div>
          </div>
          <div class="col-auto my-auto">
            <div class="h-100">
            <h3>제품 판매 실적</h3>
            </div>
          </div>
   
        </div>
        
        <table>
		<tr>
			<td><div id="barchart_div" style="border:1px solid #ccc"></div></td>
		</tr>
		</table>
        
      </div>
    </div>



</body>
<%@ include file ="/WEB-INF/views/admin/include/afooter.jsp" %>
</html>