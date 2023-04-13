<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!DOCTYPE html>
<%@ include file ="../include/bHeader.jsp" %>
<meta charset="utf-8">

<body>

	  <div class="main">
             <section class="module bg-dark-30" data-background="img/login01.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
              </div>
            </div>
          </div>
        </section>
        
        <section class="module">
          <div class="container">
            <div class="row">
             
               <div class="col-sm-5 col-sm-offset-3 mb-sm-40"
              style="border: 1px solid #c8c8c8; border-radius: 1em; background-color:white;">
                <h3 class="font-alt">회원가입</h3>
                <hr class="divider-w mb-10">
               <form class="user" name="joinForm" id="joinForm" method="post"
			action="joinOk">
                  <div class="form-group">
                 		<input type="text" class="form-control"
										id="mid2" placeholder="아이디" name="mid2" onchange="check_id()">
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="mname" type="text" name="mname" placeholder="이름"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="mpwd" type="password" name="mpwd" placeholder="비밀번호"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="rpwd" type="password" name="rpwd" placeholder="비밀번호확인"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="mphone" type="text" name="mphone" placeholder="전화번호(000-0000-0000)"/>
                  </div>
                  <div class="form-group">
                    <label class="sr-only" for="address">주소</label>
                    <input type="text" id="sample6_address" onclick="sample6_execDaumPostcode()" class="form-control" placeholder="주소찾기(클릭하시오)*" required="required" data-validation-required-message="Please enter your maddr."
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
                    <input class="form-control" id="email" type="email" name="email" placeholder="이메일" onblur="check_id()" required="required" data-validation-required-message="Please enter your email."/>
                  </div>
                  
                  <div class="form-group">
                   <a href="javascript:joinOk()"
									class="btn btn-block btn-round btn-b"> 가입하기 </a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
	</div>
	</body>

	<script type="text/javascript">
	function check_id() {
		var mid = document.getElementById("mid2");
		var idcheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,12}$/.test(document
				.getElementById("mid2").value); //영문,숫자

		if (mid.value == "") {
			alert("아이디를 입력해 주세요");
			mid.focus();
			return false;
		}
		if (!idcheck) {
			alert("아이디는 영문,숫자,특수문자 조합이어야합니다 8~12자");
			document.getElementById("mid2").value = null;
			return;
		}
		$
				.ajax({
					type : "POST",
					url : "idCheck",
					dataType : "text",
					data : {
						"mid2" : mid.value
					},
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success : function(result) {
						if (result == "success") {
							alert("사용가능한 아이디 입니다.");
							ok=0;
						} else {
							alert("이미사용중인 아이디 입니다.");
							document.getElementById("mid2").value = null;
							ok = 1;
							
						}
					},
					error : function() {
						alert("아이디 체크가 실패하였습니다.");

					}
				});
	}
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
	  
	  function addrdd() {
		  var addr1 = "우편번호:"+document.getElementById("sample6_postcode").value+"  주소:";
		  var addr2 = document.getElementById("sample6_address").value;
		  var addr3 = document.getElementById("sample6_extraAddress").value+"  ";
		  var addr4 = document.getElementById("sample6_address2").value;

		  document.getElementById("maddr").value = addr1+addr2+addr3+addr4;
		  
		  }
	function joinOk() {

		var phone = document.getElementById("mphone").value;
		var idcheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,12}$/.test(document
				.getElementById("mid2").value); //영문,숫자
		var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,12}$/.test(document
				.getElementById("mpwd").value); //영문,숫자
		var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,12}$/
				.test(document.getElementById("mpwd").value); //영문,특수문자
		var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,12}$/.test(document
				.getElementById("mpwd").value); //특수문자, 숫자

		if (document.getElementById("mid2").value == "") {
			alert("아이디를 입력해 주세요");
			document.getElementById("mid2").focus();
			return false;
		}
		
		if (!(check1 || check2 || check3)) {
			alert("비밀번호는 영문,숫자,특수문자 조합이어야합니다 8~12자");
			return;
		}
		if (/(\w)\1\1/.test(document.getElementById("mpwd").value)) {
			alert("같은 문자를 3번 이상 사용하실 수 없습니다.\n패스워드 설정안내를 확인해 주세요.");
			return;
		}
		if (document.getElementById("mname").value == "") {
			alert("이름을 입력해 주세요");
			document.getElementById("mname").focus();
			return false;

		}
		if (document.getElementById("mpwd").value == "") {
			alert("비밀번호를 입력해 주세요");
			document.getElementById("mpwd").focus();
			return false;

		}
		if (document.getElementById("rpwd").value == "") {
			alert("비밀번호확인을 입력해 주세요");
			document.getElementById("rpwd").focus();
			return false;
		}
		if (document.getElementById("rpwd").value != document
				.getElementById("mpwd").value) {
			alert("비밀번호가 일치하지 않습니다");
			document.getElementById("rpwd").focus();
			return false;
		}
		if (phone == "") {
			alert("연락처를 입력해 주세요");
			document.getElementById("mphone").focus();
			return false;

		} else if (!(/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/.test(phone))) {
			alert("제대로 입력해주세요(000-0000-0000)");
			document.getElementById("mphone").focus();
			return false;
		}
		if (document.getElementById("maddr").value == "") {
			alert("주소를 입력해 주세요");
			document.getElementById("maddr").focus();
			return false;
		} 
		alert("회원가입완료");
		var form = document.getElementById('joinForm');
		form.action = "joinOk";
		form.submit();
	}
	
	</script>



	<%@ include file="../include/footer.jsp" %>