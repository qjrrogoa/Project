<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	function logout(){
		location.replace('<c:url value="/OneMemo/Auth/Logout.do"/>');
	}

</script>
<style>
body {
	padding-top: 50px;
}
</style>

<!-- 상단메뉴 시작 -->
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">	
	<div class="container-fluid">
		<div class="navbar-header">
			<!--화면 크기가 작을때 보여지는 네비게이션바(모바일용)  -->
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#collapse-menu">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- CI표시 -->
			<a class="navbar-brand" href="<c:url value="/"/>">
			<span class="glyphicon glyphicon-education"></span> <strong>KOSMO<strong></strong></a>
		</div>
		<!-- 화면 크기가 클때 상단에 보여지는 네비게이션바(데스크탑용) -->
		<div class="collapse navbar-collapse" id="collapse-menu">
			<!-- 네비게이션바에 폼 추가 -->
				<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value="/Stamp/Home.do"/>">HOME</a></li>
				<c:if test="${not empty sessionScope.id }" var="isLogin">
					<li><a href="<c:url value="/Member/Logout.do"/>">Logout</a></li>
					<li><a href="<c:url value="/Member/Mypage.do?id=${sessionScope.id}"/>">MyPage</a></li>
				</c:if>
				<c:if test="${not isLogin }">					
					<li><a href="<c:url value="/Member/Login.do"/>">Login</a></li>
					<li><a href="<c:url value="/Member/Join.do"/>">JOIN</a></li>
				</c:if>
				<li><a href="<c:url value="/Review/List.do"/>">Review</a></li>
				
			</ul>
		</div>
	</div>
</nav>
<!-- 상단메뉴 끝 -->
