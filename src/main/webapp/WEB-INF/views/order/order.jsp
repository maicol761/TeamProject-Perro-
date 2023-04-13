<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/bHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
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

function orderCheck() {
	  var phone = document.getElementById("phone").value;
	   if (document.getElementById("coname").value == "") {
		  alert("이름을 입력해주세요.");
		  document.getElementById("coname").focus();
		  return false;
	   }else if (phone == "") {
	      alert("연락처를 입력해 주세요");
	      document.getElementById("phone").focus();
	      return false;
	   }else if(!(/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/.test(phone))){
	       alert("제대로 입력해주세요(000-0000-0000)");
	       document.getElementById("cophone").focus();
	       return false;
	   }else if(document.getElementById("sample6_address").value == "") {
		      alert("주소를 입력해주세요.");
		      document.getElementById("sample6_address").focus();
		      return false;
	   }else if(document.getElementById("sample6_address2").value == "") {
		      alert("상세주소를 입력해주세요.");
		      document.getElementById("sample6_address2").focus();
		      return false;
	   }else{
		   var form = document.getElementById("order_real_insert");
			form.action="order_real_insert";
			form.submit();
	   }
}
  
  function addrdd() {
	  var addr1 = "우편번호:"+document.getElementById("sample6_postcode").value+"  주소:";
	  var addr2 = document.getElementById("sample6_address").value;
	  var addr3 = document.getElementById("sample6_extraAddress").value+"  ";
	  var addr4 = document.getElementById("sample6_address2").value;

	  document.getElementById("address").value = addr1+addr2+addr3+addr4;

	  
	  }
  
  </script>
  
  <section class="bg-dark-30 showcase-page-header module parallax-bg" data-background="img/dog02.jpg">
        <div class="titan-caption">
          <div class="caption-content">
            <div class="font-alt mb-30 titan-title-size-1">100+. Products.</div>
            <div class="font-alt mb-40 titan-title-size-4">Shop</div>
 			<a href="product_All" class="section-scroll btn btn-border-w btn-round">
					<i class="fa fa-cog fa-spin"></i> Go Shop</a>
          </div>
        </div>
      </section>

<section class="module">
        
     <form action="order_real_insert" name="order_real_insert" id="order_real_insert" method="post">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">Order</h1>
              </div>
            </div>
            <hr class="divider-w pt-20">
            <div class="row">
           
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <th class="hidden-xs">Item</th>
                      <th>Description</th>
                      <th class="hidden-xs">Price</th>
                      <th>Quantity</th>
                      <th>Total</th>
                      <th>Remove</th>
                    </tr>
              <c:forEach items="${cartviewVo }" var="cartVO"> 
              	<input type="hidden" id="cart" name="cart" value="${cartVO.cart }" readonly="readonly" size=50>
              	<input type="hidden" id="pno" name="pno" value="${cartVO.pno }" readonly="readonly" size=50>
              	<input type="hidden" id="qty" name="qty" value="${cartVO.qty }" readonly="readonly" size=50>
              	<input type="hidden" id="copay" name="copay" value="${totalPrice}" readonly="readonly" size=50>
              	
                    <tr>
                      <td class="hidden-xs">
                      <a href="#">
                      <img src="img/product/${cartVO.image }" alt="Accessories Pack"/>
                      </a></td>
                      <td>
                        <h5 class="product-title font-alt">${cartVO.pname}</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">
						<fmt:formatNumber value="${cartVO.price }" type="currency"/>원</h5>
                      </td>
                      <td>
                    	 ${cartVO.qty }개
                      </td>
                      <td>
                        <h5 class="product-title font-alt">
						<fmt:formatNumber value="${cartVO.price * cartVO.qty }" type="currency"/>원</h5>
                      </td>
                      <td class="pr-remove"><a href="cart_delete?cart=${cartVO.cart}" title="Remove"><i class="fa fa-times"></i></a></td>
                    </tr>
                </c:forEach>      
                  </tbody>
                </table>
              </div>
            </div>
            
            <div class="row mt-70">
             <hr class="divider-w pt-20">
            
            <h2>배송지 정보</h2>
             <div class="form-group">
                    <label class="sr-only" for="email">이름</label>
                    <input value="${sessionScope.loginUser.mname}" class="form-control" type="text" id="coname" name="coname" placeholder="이름*" required="required" data-validation-required-message="Please enter your mname."/>
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <label class="sr-only" for="phone">전화번호</label>
                    <input value="${sessionScope.loginUser.mphone}" class="form-control" type="text" id="phone" name="phone" placeholder="전화번호*" required="required" data-validation-required-message="Please enter your mphone."/>
                    <p class="help-block text-danger"></p>
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
								<input type="hidden" id="address" name="address" readonly="readonly" size=50>
								 <p class="help-block text-danger"></p>
                  </div>
                  
                   <br><br><br><hr class="divider-w pt-20">
                  
              <div class="col-sm-5 col-sm-offset-7">
                <div class="shop-Cart-totalbox">
                  <h4 class="font-alt">Order Totals</h4>
                  <table class="table table-striped table-border checkout-table">
                    <tbody>
                      <tr>
                        <th>Cart Subtotal :</th>
                        <td><fmt:formatNumber value="${totalPrice}" type="currency"/>원</td>
                      </tr>
                      <tr>
                        <th>Delivery charge :</th>
                        <td>0</td>
                      </tr>
                      <tr class="shop-Cart-totalprice">
                        <th>Total :</th>
                        <td><fmt:formatNumber value="${totalPrice}" type="currency"/>원</td>
                      </tr>
                    </tbody>
                  </table>
                  <button class="btn btn-lg btn-block btn-round btn-d" type="submit" onclick="theform.submit()">구매하기</button>
                </div>
              </div>
            </div>
          </div>
           </form>  
        </section>
        <hr class="divider-w pt-20">
<br>
<br>
<br>

<%@ include file="../include/footer.jsp"%>