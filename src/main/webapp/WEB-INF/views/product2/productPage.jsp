<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/bHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<meta charset="UTF-8">

 <body>
      <section class="module bg-dark-60 portfolio-page-header" data-background="img/dog04.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">SHop</h2>
                <div class="module-subtitle font-serif">100+. PRODUCTS.</div>
              </div>
            </div>
          </div>
        </section>
        
  
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong></div>
        </div>
      </div>
    </div>        
    
      <section class="module-small">
          <div class="container">
            <form class="row" method="get" name="product_form"
								action="product_form" id="product_form">
              <div class="col-sm-4 mb-sm-20">
                <select class="form-control">
                  <option selected="selected">Default Sorting</option>
                </select>
              </div>
              
              <div class="col-sm-3 mb-sm-20">
                <select class="form-control" name="cno" id="cno">
                  <option value="0" selected="selected">All</option>
                  <option value="1">Clothes</option>
                  <option value="2">Toy</option>
                  <option value="3">Snack</option>
                </select>
              </div>
              <div class="col-sm-3">
                <button class="btn btn-block btn-round btn-g" onclick="change()">Apply</button>
              </div>
            </form>
          </div>
        </section>

        <hr class="divider-w">
        <section class="module-small">
          <div class="container">
            <div class="row multi-columns-row">

			<c:forEach var="vo" items="${productAllList}">	
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="shop-item">
                  <div class="shop-item-image"><img src="img/product/${vo.image }" alt="Accessories Pack"/>
                    <div class="shop-item-detail"><a href="product_One?pno=${vo.pno }" class="btn btn-round btn-b">
                    	<span class="icon-basket">DETAIL</span></a></div>
                  </div>
                  <h4 class="shop-item-title font-alt"><a href="product_One?pno=${vo.pno }">${vo.pname }</a></h4>
                  <fmt:formatNumber value="${vo.price }" type="currency"/>원
                </div>
              </div>
			</c:forEach>
			
			</div>
			
            <div class="row" align=center>
              <div class="col-sm-12">
                <div class="pagination font-alt">
		            <c:if test="${pageMaker.prev}">
		                <a href="product_All${pageMaker.makeQuery(pageMaker.startPage-1)}"><i class="fa fa-angle-left"></i></a>
		            </c:if>   
		            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">   
		            
		               <c:choose>
		         	   <c:when test="${criteria.pageNum==index }">
		         		   <a class="active" href="product_All${pageMaker.makeQuery(index)}">${index}</a>
		          	   </c:when>
		               <c:otherwise>
		                	<a href="product_All${pageMaker.makeQuery(index)}">${index}</a>
		               </c:otherwise>
		               </c:choose>
		            </c:forEach>
		          <c:if test="${pageMaker.next}">
		                <a href="product_All${pageMaker.makeQuery(pageMaker.endPage+1)}"><i class="fa fa-angle-right"></i></a>
		          </c:if>	 
          
              	</div>
              </div>
            </div>
            
          </div>
        </section>


   <div class="site-section">
      <div class="container">
  
       <div class="row">
       	<div class="col-md-12">
      		 <div class="site-section site-blocks-2">
                <div class="row justify-content-center text-center mb-5">
                  <div class="col-md-7 site-section-heading pt-4">
                    <h2>Categories</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
                    <a class="block-2-item" href="reservation_home">
                      <figure class="image">
                        <img src="img/product/service.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Collections</span>
                        <h3>Service</h3>
                      </div>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
                    <a class="block-2-item" href="product_All">
                      <figure class="image">
                        <img src="img/product/shop.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Collections</span>
                        <h3>Shop</h3>
                      </div>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
                    <a class="block-2-item" href="faq_Home">
                      <figure class="image">
                        <img src="img/product/Faq.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Collections</span>
                        <h3>Faq</h3>
                      </div>
                    </a>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
<script type="text/javascript">

function change() {
	   if(document.getElementById("cno").value == 1) {
		   var form = document.getElementById("product_form");
			form.action="product_Cno_List?cno=1";
			form.submit();
		   }else if (document.getElementById("cno").value == "2") {
			   var form = document.getElementById("product_form");
				form.action="product_Cno_List?cno=2";
				form.submit();
		   }else if (document.getElementById("cno").value == "3") {
			   var form = document.getElementById("product_form");
				form.action="product_Cno_List?cno=3";
				form.submit();
		   }else{
			   var form = document.getElementById("product_form");
				form.action="product_All";
				form.submit();
		   }
}




</script>    
    
    


<%@ include file ="../include/footer.jsp" %>
