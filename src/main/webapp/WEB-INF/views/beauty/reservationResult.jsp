<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="beauty/reservation.js"></script>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>예약 하기</title>
<style>
label {
	display: inline-block;
	width: 150px;
}
</style>
	<script type="text/javascript">
		function idok() {
			opener.parent.location.reload();
			window.close();
		}
	</script>
</head>
<body>

	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<div class="row">
					<div class="col-lg-7">
						<div class="p-5">
							
			<c:choose>
				<c:when test="${result==1 }">		
					<div class="text-center">	
							<br><br><br><br><br>
								<h1 class="h4 text-drak-900 mb-4">예약 완료</h1>
					</div>
							<br><br><br><br><br><br><br><br><br><br>		
				</c:when>
				<c:otherwise>	
						<div class="text-center">	
								<br><br><br><br><br>
									<h1 class="h4 text-drak-900 mb-4">예약 실패</h1>
								<br><br><br><br><br>	
						</div>이미 예약된 상품입니다.
								<br><br><br><br><br><br><br><br><br><br>		
				
				</c:otherwise>
			</c:choose>
				<input class="btn btn-primary btn-user btn-block" type="button" value="닫기" onclick="idok()">
				
				
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</div>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
