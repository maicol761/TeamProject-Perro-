<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/bHeader.jsp"%>

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

<article>
<br><br>
<div style=height:400px>
	<h2  align="center">Order List</h2>
	<h3  align="center"> 주문 완료 되었습니다</h3>
	<table class="table table-hover" style="width:80% " id="orderperfect" align="center" >
	<tr>
	 <th>주문번호</th><th>상품명</th><th>수 량</th><th>가 격</th> <th>주문일</th> <th> 진행 상태 </th>    
	</tr>
	<c:forEach items="${orderList}" var="orderVO" >
	<tr>
		<td>${cono }</td>
		<td>${orderVO.pname }</td>
		<td>${orderVO.qty}</td>
		<td><fmt:formatNumber value="${orderVO.price*orderVO.qty}" type="currency"/>원</td>
		<td>${orderVO.odate}</td>
		<td>주문처리중</td>
	</tr>
	</c:forEach>

	<tr align="center">
		
	<br><th colspan="6" >총액 : &nbsp;
			<fmt:formatNumber value="${totalPrice}" type="currency"/>
	<hr>
	</th>

	</tr>
	</table>
	</div>
	<div class="clear"></div>
	<div id="buttons"  align="center">
	 <button type="button" class="btn btn-primary" 
					onclick="location.href='product_All'" align="center">쇼핑 계속하기</button>
	</div>
	</article>
	<br><br>
<%@ include file="../include/footer.jsp"%>