<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="../include/bHeader.jsp" %>
<body>
<section class="module bg-dark-60 faq-page-header" data-background="img/faq.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">q&A</h2>
                <div class="module-subtitle font-serif">We'll provide you with the best service</div>
              </div>
            </div>
          </div>
        </section>


<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Q&A</strong></div>
        </div>
      </div>
    </div>
    
    <c:choose>
			<c:when test="${qnaList.size()==0 }">
				<br><br><br><br><br>
				<h5 style="color: black; text-align: center" method="text">문의사항이 없습니다.</h5>
			    <br><br><br><br><br>
			</c:when>
			
		<c:otherwise>
    

<div align=center>
	<br><br>
		<table width="1000">
			<tr style=height:60px>
				<td colspan=3><h3>1:1 문의</h3><hr>
				</td>
			</tr>
			<tr>
				<th width="10%">번호</th>
				<th width="20%">분류</th>
				<th width="60%">제목</th>
				<th width="10%">처리상태</th>
			</tr>
				<c:forEach var="vo" items="${qnaList}">
			<tr>
				<td width="10%" >&nbsp;&nbsp;&nbsp;${vo.qno }<hr>
				</td>
				<td width="20%" >${vo.catego }<hr>
				
				</td>
				<td width="60%"><a href="qna_view?qno=${vo.qno}">${vo.qtitle }<hr></a>
				</td>
				<td width="10%">${vo.acheck }<hr>
				
				</td>
			</tr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
					<c:choose>
					<c:when test="${sessionScope.loginUser.mid!=null }">
					<button type="button" class="btn btn-primary" 
					onclick="location.href='qna_insert_home'" style="float:right;margin-right:20px;">문의하기</button>
					</c:when>
					</c:choose>
				</td>
			</tr>	
		</table>
		<br><br>
		
	         <div class="row" align=center>
              <div class="col-sm-12">
                <div class="pagination font-alt">
		            <c:if test="${pageMaker.prev}">
		                <a href="qna_Home${pageMaker.makeQuery(pageMaker.startPage-1)}"><i class="fa fa-angle-left"></i></a>
		            </c:if>   
		            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">   
		            
		               <c:choose>
		         	   <c:when test="${criteria.pageNum==index }">
		         		   <a class="active" href="qna_Home${pageMaker.makeQuery(index)}">${index}</a>
		          	   </c:when>
		               <c:otherwise>
		                	<a href="qna_Home${pageMaker.makeQuery(index)}">${index}</a>
		               </c:otherwise>
		               </c:choose>
		            </c:forEach>
		          <c:if test="${pageMaker.next}">
		                <a href="qna_Home${pageMaker.makeQuery(pageMaker.endPage+1)}"><i class="fa fa-angle-right"></i></a>
		          </c:if>	 
          
              	</div>
              </div>
            </div>
     
     
</div>
<br><br><br><br>
</body>

<%@ include file="../include/footer.jsp" %>