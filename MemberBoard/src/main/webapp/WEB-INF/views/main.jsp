<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
</head>
<body>
<jsp:include page="include/header.jsp"/>
<div class="container" style="margin-top:50px">
    <h3>Fixed Navbar</h3>
    <div class="row">
        <div class="col-md-4">
            <p>A fixed navigation bar stays visible in a fixed position (top or bottom) independent of the page scroll.</p>
            <p>A fixed navigation bar stays visible in a fixed position (top or bottom) independent of the page scroll.</p>    
        </div>
        <div class="col-md-4"> 
            <p>A fixed navigation bar stays visible in a fixed position (top or bottom) independent of the page scroll.</p>
            <p>A fixed navigation bar stays visible in a fixed position (top or bottom) independent of the page scroll.</p>
        </div>
        <div class="col-md-4"> 
            <p>A fixed navigation bar stays visible in a fixed position (top or bottom) independent of the page scroll.</p>
            <p>A fixed navigation bar stays visible in a fixed position (top or bottom) independent of the page scroll.</p> 
        </div>
  </div>
</div>

<h1>Scroll this page to see the effect</h1>

<!-- Modal -->
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
<!-- 실패 메세지를 출력(modal) -->
<div id="myMessage" class="modal fade" role="dialog" >
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
