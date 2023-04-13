<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="../include/bHeader.jsp" %>


<body>

  <div class="main">

        <section class="module bg-dark-60 faq-page-header" data-background="img/faq.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Faq</h2>
                <div class="module-subtitle font-serif">We'll provide you with the best service.</div>
              </div>
            </div>
          </div>
        </section>
        
<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">FAQ</strong></div>
        </div>
      </div>
    </div>
        
        <section class="module">
          <div class="container">


            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
                <div role="tabpanel">
                  <ul class="nav nav-tabs font-alt" role="tablist">
                    <li class="active">
                   		<a href="#support" data-toggle="tab"><span class="icon-tools-2"></span>전체</a></li>
                    <li><a href="#sales" data-toggle="tab"><span class="icon-tools-2"></span>배송</a></li>
                    <li><a href="#sales2" data-toggle="tab"><span class="icon-tools-2"></span>주문/결제</a></li>
                    <li><a href="#sales3" data-toggle="tab"><span class="icon-tools-2"></span>교환/반품</a></li>
                    <li><a href="#sales4" data-toggle="tab"><span class="icon-tools-2"></span>회원정보</a></li>
                    <li><a href="#sales6" data-toggle="tab"><span class="icon-tools-2"></span>미용문의</a></li>
                  </ul>
                  <div class="tab-content">
                  
                    <div class="tab-pane active" id="support">
                      <div class="panel-group" id="accordion">
                      
                     <c:forEach var="vo" items="${faqList}">
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#support${vo.faqno }">
                            ${vo.faqtitle }</a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="support${vo.faqno }">
                            <div class="panel-body">
                          		  ${vo.faqcontent }
                            </div>
                          </div>
                        </div>
                    </c:forEach>   
                      </div>
                    </div>


                    <div class="tab-pane" id="sales">
                      <div class="panel-group" id="accordion">
                      
                        <c:forEach var="vo2" items="${faqList2}">
	                        <div class="panel panel-default">
	                          <div class="panel-heading">
	                            <h4 class="panel-title font-alt">
	                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#sales${vo2.faqno }">
	                            ${vo2.faqtitle }</a></h4>
	                          </div>
	                          
	                          <div class="panel-collapse collapse" id="sales${vo2.faqno }">
	                            <div class="panel-body">
	                          		  ${vo2.faqcontent }
	                            </div>
	                          </div>
	                       	 </div>
                   		 </c:forEach>   
                        
                      </div>
                    </div>
                    
                      <div class="tab-pane" id="sales2">
                      <div class="panel-group" id="accordion">
                      
                        <c:forEach var="vo3" items="${faqList3}">
	                        <div class="panel panel-default">
	                          <div class="panel-heading">
	                            <h4 class="panel-title font-alt">
	                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#sales2${vo3.faqno }">
	                            ${vo3.faqtitle }</a></h4>
	                          </div>
	                          
	                          <div class="panel-collapse collapse" id="sales2${vo3.faqno }">
	                            <div class="panel-body">
	                          		  ${vo3.faqcontent }
	                            </div>
	                          </div>
	                       	 </div>
                   		 </c:forEach>   
                        
                      </div>
                    </div>
                    
                      <div class="tab-pane" id="sales3">
                      <div class="panel-group" id="accordion">
                      
                        <c:forEach var="vo4" items="${faqList4}">
	                        <div class="panel panel-default">
	                          <div class="panel-heading">
	                            <h4 class="panel-title font-alt">
	                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#sales3${vo4.faqno }">
	                            ${vo4.faqtitle }</a></h4>
	                          </div>
	                          
	                          <div class="panel-collapse collapse" id="sales3${vo4.faqno }">
	                            <div class="panel-body">
	                          		  ${vo4.faqcontent }
	                            </div>
	                          </div>
	                       	 </div>
                   		 </c:forEach>   
                        
                      </div>
                    </div>
                    
                      <div class="tab-pane" id="sales4">
                      <div class="panel-group" id="accordion">
                      
                        <c:forEach var="vo5" items="${faqList5}">
	                        <div class="panel panel-default">
	                          <div class="panel-heading">
	                            <h4 class="panel-title font-alt">
	                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#sales4${vo5.faqno }">
	                            ${vo5.faqtitle }</a></h4>
	                          </div>
	                          
	                          <div class="panel-collapse collapse" id="sales4${vo5.faqno }">
	                            <div class="panel-body">
	                          		  ${vo5.faqcontent }
	                            </div>
	                          </div>
	                       	 </div>
                   		 </c:forEach>   
                        
                      </div>
                    </div>
                    
                      <div class="tab-pane" id="sales6">
                      <div class="panel-group" id="accordion">
                      
                        <c:forEach var="vo6" items="${faqList6}">
	                        <div class="panel panel-default">
	                          <div class="panel-heading">
	                            <h4 class="panel-title font-alt">
	                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#sales6${vo6.faqno }">
	                            ${vo6.faqtitle }</a></h4>
	                          </div>
	                          
	                          <div class="panel-collapse collapse" id="sales6${vo6.faqno }">
	                            <div class="panel-body">
	                          		  ${vo6.faqcontent }
	                            </div>
	                          </div>
	                       	 </div>
                   		 </c:forEach>   
                        
                      </div>
                    </div>
                    
                  </div>
                  
                </div>
              </div>
            </div>
          </div>
        </section>

</div>

      
</body>
<%@ include file="../include/footer.jsp" %>