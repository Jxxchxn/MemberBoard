<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/js/member.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	if(${!empty msgType}){
     		$("#messageType").attr("class", "modal-content panel-warning");    
    		$("#myModal02").modal("show");
    	}
    });
    
    function idCheck(){
        var mID=$("#mID").val();
        $.ajax({
            url : "${contextPath}/idCheck",
            type : "get",
            data : { "mID" : mID},
            success : function(result){
                // 중복 여부 (result=1 : 사용가능, 0 : 사용불가)
                if(result == 1){
                    $("#checkMessage").html("사용 가능한 아이디입니다.");
                    $("#checkType").attr("class","modal-content panel-success");
                } else {
                    $("#checkMessage").html("사용이 불가능한 아이디입니다."); 
                    $("#checkType").attr("class","modal-content panel-warning");
                }
                $("#myModal").modal("show");
            },    	   
            error : function(){ alert("error"); }    	   
        });    	
    }
    
    function pwCheck(){
    	var mPW01 = $("#mPW01").val();
    	var mPW02 = $("#mPW02").val();
    	if(mPW01 != mPW02){
    		$("#pwPass").html("비밀번호가 일치하지 않습니다.");
    	}else {
    		$("#pwPass").html("");
    		$("#mPW").val(mPW01);    		
    	}
    }
    </script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<div class="container">
    <h2>Form control: input</h2>
    <p>The form below contains two input elements; one of type text and one of type password:</p>
    <form name="frm" action="${contextPath}/memberJoin" method="post">
    <input type="hidden" id="mPW" name="mPW" value=""/>
        <div class="form-group">
            <label for="mID">아이디</label>
            <input id="mID" name="mID" type="text" class="form-control" maxlength="20" placeholder="아이디">
        	<button type="button" class="btn btn-primary btn-sm" onclick="idCheck()">중복확인</button>
        </div>
        <div class="form-group">
            <label for="mPW01">비밀번호</label>
            <input id="mPW01" name="mPW01" type="password" class="form-control" maxlength="20" onkeyup="pwCheck()" placeholder="비밀번호">
        </div>
        <div class="form-group">
            <label for="mPW02">비밀번호 확인</label>
            <input id="mPW02" name="mPW02" type="password" class="form-control" maxlength="20" onkeyup="pwCheck()" placeholder="비밀번호 확인">
            <span id="pwPass" style="color: red"></span>
        </div>
        <div class="form-group">
            <label for="mName">이름</label>
            <input id="mName" name="mName" type="text" class="form-control" maxlength="20" placeholder="이름">
        </div>
        <div class="form-group">
            <label for="mAge">나이</label>
            <input id="mAge" name="mAge" type="text" class="form-control" maxlength="20" placeholder="나이">
        </div>
        <div class="form-group">
        	<label for="mGender">성별</label>
			<div>
				<label class="radio-inline">
				<input type="radio" name="mGender" autocomplete="off" value="남자" checked>남자
				</label>
				<label class="radio-inline">
				<input type="radio" name="mGender" autocomplete="off" value="여자"/>여자
				</label>
			</div>
		</div>
		<hr>
        <div class="form-group">
            <label for="mAddr">주소</label>
            <input id="mAddr" name="mAddr" type="text" class="form-control" maxlength="50" placeholder="주소">
        </div>
        <div class="form-group">
            <label for="mEmail">이메일</label>
            <input id="mEmail" name="mEmail" type="text" class="form-control" maxlength="50" placeholder="이메일">
        </div>
        	<input type="button" class="btn btn-primary btn-sm pull-right" value="등록" onclick="goInsert()"/>
    </form>
</div>

<!-- 아이디 중복체크 모달 -->
<div id="myModal" class="modal fade" role="dialog" >
    <div class="modal-dialog">	
        <!-- Modal content-->
        <div id="checkType" class="modal-content panel-info">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">메세지 확인</h4>
            </div>
            <div class="modal-body">
                <p id="checkMessage"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>	
    </div>
</div> 

<!-- 실패 모달 -->
<div id="myModal02" class="modal fade" role="dialog" >
    <div class="modal-dialog">	
        <!-- Modal content-->
        <div id="messageType" class="modal-content panel-info">
            <div class="modal-header panel-heading">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">${msgType}</h4>
            </div>
            <div class="modal-body">
              <p>${msg}</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>	
    </div>
</div>

</body>
</html>
