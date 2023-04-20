<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
<%@ include file ="../include/bHeader.jsp" %>


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
          <div class="container" >
          
   
            <div class="row" >
              <div class="col-sm-5 col-sm-offset-3 mb-sm-40"
              style="border: 1px solid #c8c8c8; border-radius: 1em; background-color:white;">
                 <h3 class="font-alt">Login</h3>
                <hr class="divider-w mb-10">
              	<form class="user" id="loginOk" action="loginOk" method="post">
                  <div class="form-group">
                    <input class="form-control" id="mid" type="text" name="mid" placeholder="아이디"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="mpwd" type="password" name="mpwd" placeholder="비밀번호"/>
                  </div>
                  <div class="form-group">
                  <!-- 이 버튼 누르면 로그인 -->
                    <a href="javascript:loginOk()"
						class="btn btn-block btn-round btn-b">Login</a>
                  </div>
                 <a href="join">회원가입</a>
                </form>
                
              </div>
            </div>
          </div>
        </section>
          </div>
        
</body>

<script type="text/javascript">
		function loginOk() {
			var form = document.getElementById('loginOk');
			form.action = "loginOk";
			form.submit();
		}
	</script>

<%@ include file="../include/footer.jsp" %>