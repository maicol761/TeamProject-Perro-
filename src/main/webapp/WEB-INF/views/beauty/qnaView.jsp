<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/bHeader.jsp"%>



<div class="main">
        <section class="module bg-dark-60 faq-page-header" data-background="img/faq.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Q&A</h2>
                <div class="module-subtitle font-serif">A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</div>
              </div>
            </div>
          </div>
        </section>

<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="qna_Home">Q&A</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Detail</strong></div>
        </div>
      </div>
    </div>
<div align=center>
<br>
<h3>Q&A</h3>
<br><br>
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
<br>

<br><br><br>
</div>
<%@ include file="../include/footer.jsp"%>
