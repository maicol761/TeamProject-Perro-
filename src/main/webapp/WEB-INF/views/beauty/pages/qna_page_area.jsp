<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  각 화면의 페이지 번호가 표시되는 영역의 구현 -->
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
		      <li><a href="qna_Home${pageMaker.makeQuery(pageMaker.startPage-1)}">&lt;</a></li>
		</c:if>
				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			
			<li><a href="qna_Home${pageMaker.makeQuery(index)}">${index}</a></li>
			
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
		  <li><a href="qna_Home${pageMaker.makeQuery(pageMaker.endPage+1)}">&gt;</a></li>
		</c:if>
	</ul>