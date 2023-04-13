<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/bHeader.jsp"%>

<!DOCTYPE html>
<meta charset="UTF-8">
<body>
<section class="module bg-dark-60 faq-page-header"
			data-background="img/mypage01.jpg">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h2 class="module-title font-alt">My Page</h2>
						<div class="module-subtitle font-serif">We'll provide you
							with the best service.</div>
					</div>
				</div>
			</div>
		</section>
		
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="reservationListAll">My Page</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">OrderDetail</strong>
					</div>
				</div>
			</div>
		</div>
		

<section class="module">
        
     <form action="order_real_insert" name="order_real_insert" id="order_real_insert" method="post">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">주문내역</h1>
              </div>
            </div>
            <hr class="divider-w pt-20">
            <div class="row">
          <h3>주문번호: ${cvo.cono }</h3>
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <th class="hidden-xs"></th>
                      <th>상품명</th>
                      <th class="hidden-xs">판매가</th>
                      <th>수량</th>
                      <th>소계</th>
                      <th>처리상태</th>
                    </tr>
              <c:forEach items="${orderList }" var="orderVo"> 
                    <tr>
                      <td class="hidden-xs">
                      <a href="#">
                      <img src="img/product/${orderVo.image }" alt="Accessories Pack"/>
                      </a></td>
                      <td>
                        <h5 class="product-title font-alt">
                        <a href="product_One?pno=${orderVo.pno }">${orderVo.pname}</a></h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">
						<fmt:formatNumber value="${orderVo.price }" type="currency"/>원</h5>
                      </td>
                      <td>
                    	 ${orderVo.qty }개
                      </td>
                      <td>
                        <h5 class="product-title font-alt">
						<fmt:formatNumber value="${orderVo.price*orderVo.qty }" type="currency"/>원</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${cvo.result}</h5>
                      </td>
                    </tr>
               </c:forEach>     
                  </tbody>
                </table>
              </div>
       
            </div>
                  
            <div class="row mt-70">
             <hr class="divider-w pt-20">
            
            <h2>주문자 정보</h2>
             <div class="form-group">
                     <label class="sr-only" for="email">이름</label>
                    <input value="${cvo.coname}" class="form-control" size="10" type="text" id="coname" name="coname"readonly="readonly"/>
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <label class="sr-only" for="phone">전화번호</label>
                    <input value="${phone}" class="form-control" type="text" id="phone" name="phone"readonly="readonly"/>
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <label class="sr-only" for="address">주소</label>
                      <input value="${address}" class="form-control" type="text" id="phone" name="phone"readonly="readonly"/>
                  </div><br>
                  <div align=center>
                <h3> 결제금액 : <fmt:formatNumber value="${totalPrice}" type="currency"/>원</h3></div>
                   <br><hr class="divider-w pt-20">
            </div>
          </div>
           </form>  
           
           <c:if test="${cvo.result=='주문처리중'}">
        	<form action="deleteConfirm" id="deleteConfirm" name="deleteConfirm">
        	<input type="hidden" value="${cvo.cono }" name="cono" id="cono">
        <div id="buttons"  align="center">
	 <button type="button" class="btn btn-danger" 
					onclick="deleteReser()" align="center">주문 취소</button>
	</div>
	</form>
        </c:if>
        </section>
         <hr class="divider-w pt-20">
        
</body>
<script type="text/javascript">
	function deleteReser() {
		var deletey = prompt("주문을 취소하시겠습니까?(y/n)", "n");
		if (deletey == "y" || deletey == "Y") {
			var form = document.getElementById("deleteConfirm");
			form.action = "deleteConfirm";
			form.submit();
		}
		

	}
</script>


<%@ include file="../include/footer.jsp"%>

















