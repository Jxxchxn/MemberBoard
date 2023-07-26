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
    </script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<div class="container">
    <h2>Form control: input</h2>
    <p>The form below contains two input elements; one of type text and one of type password:</p>
    <form name="frm" action="${contextPath}/memberLogin" method="post">
        <div class="form-group">
            <label for="mID">아이디</label>
            <input id="mID" name="mID" type="text" class="form-control" maxlength="20" placeholder="아이디">
        </div>
        <div class="form-group">
            <label for="mPW">비밀번호</label>
            <input id="mPW" name="mPW" type="password" class="form-control" maxlength="20" placeholder="비밀번호">
        </div>
        <input type="submit" class="btn btn-primary btn-sm pull-right" value="로그인"/>
    </form>
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
