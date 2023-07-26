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
<body style="height:1500px">
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="row">
	    <div class="container-fluid col-sm-7">
	        <div class="navbar-header">
	            <a class="navbar-brand" href="${contextPath}/">WebSiteName</a>
	        </div>
	        <ul class="nav navbar-nav">
	            <li class="active"><a href="#">Home</a></li>
	            <li><a href="boardMain">게시판</a></li>
	            <li><a href="#">Page 2</a></li>
	            <li><a href="#">Page 3</a></li>
	        </ul>
	    </div>
	    <div class="col-sm-5">    
			<c:if test="${empty mvo}">
			    <ul class="nav navbar-nav navbar-right">
			        <li><a href="memberLoginForm"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
			        <li><a href="memberJoinForm"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>            
			    </ul>
			</c:if>
			<c:if test="${!empty mvo}">
			    <ul class="nav navbar-nav navbar-right">
			    <li><a href="#"><span class="glyphicon glyphicon glyphicon-wrench"></span> 회원정보수정</a></li>
			    <li><a href="#"><span class="glyphicon glyphicon glyphicon-picture"></span> 사진등록</a></li>
			    <li><a href="memberLogout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
			    </ul>
			</c:if>
	    </div>
	</div>   
	</nav>
</body>
</html>