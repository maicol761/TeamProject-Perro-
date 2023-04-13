

function go_cart() {
	if (document.getElementById("qty").value == "0") {
		alert("수량을 입력하세요");
		document.getElementById("qty").focus;
		return fales;
	} else if (qty > 10) {
		alert("수량이 너무 많습니다")
		document.getElementById("qty").focus;
		return fales;
	} else {
		var form = document.getElementById("cart_update");
		form.action = "cart_update";
		from.submit();
	}
}

// 장바구니 내역 주문 처리
function cart_insert() {
	var form = document.getElementById("theform");
	form.action = "order_insert";
	form.submit();
}


//주문 수정


