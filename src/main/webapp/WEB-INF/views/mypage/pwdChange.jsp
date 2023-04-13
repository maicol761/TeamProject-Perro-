<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/bHeader.jsp"%>	
<!DOCTYPE html>
	<meta charset="UTF-8">
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
               <h3>${mid}님비밀번호변경</h3><br>
            </div>
            <div class="row">
              <div class="col-sm-6">
                <form action="pwdUpdate" name="pwdd" method="post" id="pwdd">
                  <div class="form-group">
                    <label class="sr-only" for="mpwd">새로운 비밀번호</label>
                    <input class="form-control" type="password" id="mpwd" name="mpwd" placeholder="새로운 비밀번호*" required="required" data-validation-required-message="Please enter your pwd."/>
                    <p class="help-block text-danger"></p>
                  </div>
                  
                  <div class="form-group">
                    <label class="sr-only" for="rpwd">비밀번호 확인</label>
                    <input class="form-control" type="password" id="rpwd" name="rpwd" placeholder="비밀번호 재입력*" required="required" data-validation-required-message="Please enter your pwd."/>
                    <p class="help-block text-danger"></p>
                  </div>
                  	<input type="hidden" name="mid" value="${mid}">
                  <div class="text-center">
                    <button class="btn btn-block btn-round btn-d" id="cfsubmit" onclick="joinOk()">수정</button>
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
    

    <div class="site-section">
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-2">

     	  
          </div>
    

        </div>

 
      </div>
    </div>
</body>

<script type="text/javascript">
	function joinOk() {
		var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,12}$/.test(document
				.getElementById("mpwd").value); //영문,숫자
		var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,12}$/.test(document
				.getElementById("mpwd").value); //영문,특수문자
		var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,12}$/.test(document
				.getElementById("mpwd").value); //특수문자, 숫자
		if (!(check1 || check2 || check3)) {
			alert("비밀번호는 영문,숫자,특수문자 조합이어야합니다 8~12자");
			return;
		}
		if (/(\w)\1\1/.test(document.getElementById("mpwd").value)) {
			alert("같은 문자를 3번 이상 사용하실 수 없습니다.\n패스워드 설정안내를 확인해 주세요.");
			return;
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
		var form = document.getElementById("pwdd");
   	 form.action="pwdUpdate";
	 form.submit();
	}
</script>
<%@ include file="../include/footer.jsp"%>
