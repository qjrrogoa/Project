<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>List.jsp</title>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<!-- 네비게이션 시작 -->
	<jsp:include page="/Template/DataRoomTop.jsp" />
	<!-- 네비게이션 끝 -->
	<!-- 실제 내용 시작 -->
	<div class="container">
		<!-- 점보트론(Jumbotron) -->
		<div class="jumbotron">
			<h1>
				자랑하기<small>목록 페이지</small>
			</h1>			
		</div>
		<!-- 작성하기 버튼 -->
		<div class="text-right">
			<form id="myform" action="<c:url value="/PDM/Write.kosmo"/>">
				<input type="submit" class="btn btn-info" value="등록"/>
			</form>
		</div>
		<!-- 여백용 -->
		<div><span>&nbsp;</span></div>
		<div class="table-responsive">
			<table class="table table-bordered table-hover table-condensed">
				<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->
				<tr>
					<th class="text-center col-md-1">번호</th>
					<th class="text-center col-md-1">작성자</th>
					<th class="text-left">제목</th>
					<th class="text-center col-md-3">다녀온 곳</th>
					<th class="text-center col-md-2">등록일</th>
					<th class="text-center col-md-1">조회수</th>
					<th class="text-center col-md-1">좋아요</th>
					
				</tr>
				<c:if test="${empty list }" var="isEmpty">
					<tr class="text-center">
						<td colspan="7">등록된 게시물이 없습니다</td>					
					</tr>
				</c:if>
				<c:if test="${not  isEmpty}">
					<c:forEach var="item" items="${list}" varStatus="loop">
						<tr><!--  
						-->
							<td class="text-center col-md-1">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
							<td class="text-center col-md-1">${item.id}</td>
							<td class="text-left"><a href="<c:url value="/PDM/View.kosmo?no=${item.no}"/>">${item.title }</a></td>
							<td class="text-center col-md-3">${item.trip}</td>
							<td class="text-center col-md-2">${item.postdate }</td>
							<td class="text-center col-md-1">${item.visitcount }</td>
							<td class="text-center col-md-1">0</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="text-center">
         ${pagingString }
      		</div>
		</div>
			<div class="modal fade" id="small-modal" data-backdrop="static">
		   		<div class="modal-dialog modal-sm">
		   			<div class="modal-content">    				
		   				<div class="modal-body">
		   					<button class="close" data-dismiss="modal">
		   						<span>&times;</span>
		   					</button>
		   					<h5 class="modal-title"><span class="glyphicon glyphicon-bullhorn"></span>회원 가입</h5>
		   					<h4 id="warningMessage" style="color:red"></h4>
		   				</div>    			
		   			</div>    		
		   		</div>    	
		   	</div>
	<jsp:include page="/Template/DataRoomFooter.jsp" />
		
	</div><!-- container -->
	<!-- 실제 내용 끝 -->
	<!--  푸터 시작 -->
	<jsp:include page="/Template/DataRoomFooter.jsp" />
	<!-- 푸터 끝 -->
	
</body>
<script>

	
	var flag = "${flag}"
	console.log(flag)
	
	
		$(window).load(function(){
			if(flag == -1){
				$('#warningMessage').html("로그인 후 이용 바랍니다.");
				$('#small-modal').modal('show');
				
				return false;
			}
			
		});
</script>
</html>