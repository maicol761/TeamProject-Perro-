<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/bHeader.jsp"%>

 <link rel="stylesheet" href="/resources/css/style.css">
 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Booking Start --> 
<body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="beauty/js/reservation.js"></script>

  <section class="bg-dark-30 showcase-page-header module parallax-bg" data-background="img/dog03.jpg">
        <div class="titan-caption">
          <div class="caption-content">
            <div class="font-alt mb-30 titan-title-size-1">50+. Service.</div>
            <div class="font-alt mb-40 titan-title-size-4">reservation</div>
          </div>
        </div>
      </section>
      
      <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a>
           <span class="mx-2 mb-0">/</span> <strong class="text-black">reservation</strong></div>
        </div>
      </div>
    </div>
      

 <input type="hidden" name="mid2" id="mid2" value="${sessionScope.loginUser.mid}">
 <div align=center style="background-color:#E1F6FA;">
    <br><br><br>
    <h3>날짜 선택</h3>
    <br><br>
    <form method="get" name="reserv_Check" id="reserv_Check">
   <!-- 	<a href="reservation_home?rrdate=${rrdate}"> -->
    	<input value="${rrdate }" name="rrdate" type="text" id="rrdate" onchange="reservCheck()">
  <!--   </a>  -->
    </form>
    <br><br><br>
 </div>
 
    <br><br><br>
  <div>
    <table align=center>
    	<tr>
	    	<td rowspan="3">
	    	<input type="image" src="img/rteacher/choi.png" style="width:350px;height:400px;">
	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	</td>
	    	
	    	<td>
	    	<div align=center>
	    	<h3>Choi</h3>
경력15년의 숙련된 미용사입니다. <br>
여유있고 편안하게 미용하기위해 노력합니다. <br><br>
	    	</div>
	    	
	    <c:choose>
	    <c:when test="${choireservList.get(0) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg" type="button" onclick="reservationPage('10','choi')">10:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>     
	        
	    <c:choose>   
	    <c:when test="${choireservList.get(1) == 0 }">
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('11','choi')">11:00</button>
	    </c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button" >예약불가</button>
	    </c:otherwise>	
	  	</c:choose> 
	    	
	    <c:choose>
	    <c:when test="${choireservList.get(2) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('12','choi')">12:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	  
	    <c:choose>
	    <c:when test="${choireservList.get(3) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('14','choi')">14:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	    
	    <br><br>
	    
	    <c:choose>
	    <c:when test="${choireservList.get(4) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('15','choi')">15:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	  
	    <c:choose>
	    <c:when test="${choireservList.get(5) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('16','choi')">16:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
		    
	    <c:choose>
	    <c:when test="${choireservList.get(6) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('17','choi')">17:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button  class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	 
	    <c:choose>
	    <c:when test="${choireservList.get(7) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('18','choi')">18:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	    	
	    	</td>
    	</tr>
    </table>  	
    <br>
    <hr style="width:650px">
    <br>
<div style="background:#FFF0F0;">  
	<br><br>   
    <table align=center>
    	<tr>
	    	<td rowspan="3">
	    	<input type="image" src="img/rteacher/lee.png" style="width:350px;height:400px;">
	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	</td>
	    	
	    	<td>
	    	<div align=center>
	    	<h3>Lee</h3>
가위컷 전문 미용사가 일대일케어로 <br>
스트레스를 최소화해서 미용 해드려요. <br><br>  
	    	</div>
	    	
	    <c:choose>
	    <c:when test="${leereservList.get(0) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('10','lee')">10:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>     
	        
	    <c:choose>   
	    <c:when test="${leereservList.get(1) == 0 }">
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('11','lee')">11:00</button>
	    </c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button" >예약불가</button>
	    </c:otherwise>	
	  	</c:choose> 
	    	
	    <c:choose>
	    <c:when test="${leereservList.get(2) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('12','lee')">12:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	  
	    <c:choose>
	    <c:when test="${leereservList.get(3) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('14','lee')">14:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	    
	    <br><br>
	    
	    <c:choose>
	    <c:when test="${leereservList.get(4) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('15','lee')">15:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	  
	    <c:choose>
	    <c:when test="${leereservList.get(5) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('16','lee')">16:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
		    
	    <c:choose>
	    <c:when test="${leereservList.get(6) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('17','lee')">17:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	 
	    <c:choose>
	    <c:when test="${leereservList.get(7) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('18','lee')">18:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	    	
	    	</td>
    	</tr>
    </table>  	
    <br>
    <hr style="width:650px">
    <br>
</div>    
    <table align=center>
    	<tr>
	    	<td rowspan="3">
	    	<input type="image" src="img/rteacher/jang.png" style="width:350px;height:400px;">
	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	</td>
	    	
	    	<td>
	    	<div align=center>
	    	<h3>Min</h3>
소중한 아이들에게 스트레스 없는 <br>
편안한 미용 선물 해드리겠습니다. <br><br>  
	    	</div>
	    <c:choose>
	    <c:when test="${jangreservList.get(0) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('10','jang')">10:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>     
	        
	    <c:choose>   
	    <c:when test="${jangreservList.get(1) == 0 }">
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('11','jang')">11:00</button>
	    </c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button" >예약불가</button>
	    </c:otherwise>	
	  	</c:choose> 
	    	
	    <c:choose>
	    <c:when test="${jangreservList.get(2) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('12','jang')">12:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	  
	    <c:choose>
	    <c:when test="${jangreservList.get(3) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('14','jang')">14:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	    
	    <br><br>
	    
	    <c:choose>
	    <c:when test="${jangreservList.get(4) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('15','jang')">15:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	  
	    <c:choose>
	    <c:when test="${jangreservList.get(5) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('16','jang')">16:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
		    
	    <c:choose>
	    <c:when test="${jangreservList.get(6) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('17','jang')">17:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	 
	    <c:choose>
	    <c:when test="${jangreservList.get(7) == 0 }">	
	    	<button class="btn btn-warning btn-circle btn-lg"  type="button" onclick="reservationPage('18','jang')">18:00</button> 
 		</c:when>
	    <c:otherwise>
	    	<button class="btn btn-g btn-circle btn-lg"  type="button">예약불가</button> 
	    </c:otherwise>	   
	    </c:choose>    
	    	
	    	</td>
    	</tr>
    </table>  	 
     <br>
    <hr style="width:650px">
    </div>

<br>
<script>
$(function() {
    //input을 datepicker로 선언
    $("#rrdate").datepicker({
        dateFormat: 'yy-mm-dd' //달력 날짜 형태
        ,showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,changeYear: false //option값 년 선택 가능
        ,changeMonth: false //option값  월 선택 가능                
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
        ,buttonText: "선택" //버튼 호버 텍스트              
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+2M", //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    })               
         
});
</script>
</body>








<%@ include file ="../include/footer.jsp" %>