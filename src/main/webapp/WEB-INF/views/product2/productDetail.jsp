<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/bHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<link rel="manifest" href="/weather_react/manifest.json"/>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script type="text/javascript">
            function idCheck(){
            	if(document.getElementById("mid").value == "") {
          		  alert("로그인이 필요합니다.");
          	      return false;
	           }else{
	    		   var form = document.getElementById("cart_insert");
	    			form.action="cart_insert";
	    			form.submit();
	    			alert("상품이 장바구니에 담겼습니다.");
	    	   }
	           }
            
    		$(document).ready(function() {
    			// 상품상세정보 로딩 시에 상품평 목록을 조회하여 출력
    			getCommentList();
    		});
    		/*
    		 ** 상품 댓글 등록
    		 */
    		function save_comment(pno) {
    			$.ajax({
    				type : 'POST',
    				url : 'comment/save',
    				data : $("#commentForm").serialize(),
    				success : function(data) {
    					if (data == 'success') { // 상품평 등록 성공
    						getCommentList(); // 상품평 목록 요청함수 호출
    						$("#content").val("");
    					} else if (document.getElementById("content").value == "") {
    						alert("후기를 입력해주세요.");
    						return false;
    					} else if (data == 'fail') {
    						alert("상품평 등록이 실패하였습니다. 다시 시도해 주세요.");
    					} else if (data == 'not_logedin') {
    						alert("상품평 등록은 로그인이 필요합니다.");
    					}
    				},
    				error : function(request, status, error) {
    					alert("error:" + error);
    				}
    			});
    		}
    	
    		// 상품평 목록 불러오기
    		function getCommentList() {
    			var pno=document.getElementById("pno").value;
    			
    			$.ajax({
    						type : 'GET',
    						url : 'comment/list',
    						dataType : 'json',
    						data : $("#commentForm").serialize(),
    						success : function(data) {
    							var commentList = data.commentList;
    							var avgstar = data.avgstar;

    							showHTML(commentList,avgstar);
    						},
    						error : function() {
    							alert("상품평 목록을 조회하지 못했습니다.")
    						}
    					});
    		}
    		function showHTML(commentList,avgstar) {
    			var html = "";
    			var s_html = "";
    			
    			
    			if (commentList.length > 0) {
    				// 상품평의 각 항목별로 HTML 생성
    				$.each(commentList, function(index, item){
    					html += "<div class=\"comment clearfix\">";
    					html += "<div class=\"comment-content clearfix\">";
    					html += "<div class=\"comment-author font-alt\">";
    					html += "<strong>작성자: "+item.writer+"</strong>";
    					
    					html += "</div><div class=\"comment-body\">";
    					html += "<p>";
    					html += "<div class=\"comment-author font-alt\">";
    					html += "<strong>Review: "+item.content+"</strong>";
    					
    					html += "</p></div><div class=\"comment-meta font-alt\">";
    					html += displayTime(item.regdate);
    					html += "<br></div>";
    					
    					var s=5-item.star;
    					
    					for(var i=0;i<item.star;i++){
    						html += "<span><i class=\"fa fa-star star\"></i></span>";
    					}
    					for(var i=0;i<s;i++){
        					html += "<span><i class=\"fa fa-star star-off\"></i></span>";
        					}
    					html += "</div></div></div>";
    					html +="<hr class=\"divider-w\">";
    				});
    		}else { // 조회된 상품평이 없을 경우
    			html += "<div>";
    			html += "<h5>등록된 리뷰가 없습니다.</h5>";
    			html += "</div>";
    		}
    		
    			var k=5-avgstar;
    			
    			for(var i=0;i<avgstar;i++){
    				s_html += "<span><i class=\"fa fa-star star\"></i></span>";
					}
    			for(var i=0;i<k;i++){
    				s_html += "<span><i class=\"fa fa-star star-off\"></i></span>";
    			}
    			$("#commentList").html(html);
    			$("#avgstar").html(s_html);
    		}

			/*
    		** 입력 파라미터:
    		**     timeValue - 상품평 등록 시간
    		*/
    		function displayTime(timeValue) {
    			
    			return moment(timeValue).format("YYYY-MM-DD");
    		}
            
	</script> 
    
    
</head> 
<body>   
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


<div class="main">
<section class="module">
          <div class="container">
          
            <div class="row">
            
               <div class="col-sm-6 mb-sm-40">
             	 <a class="gallery">
             		 <img src="img/product/${pvo.image }" alt="Single Product Image"/></a>
                <ul class="product-gallery">
                  <li><a class="gallery" href="assets/images/shop/product-8.jpg"></a>
                  	 <img src="img/product/${pvo.image }" alt="Single Product"/></li>
                </ul>
              </div>
         <form method="post" action="cart_insert" id="cart_insert">     
         	<input type="hidden" name="mid" id="mid" value="${sessionScope.loginUser.mid}">
             <input type="hidden" name="pno" id="pno" value="${pvo.pno }">
         
              <div class="col-sm-6">
                <div class="row">
                  <div class="col-sm-12">
                    <h1 class="product-title font-alt">${pvo.pname }</h1>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                  
                  
                  <div id="avgstar"></div>
                  
                  
                  <a class="open-tab section-scroll" href="#reviews">-${countr} reviews</a>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="price font-alt"><span class="amount">
						<fmt:formatNumber value="${pvo.price }" type="currency"/>원</span></div>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="description">
                      <p>${pvo.content }</p>
                    </div>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-4 mb-sm-20">
                    <input class="form-control input-lg" type="number" name="qty" value="1" max="40" min="1" required="required"/>
                  </div>
                  <div class="col-sm-8">
                  		<a href="javascript:idCheck()" class="btn btn-lg btn-block btn-round btn-b">Add To Cart</a>
                  </div>
                  
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="product_meta">Categories:
                   		<a href="product_Cno_List?cno=1"> Clothes, </a>
	                    <a href="product_Cno_List?cno=2">Toy, </a>
	                    <a href="product_Cno_List?cno=3">Snack</a>
                    </div>
                  </div>
                </div>
              </div>
              </form>
            </div>
            
            <div class="row mt-70">
              <div class="col-sm-12">
                <ul class="nav nav-tabs font-alt" role="tablist">
                  <li class="active"><a href="#description" data-toggle="tab"><span class="icon-tools-2"></span>Description</a></li>
                  <li><a href="#data-sheet" data-toggle="tab"><span class="icon-tools-2"></span>Data sheet</a></li>
                  <li><a href="#reviews" data-toggle="tab"><span class="icon-tools-2"></span>Review ${countr}</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="description">
                 		 <p><div style="white-space:pre;">
                         <c:out value="${pvo.content }" /></div>
                  </div>
                  
                  <div class="tab-pane" id="data-sheet">
                    <table class="table table-striped ds-table table-responsive">
                      <tbody>
                        <tr>
                          <th>Title</th>
                          <th>Info</th>
                        </tr>
                        <tr>
                          <td>name</td>
                          <td>${pvo.pname }</td>
                        </tr>
                        <tr>
                          <td>price</td>
                          <td><fmt:formatNumber value="${pvo.price }" type="currency"/>원</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  
                  
                  <div class="tab-pane" id="reviews">
                    <div class="comments reviews">
                    
                      <div id="commentList"></div>
                      
                    </div>
                    
                    <div class="comment-form mt-30">
                      <h4 class="comment-form-title font-alt">Add review</h4>
                      <form id="commentForm" name="commentForm" method="post">
                        <div class="row">
                          <input type="hidden" name="pno" id="pno" value="${pvo.pno }">
                          <div class="col-sm-4">
                            <div class="form-group">
                              <select class="form-control" id="star" name="star">
                                <option selected="true" disabled="">Rating</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                              </select>
                            </div>
                          </div>
                          <div class="col-sm-12">
                            <div class="form-group">
                              <textarea class="form-control" id="content" name="content" rows="4" placeholder="Review"></textarea>
                            </div>
                          </div>
                          <div class="col-sm-12">
                          <a href='#' onClick="save_comment('${pvo.pno}')" class="btn btn-round btn-d">리뷰등록</a>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                  
                  
                </div>
              </div>
            </div>
          </div>
        </section>
        
        <hr class="divider-w">
        
        <section class="module">
          <div class="container">
          
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">More products</h2>
              </div>
            </div>
            
            <div class="row">
              <div class="owl-carousel text-center" data-items="5" data-pagination="false" data-navigation="false">
                
                <c:forEach var="vo" items="${productAllList}">	
                 
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="product_One?pno=${vo.pno }">
                    <img src="img/product/${vo.image }" alt="Leather belt"/></a>
                      <h4 class="shop-item-title font-alt">
                      <a href="product_One?pno=${vo.pno }">${vo.pname }</a></h4>
                      	<fmt:formatNumber value="${pvo.price }" type="currency"/>원
                    </div>
                  </div>
                </div>
                
                </c:forEach>
                
              </div>
            </div>
          </div>
        </section>
  

  

<%@ include file ="../include/footer.jsp" %>