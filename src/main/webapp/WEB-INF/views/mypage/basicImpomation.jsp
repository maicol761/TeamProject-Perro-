<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/bHeader.jsp"%>	
	
<!DOCTYPE html>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
  
   <script>
  function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_address2")
								.focus();
					}
				}).open();
	}
//버튼눌렀을때 체크 할 것

function go_Insert() {
	
	
	
	
	
	  var phone = document.getElementById("mphone").value;
	   
	   if(!(/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/.test(phone))){
	       alert("제대로 입력해주세요(000-0000-0000)");
	       document.getElementById("cophone").focus();
	       return false;
	   }if (document.getElementById("mphone").value == "") {
			alert("전화번호를 입력해 주세요");
			document.getElementById("mphone").focus();
			return false;
	   }
	   if (document.getElementById("mname").value == "") {
			alert("이름을 입력해 주세요");
			document.getElementById("mname").focus();
			return false;
		}
		if (document.getElementById("sample6_address").value == "") {
			alert("주소를 입력해 주세요");
			document.getElementById("sample6_address").focus();
			return false;
		}
		if (document.getElementById("sample6_address2").value == "") {
			alert("상세주소를 입력해 주세요");
			document.getElementById("sample6_address2").focus();
			return false;
		}else{
		   var form = document.getElementById("basicUpdate");
			form.action="basicUpdate";
			form.submit();
	   }
}
  
  function addrdd() {
	  var addr1 = "우편번호:"+document.getElementById("sample6_postcode").value+" 주소:";
	  var addr2 = document.getElementById("sample6_address").value;
	  var addr3 = document.getElementById("sample6_extraAddress").value+" ";
	  var addr4 = document.getElementById("sample6_address2").value;

	  document.getElementById("maddr").value = addr1+addr2+addr3+addr4;
	  }
  
  </script>
  
  
  </head>

<!--                       -->

 <body>
 
 <div class="main">

        <section class="module bg-dark-60 faq-page-header" data-background="img/mypage01.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">My Page</h2>
                <div class="module-subtitle font-serif">We'll provide you with the best service.</div>
              </div>
            </div>
          </div>
        </section>
        
<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">My Page</strong></div>
        </div>
      </div>
    </div>
    
        <section class="module-small">
     
          <div class="container">
            <div class="row">
              <div class="col-sm-4 col-md-3 sidebar">
                <div class="widget">
                  <h5 class="widget-title font-alt">SERVICES</h5>
                  <ul class="icon-list">
                    <li><a href="reservationListAll">전체 예약내역</a></li>
                    <li><a href="NowreservationListAll">진행중인 예약내역</a></li>
                    <li><a href="PastreservationListAll">과거 예약내역</a></li>
                  </ul>
                </div>
                 <div class="widget">
                  <h5 class="widget-title font-alt">shop</h5>
                  <ul class="icon-list">
                    <li><a href="confirm_now_list">주문내역</a></li>
                    <li><a href="confirm_past_list">과거구매내역</a></li>
                  </ul>
                </div>
                 <div class="widget">
                  <h5 class="widget-title font-alt">MEMBERSHIP</h5>
                  <ul class="icon-list">
                    <li><a href="basicImpo">기본정보변경</a></li>
                    <li><a href="pwdChange">비밀번호변경</a></li>
                  </ul>
                </div>
              </div>
              
              
              <div class="col-sm-8 col-sm-offset-1">
                <div class="post">
          		  <div class="row mb-5">
          		  
		<section class="module" id="contact" >
          <div class="container">
       
            <div class="row">
               <h3>기본정보변경</h3><br>
            </div>
            <div class="row">
              <div class="col-sm-6">
                <form action="basicUpdate" id="basicUpdate" name="basic" method="post">
                  <div class="form-group">
                    <label class="sr-only" for="email">성함</label>
                    <input value="${MemberDetail.mname}" class="form-control" type="text" id="mname" name="mname" placeholder="성함*" required="required" data-validation-required-message="Please enter your mname."/>
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <label class="sr-only" for="email">아이디</label>
                    <input class="form-control" type="text" id="mid" name="mid" value="${MemberDetail.mid}" readonly/>
                    <p class="help-block text-danger"></p>
                  </div>
                  
                  <div class="form-group">
                    <label class="sr-only" for="mphone">전화번호</label>
                    <input value="${MemberDetail.mphone}" class="form-control" type="text" id="mphone" name="mphone" placeholder="전화번호*" required="required" data-validation-required-message="Please enter your mphone."/>
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <label class="sr-only" for="maddr">주소</label>
                    <input type="text" id="sample6_address" onclick="sample6_execDaumPostcode()" class="form-control" placeholder="주소*" required="required" data-validation-required-message="Please enter your maddr."
								name="addr1"> 
								
								<input type="hidden" id="sample6_address1" 
								name="sample6_address1" placeholder="주소">
								<br>
								<input type="hidden" id="sample6_postcode" 
								name="sample6_postcode" placeholder="우편번호" >

								<input type="hidden" id="sample6_extraAddress"
								name="sample6_extraAddress" placeholder="참고항목">
								<input type="text" id="sample6_address2" class="form-control" placeholder="상세주소*"  required="required" data-validation-required-message="Please enter your maddr."
								placeholder="상세주소" name="sample6_address2" size="50"
								onchange="addrdd()" >
								<input type="hidden" id="maddr" name="maddr" readonly="readonly" size=50>
								 <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <label class="sr-only" for="email">이메일</label>
                    <input value="${MemberDetail.email}" class="form-control" type="email" id="email" name="email" placeholder="이메일*" required="required" data-validation-required-message="Please enter your email."/>
                    <p class="help-block text-danger"></p>
                  </div>
                  
                  <input type="hidden" name="aposition" id="aposition" value="${MemberDetail.aposition}">
                  
                  <div class="text-center">
                    <button class="btn btn-block btn-round btn-d" id="cfsubmit" onclick="go_Insert()">수정</button>
                  </div>
                </form>
                <div class="ajax-response font-alt" id="contactFormResponse"></div>
              </div>
            </div>
          </div>
        </section>
            							</div>
								                
								                </div>
								              </div>
								            </div>
								          </div>
								 </section>      
     
</div>
   <hr class="divider-d"> 
</body>
    

<%@ include file ="../include/footer.jsp" %>

