<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/bHeader.jsp"%>

    
      <div class="main" style=height:900px;>
        <section class="module" id="contact">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">1:1 문의하기</h2>
                <div class="module-subtitle font-serif"></div>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <form method="post" action="qna_insert" id="qna_insert">
                <input type="hidden" name="mid" value="${sessionScope.loginUser.mid}">
                  <div class="form-group">
                    <select name="catego" id="catego">
					 	<option value="배송">배송</option>
					 	<option value="품절/재입고">품절/재입고</option>
					 	<option value="교환/반품">교환/반품</option>
					 	<option value="회원정보">회원정보</option>
					 	<option value="미용문의">미용문의</option>
					</select>
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <label class="sr-only" for="email">문의 제목</label>
                    <input class="form-control" type="text" id="qtitle" name="qtitle" placeholder="문의 제목*" required="required" data-validation-required-message="Please enter your qtitle."/>
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <textarea class="form-control" rows="7" id="qcontent" name="qcontent" placeholder="문의 내용*" required="required" data-validation-required-message="Please enter your qcontent."></textarea>
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="text-center">
                    <button class="btn btn-block btn-round btn-d" id="cfsubmit" type="submit" onclick="go_Insert()">Submit</button>
                  </div>
                </form>
                <div class="ajax-response font-alt" id="contactFormResponse"></div>
              </div>
            </div>
          </div>
        </section>
     </div>
        <hr class="divider-d">   
<script>
function go_Insert() {
		   var form = document.getElementById("qna_insert");
			form.action="qna_insert";
			form.submit();
	   }
}
</script>

<%@ include file="../include/footer.jsp"%>