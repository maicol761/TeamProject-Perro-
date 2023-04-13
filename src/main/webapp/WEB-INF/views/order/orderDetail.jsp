<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/bHeader.jsp"%>
<article>
	<h2>${title }</h2>
	<form name="formm" method="post">
		<table class="table table-hover" style="width: 80%" id="cartList">
			<tr>
				<th>주문일자</th>
				<th>주문자</th>
				<th>주문 총액</th>
			</tr>
			<tr>
				<td><fmt:formatDate value="${orderDetail.odate}"
						type="Timestamp" /></td>
				<td>${orderDetail.pno}</td>
				<!-- 주문번호 -->
				<td>${orderDetail.pname}</td>
				<!-- 이름 -->
				<td><fmt:formatNumber type="currency" value="${totalPrice}" />
			</tr>
		</table>
		<h3>주문 상품 정보</h3>
		<table class="table table-hover" style="width: 80%" id="cartList">
			<tr>
				<th>상품명</th>
				<th>상품별 주문번호</th>
				<th>수량</th>
				<th>가격</th>
				<th>처리상태</th>
			</tr>
			<c:forEach items="${orderList}" var="orderVO">
				<tr>
					<td>${orderVO.pname}</td>
					<td>${orderVO.pno}</td>
					<td>${orderVO.qty}</td>
					<td><fmt:formatNumber type="currency" value="${orderVO.price}" /></td>
					<td><c:choose>
							<c:when test='${orderVO.result=1}'>진행중</c:when>
							<c:otherwise>
								<span style="color: red">처리완료</span>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="쇼핑 계속하기" class="cancel"
				onclick="location.href='index'">
		</div>
	</form>
</article>
<%@ include file="../include/footer.jsp"%>