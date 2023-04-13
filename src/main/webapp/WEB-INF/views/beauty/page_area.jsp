<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  각 화면의 페이지 번호가 표시되는 영역의 구현 -->
<div>
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="faq_Home${pageMaker.makeQuery(pageMaker.startPage-1)}"></a>
			</li>
		</c:if>
				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<li><a class="page-numbers" href="faq_Home${pageMaker.makeQuery(index)}">${index}</a></li>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a class="next page-numbers" href="faq_Home${pageMaker.makeQuery(pageMaker.endPage+1)}">→</a>
			</li>
		</c:if>	
	</ul>
</div>
