<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


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
.bseq_ea {

    display:none;

}

</style>

<script type="text/javascript">
	function idok() {
		opener.parent.location.reload();
		window.close();
	}

	function fnCalCount(type, ths){
	    var $input = $(ths).parents("td").find("input[name='qty']");
	    var tCount = Number($input.val());
	    var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());
	    
	    if(type=='p'){
	        if(tCount < tEqCount) {
	        	$input.val(Number(tCount)+1);
	        	go_pay();
	        }
	        
	        
	    }else{
	        if(tCount >0) {
	        	$input.val(Number(tCount)-1); 
	        	go_pay();
	        }
	       }
	}

	function go_cart() {
		
		if (document.getElementById("qty").value == "0") {
			alert("수량을 입력하세요");
			document.getElementById("qty").focus;
			return fales;
		} else if (document.getElementById("qty").value > 10) {
			alert("수량이 너무 많습니다")
			document.getElementById("qty").focus;
			return fales;
		} else {
			var form = document.getElementById("cart_update");
			form.action = "cart_update";
			form.submit();
		}
	}
	
	function go_pay() {
		   var pay1 = parseInt(document.getElementById("qty").value);
		   var pay2 = parseInt(document.getElementById("pay").value);

		   document.getElementById("pay3").value = pay1 * pay2;
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
								<h1 class="h4 text-drak-900 mb-4">주문 수정</h1>
							</div>

							<form class="user" method="post" name="cart_update"
								action="cart_update" id="cart_update">
								<br> 
								<label>구매자</label> ${sessionScope.loginUser.mname}
								<input type="hidden" name="mid"
									value="${sessionScope.loginUser.mname}" readonly="readonly">
								<br>
								
								<label>상품명</label> ${vo.pname }
								<hr>
								<br><br>
							<table>   
						
<tr style="text-align:center;">
	<td class="bseq_ea">100</td>
    <td>수량  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>
       <button type="button" onclick="fnCalCount('m', this);">-</button>
        <input type="text" id="qty" size="3" name="qty" value="${vo.qty }" style="text-align:center;" oninput="go_pay()">
       <button type ="button" onclick="fnCalCount('p',this);">+</button>
    </td>
</tr>
</table>		

<input type="hidden" value="${vo.price }" id="pay" name="pay">
<input type="hidden" value="${vo.cart }" id="cart" name="cart">


									<br>
								<label>가격</label>
								  	 	<input type="text" value="${vo.qty * vo.price}" name="pay3" id="pay3" readonly onKeyUp='NumFormat(this)'>	
									<br>
									<br>
									
									<input class="btn btn-primary btn-user btn-block" type="button" value="수정" onclick="go_cart()">
										<br>
										<div class="text-center">
											<input class="btn btn-danger" type="button" value="취소" onclick="idok()">
										</div>
										</form>
								</div>
						</div>
					</div>
				</div>	
			</div>
		<hr>
	</div>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
