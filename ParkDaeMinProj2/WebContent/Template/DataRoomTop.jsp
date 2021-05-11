<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- DataRoomTop.jsp -->
<style>
	body {
		padding-top: 50px;
	}

</style>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">	
	<div class="container">
		<div class="navbar-header">
		
			<!--화면 크기가 작을때 보여지는 네비게이션바(모바일용)  -->
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#collapse-menu">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<!-- CI표시 -->
			<a class="navbar-brand" href="<c:url value="/DataRoom/Index.kosmo"/>">
				<strong>ULSAN</strong>
			</a>
		</div>
		<!-- 화면 크기가 클때 상단에 보여지는 네비게이션바(데스크탑용) -->
		<div class="collapse navbar-collapse" id="collapse-menu">
			<!-- 네비게이션바에 폼 추가 -->
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><small><span class="glyphicon glyphicon-search"></span></small> 울산 12경</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-cloud"></span> 자랑하기</a></li>

				<li class="dropdown">
				  	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Guest <span class="caret"></span></a>
				  	<ul class="dropdown-menu">
				  		<li><a href="#">로그인</a></li>
				  		<li><a href="#">로그아웃</a></li>
				  		<li><a href="#">회원가입</a></li>
				  	</ul>
				  </li>
			</ul>
    			
		</div>
		
	</div>
</nav>
<!-- 상단메뉴 끝 -->
