/**
 * 
 */

	// 상품평 목록 불러오기
	function getReservList() {
		$.ajax({
			type: 'GET',
			url: 'mypage/reservList',
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				var pageMaker = data.pageInfo;
				var qnaList = data.reservList;
				
				showHTML(reservList);
			},
			error: function() {
				alert("예약 목록을 조회하지 못했습니다.")
			}
		});
	}
	
	function showHTML(reservList) {
		var html = "";
		
		if (qnaList.length > 0) {
			// 상품평의 각 항목별로 HTML 생성
			$.each(reservList, function(index, item){
					
					html += "<tr>";
					html +=	"<td width=\"10%\" >&nbsp;&nbsp;&nbsp;";
					html +=	item.vbreed;
					
					html += "</td></tr>";
			});
			
		} else { // 조회된 상품평이 없을 경우
			html += "<div>";
			html += "<h5>등록된 예약이 없습니다.</h5>";
			html += "</div>";
		}
		// 상품평 목록 출력
		$("#reservList").html(html);
		
	}
		
		