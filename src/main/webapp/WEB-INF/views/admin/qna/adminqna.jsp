<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/admin/include/aheader.jsp"%>
<body>

	<div class="container-fluid px-2 px-md-4">
		<div class="page-header min-height-300 border-radius-xl mt-4"
			style="background-image: url('https://images.unsplash.com/photo-1531512073830-ba890ca4eba2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');">
			<span class="mask  bg-gradient-primary  opacity-6"></span>

		</div>
		<div class="card card-body mx-3 mx-md-4 mt-n6">
			<div class="row gx-4 mb-2">
				<div class="col-auto">
					<div class="avatar avatar-xl position-relative"></div>
				</div>
				<div class="col-auto my-auto">
					<div class="h-100">
						<h3>Q&A 리스트</h3>
					</div>
					<br>
			<a href="admin_qna">[전체]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="admin_qna?acheck=답변준비중">[처리전]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="admin_qna?acheck=답변완료">[처리완료]
				</div>
			</div>
			<hr>

				<table width="900" class="table table-hover">
					<tr>
						<th width="10%" align="center">번호</th>
						<th width="15%" align="center">질문ID</th>
						<th width="15%" align="center">분류</th>
						<th width="40%" align="center">제목</th>
						<th width="20%" align="center">처리상태</th>
					</tr>

					<c:forEach items="${qnaAllList}" var="vo">
						<tr>
							<td>${vo.qno}</td>
							<td>${vo.mid}</td>
							<td>${vo.catego}</td>
							<td><a href="admin_qna_view?qno=${vo.qno}">${vo.qtitle}</td>
							<td>${vo.acheck}</td>
						</tr>
					</c:forEach>
				</table>
				
			<div class="row" align=center>
		            <c:if test="${pageMaker.prev}">
		                <a href="admin_qna${pageMaker.makeQuery(pageMaker.startPage-1)}"><i class="fa fa-angle-left"></i></a>
		            </c:if>   
		            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">   
		            
		               <c:choose>
		         	   <c:when test="${criteria.pageNum==index }">
		         		   <a class="active" href="admin_qna${pageMaker.makeQuery(index)}">[${index}]</a>
		          	   </c:when>
		               <c:otherwise>
		                	<a href="admin_qna${pageMaker.makeQuery(index)}">[${index}]</a>
		               </c:otherwise>
		               </c:choose>
		            </c:forEach>
		          <c:if test="${pageMaker.next}">
		                <a href="admin_qna${pageMaker.makeQuery(pageMaker.endPage+1)}"><i class="fa fa-angle-right"></i></a>
		          </c:if>	 
            </div>
            
		</div>
	</div>

</body>
<%@ include file="/WEB-INF/views/admin/include/afooter.jsp"%>
</html>
