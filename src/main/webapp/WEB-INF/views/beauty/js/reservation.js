/**
 * 예약 js 
 */

function reservationPage(rtime,rteacher){

	if(document.getElementById("mid2").value == "") {
		  alert("로그인이 필요합니다.");
	      return false;
	}else{

		var url="reservationPage?rrdate="+document.getElementById("rrdate").value
		+"&dogList="+document.getElementById("dogList")
		+"&rtime="+rtime+"&rteacher="+rteacher;
		
		window.open(url,"_blank_",
		 "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=800, height=700," +
		 "left=600, top=100, status=no, titlebar=no");
	
	}
} 
	
function reservCheck() {
   var form = document.getElementById("reserv_Check");
   form.action = "reservation_home";
   form.submit();
}

function go_pay() {
	   var pay1 = parseInt(document.getElementById("dno").value);
	   var pay2 = parseInt(document.getElementById("sno").value);

	   document.getElementById("pay3").value = pay1 + pay2;
	}


function go_save() {
	  var phone = document.getElementById("rphone").value;

	   if(document.getElementById("dogname").value == "") {
	      alert("애완견 이름을 입력해주세요.");
	      document.getElementById("dogname").focus();
	      return false;
	   }else if (document.getElementById("dno").value == "0") {
	      alert("견종을 선택해 주세요");
	      document.getElementById("dno").focus();
	      return false;
	   }else if (document.getElementById("sno").value == "0") {
	      alert("서비스를 선택해 주세요");
	      document.getElementById("sno").focus();
	      return false;
	   }else if (phone == "") {
	      alert("연락처를 입력해 주세요");
	      document.getElementById("rphone").focus();
	      return false;
	   }else if(!(/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/.test(phone))){
           alert("제대로 입력해주세요(000-0000-0000)");
           document.getElementById("rphone").focus();
           return false;
	   }else{
		   var form = document.getElementById("reserv_form");
			form.action="reservation_write";
			form.submit();
	   }
}


