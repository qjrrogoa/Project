<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Message.jsp -->
<!-- 어느 컨트롤러에서 왔는지에 따라 분기 -->
<c:choose>
	<c:when test="${WHERE == 'INS'}">
		<c:set var="successMsg" value="입력 성공했어요"/>
		<c:set var="failsMsg" value="입력 실패했어요"/>
		<c:set var="successUrl" value="/PDM/List.kosmo"/>
	</c:when>
	<c:when test="${WHERE == 'EDT'}">
		<c:set var="successMsg" value="수정 성공했어요"/>
		<c:set var="failsMsg" value="수정 실패했어요"/>
		<c:set var="successUrl" value="/PDM/View.kosmo?no=${no}"/>
	</c:when>
	<c:when test="${WHERE == 'UPL'}">
		<c:set var="failsMsg" value="이미지 파일만 업로드 하세요"/>
		<c:set var="successUrl" value="/PDM/Write.kosmo"/>
	</c:when>
		<c:when test="${WHERE == 'WRI'}">
		<c:set var="failsMsg" value="로그인후 이용하세요"/>
		<c:set var="successUrl" value="/PDM/List.kosmo"/>
	</c:when>
	<c:otherwise>
		<c:set var="successMsg" value="삭제 성공했어요"/>
		<c:set var="failsMsg" value="삭제 실패했어요"/>
		<c:set var="successUrl" value="/PDM/List.kosmo"/>
	</c:otherwise>
</c:choose>

<script>
	<c:choose>
		<c:when test="${SUCCFAIL==1}">
			alert("${successMsg }");
			location.replace("<c:url value="${successUrl }"/>");
		</c:when>
		<c:when test="${SUCCFAIL==0}">
			alert("${failsMsg }");
			history.back();
		</c:when>
		
		
		<c:otherwise>
			alert("파일 업로드 용량을 초과했어요.");
			history.back();
		</c:otherwise>
	</c:choose>
</script>