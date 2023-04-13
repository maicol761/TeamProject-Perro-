<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="beauty/js/reservation.js"></script>
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

	<br>

<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<div class="row">
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-drak-900 mb-4">예약 하기</h1>
							</div>

							<form class="user" method="post" name="reserv_form"
								action="reserv_form" id="reserv_form">
								<br> 
								<label>예약자</label> ${sessionScope.loginUser.mid}
								<input type="hidden" name="mid"
									value="${sessionScope.loginUser.mid}" readonly="readonly">
								<br>
								
								<label>예약 날짜</label> ${vo.rrdate }
								<input type=hidden name="rrdate"
									value=${vo.rrdate } readonly="readonly">
								<br> 
								
								<label>예약 시간</label> ${vo.rtime }:00시 
								<input type=hidden name="rtime" 
									value="${vo.rtime }" readonly="readonly"> 
								<br> 
								
								<label>담당 선생님</label> ${vo.rteacher }
								<input type=hidden name="rteacher"
									value=${vo.rteacher } readonly="readonly">
								<br>
								
							<div style="margin-top: 20px">
								<label>애완견 이름</label> 
									<input type="text" name="dogname" id="dogname"> 
									<br>
								
								<label>견종 선택</label> 
									<select name="dno" id="dno" onchange="go_pay()">
										<c:forEach items="${dogList}" var="kind">
											<option value="${kind.dpay}">${kind.dogweight}
												${kind.breed }</option>
										</c:forEach>
									</select>
									<br>
								
								<label>서비스 선택</label> 
									<select name="sno" id="sno"
										onchange="go_pay()" class="selectpicker show-tick">
										<c:forEach items="${serviceList}" var="kind2">
											<option value="${kind2.spay}">${kind2.sname}</option>
										</c:forEach>
									</select>
									<br>
								
								<label>연락처</label> 
										<input type="text" name="rphone" id="rphone"> 
									<br>
									
								<label>기타 요청사항</label> 
										<input type="text" name="comment" id="comment"> 	
									<br>
									<br>
									<br>
								<label>가격</label>
								  	 	<input type="text" name="pay3" id="pay3" readonly onKeyUp='NumFormat(this)'>	
								
									<br>
									<br>
									
									<input class="btn btn-primary btn-user btn-block" type="button" value="예약" onclick="go_save()">
										<br>
										<div class="text-center">
											<input class="btn btn-danger" type="button" value="취소" onclick="idok()">
										</div>
								</div>
							</form>
						</div>
					</div>
				</div>	
			</div>
	</div>
</div>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>