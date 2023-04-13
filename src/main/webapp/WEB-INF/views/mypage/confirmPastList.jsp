<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/bHeader.jsp"%>

<!DOCTYPE html>
<meta charset="UTF-8">
<body>

	<div class="main">

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
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">My Page</strong>
					</div>
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
								<table width="900" class="table table-hover">
									<tr style="height: 60px">
										<td colspan=3>
											<h3>과거 주문내역</h3>
											<hr>
										</td>
									</tr>
									<tr>
										<th width="15%" align="center">주문번호</th>
										<th width="30%" align="center">주문날짜</th>
										<th width="25%" align="center">결제금액</th>
										<th width="15%" align="center">진행상태</th>
										<th align="center">주문내역보기</th>
									</tr>

									<c:forEach items="${confirmPastList}" var="cPast">

										<tr>

											<td>${cPast.cono}</td>
											<td>${cPast.codate }</td>
											<td><fmt:formatNumber value="${cPast.copay }" type="currency"/>원</td>
											<td>${cPast.result }</td>
											<td><a href="confirm_view?cono=${cPast.cono}"
											 class="btn btn-g btn-round btn-xs">주문내역보기</a></td>
										</tr>
									</c:forEach>

								</table>




							</div>
						</div>






					</div>
				</div>
			</div>


			<div class="row" align=center>
				<div class="col-sm-12">
					<div class="pagination font-alt">
						<c:if test="${pageMaker.prev}">
							<a
								href="confirm_past_list${pageMaker.makeQuery(pageMaker.startPage-1)}"><i
								class="fa fa-angle-left"></i></a>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="index">

							<c:choose>
								<c:when test="${criteria.pageNum==index }">
									<a class="active"
										href="confirm_past_list${pageMaker.makeQuery(index)}">${index}</a>
								</c:when>
								<c:otherwise>
									<a href="confirm_past_list${pageMaker.makeQuery(index)}">${index}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a
								href="confirm_past_list${pageMaker.makeQuery(pageMaker.endPage+1)}"><i
								class="fa fa-angle-right"></i></a>
						</c:if>

					</div>
				</div>
			</div>


		</section>
	</div>


	<hr class="divider-d">
</body>


<%@ include file="../include/footer.jsp"%>


