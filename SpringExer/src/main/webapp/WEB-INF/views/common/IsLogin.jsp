<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- IsLogin.jsp -->
<c:if test="${empty sessionScope.id }">
	<script>
		alert("로그인후 이용하세요");
		location.replace("<c:url value='/Member/Login.do'/>");	
	</script>
</c:if>