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
						<h3>Q&A</h3>
					</div>
					<br>
		
				</div>
			</div>
			<hr>

				<table width="700">
		<tr>
			<td><h3>Q</h3><br></td>
		</tr>
		<tr>
		 <td>등록자<hr></td>
		 <td>${qvo.mid }<hr></td>
		</tr>
		<tr>
		 <td>분류<hr></td>
		 <td>${qvo.catego }<hr></td>
		</tr>
		<tr>
		 <td>문의 제목<hr></td>
		 <td>${qvo.qtitle }<hr></td>
		</tr>
		<tr>
		 <td>등록일<hr></td>
		 <td>${qvo.qdate }<hr></td>
		</tr>
		<tr>
		    <td>문의 내용<hr></td>
			<td>
				${qvo.qcontent }<hr>
			</td>
		</tr>
	</table>
		<c:choose>
	<c:when test="${a==0 }">
	   <form method="post" action="a_insert" id="a_insert">
	   	   <input type="hidden" name="qno" value="${qvo.qno}">
	      <input type="hidden" name="mid" value="${sessionScope.loginUser.mid}">
		<table width="700">
			<tr>
				<td><h3>A</h3><br></td>
			</tr>
			<tr>
				<td>답변</td>
				<td>
				<textarea rows="3" cols="50" name="acontent" id="acontent"></textarea>  <hr>
				</td>
			</tr>
		</table>
		<div align="center">
			<button type="button" onclick="go_Insert()">답변입력</button>
		</div>
		</form>
	</c:when>
	</c:choose>
	
	<br>
	<c:choose>
	<c:when test="${a!=0 }">
		<table width="700">
			<tr>
				<td><h3>A</h3><br></td>
			</tr>
			
			<tr>
				 <td>등록일<hr></td>
				 <td>${avo.adate }<hr></td>
			</tr>
			
			<tr>
				<td>답변 내용</td>
				<td>
				${avo.acontent }<hr>
				</td>
			</tr>
		</table>
	</c:when>
	</c:choose>
		</div>
	</div>

</body>
<script type="text/javascript">
function go_Insert() {
	var acontent = document.getElementById("acontent");
	
	if (acontent.value == "") {
		alert("답변을 입력해 주세요");
		acontent.focus();
		return false;
	}else{
		var form = document.getElementById("a_insert");
		form.action="a_insert";
		form.submit();
	}
	   
}
</script>

<%@ include file="/WEB-INF/views/admin/include/afooter.jsp"%>
</html>
