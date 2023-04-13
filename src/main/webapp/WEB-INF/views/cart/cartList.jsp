<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/bHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="cart/cart.js"></script>
<script>
function orderPage(cart,pname,qty,wprice){
		var url="cartChange?cart="+cart+"&pname="+pname+"&qty="+qty+"&wprice="+wprice;
		
		window.open(url,"_blank_",
		 "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=600, height=700," +
		 "left=600, top=100, status=no, titlebar=no");
		
}
</script>

<body>
   <div class="main">
   
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
        
        <form action="order_insert" name="theform" id="theform" method="post">
		<c:choose>
			<c:when test="${cartList.size()==0 }">
				<br>
				<h5 style="color: black; text-align: center" method="text">장바구니가
					비어있습니다.</h5>
					<br>
			</c:when>
			
		<c:otherwise>
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">Cart</h1>
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
              <c:forEach items="${cartList }" var="cartVO"> 
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
                        <input type="button" onclick="orderPage('${cartVO.cart}','${cartVO.pname}','${cartVO.qty }','${cartVO.price }')" value="수정">
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
          
            
            
            <hr class="divider-w">
            <div class="row mt-70">
              <div class="col-sm-5 col-sm-offset-7">
                <div class="shop-Cart-totalbox">
                  <h4 class="font-alt">Cart Totals</h4>
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
                  <button class="btn btn-lg btn-block btn-round btn-d" type="submit" onclick="theform.submit()">Proceed to Checkout</button>
                </div>
              </div>
            </div>
          </div>
          </c:otherwise>
            </c:choose>
           </form>  
        </section>
        
        <hr class="divider-d">
      </div>
 
	<br><br><br>
	</body>
	
	<%@ include file="../include/footer.jsp"%>