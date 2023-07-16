	$(document).ready(function(){
		loadList();
	});
		
	// 서버와의 통신으로 게시판 리스트 호출
	function loadList(){
		$.ajax({
			url : "board/list",
			type: "get",
			dataType : "json",
			success : makeView,
			error : function(){ alert("error"); }
		});
			
		// 인서트 후 폼 저장기록 초기화
		$("#fclear").trigger("click");
	}
		
	// 게시판 양식 구현
	function makeView(data){
		var listHtml = "<table class='table table-bordered'>";
		listHtml += "<tr>";
		listHtml += "<td>번호</td>";
		listHtml += "<td>제목</td>";
		listHtml += "<td>작성자</td>";
		listHtml += "<td>작성일</td>";
		listHtml += "<td>조회수</td>";
		listHtml += "</tr>";
		// 배열, 객체 등을 매개변수로 받아 반복(반복문)
		$.each(data, function(index, obj){
			listHtml += "<tr>";				
			listHtml += "<td>"+obj.bidx+"</td>";
			listHtml += "<td id='t"+obj.bidx+"'><a href='javascript:goContent("+obj.bidx+")'>"+obj.btitle+"</a></td>";
			listHtml += "<td>"+obj.bwriter+"</td>";
			listHtml += "<td>"+obj.bdate.split(' ')[0]+"</td>";
			listHtml += "<td id='cnt"+obj.bidx+"'>"+obj.bcount+"</td>";
			listHtml += "</tr>";			
			listHtml += "<tr id='c"+obj.bidx+"' style='display:none'>";
			listHtml += "<td>내용</td>";
			listHtml += "<td colspan='4'>";
			listHtml += "<textarea id='ta"+obj.bidx+"' rows='7' class='form-control' readonly></textarea>";
			listHtml += "<br/>";
			listHtml += "<span id='ub"+obj.bidx+"'><button class='btn btn-success btn-sm' onclick='goUpdateForm("+obj.bidx+")'>수정</button></span>&nbsp;";
			listHtml += "<button class='btn btn-warning btn-sm' onclick='goDelete("+obj.bidx+")'>삭제</button>";
			listHtml += "</td>";
			listHtml += "</tr>";
		});
		listHtml += "<tr>";
		listHtml += "<td colspan='5'>";
		listHtml += "<button class='btn btn-primary btn-sm' onclick='goForm()'>글쓰기</button>";
		listHtml += "</td>";
		listHtml += "</tr>";
		listHtml += "</table>";
		$("#view").html(listHtml);
		$("#view").css("display", "block");
		$("#wform").css("display", "none");			
	}
		
	// 상세 보기 열기
	function goForm() {
		$("#view").css("display", "none");
		$("#wform").css("display", "block");			
	}
		
	// 상세 보기 숨기기
	function goList() {			
		$("#view").css("display", "block");
		$("#wform").css("display", "none");			
	}
		
	// 게시글 작성
	function goInsert() {
		var fData = $("#frm").serialize();
		$.ajax({
				url : "board/insert",
				type : "post",
	 			data : fData,
				success : loadList,
				error : function() { alert("error"); }
		});		
	}
		
	// 상세 보기
	function goContent(bidx) {
		if($("#c"+bidx).css("display")=="none") {				
			$.ajax({
				url : "board/"+bidx,
				type : "get",
				dataType : "json",
				success : function(data) {
					$("#ta"+bidx).val(data.bcontent);
				},
				error : function() { alert("error"); }
			});				
			$("#c"+bidx).css("display", "table-row");
			$("#ta"+bidx).attr("readonly", true);
				
			// 조회수
			$.ajax({
				url : "board/count/"+bidx,
				type : "put",
				dataType : "json",
				success : function(data) {
					$("#cnt"+bidx).text(data.bcount);
				},
				error : function() { alert("error"); }
			});				
		} else {				
			$("#c"+bidx).css("display", "none");
		}
	}
		
	// 게시글 삭제
	function goDelete(bidx) {
		$.ajax({
			url : "board/"+bidx,
			type : "delete",
			success : loadList,
			error : function() { alert("error"); }
		});
	}
		
	// 게시글 수정 폼
	function goUpdateForm(bidx) {
		$("#ta"+bidx).attr("readonly", false);		
		var title = $("#t"+bidx).text();
		var newInput="<input type='text' id='nt"+bidx+"' class='form-control' value='"+title+"'/>";
		$("#t"+bidx).html(newInput);			
		var newButton="<button class='btn btn-info btn-sm' onclick='goUpdate("+bidx+")'>완료</button>";
		$("#ub"+bidx).html(newButton);
	}
		
	// 게시글 수정
	function goUpdate(bidx) {
		var title = $("#nt"+bidx).val();
		var content = $("#ta"+bidx).val();
		$.ajax({
			url : "board/update",
			type : "put",
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify({ "bidx":bidx, "btitle":title, "bcontent":content }),
			success : loadList,
			error : function() { alert("error"); }
		});
	}
