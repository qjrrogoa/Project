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
<title>View.jsp</title>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style>
		/* 수정/삭제/목록 버튼 사이 간격 주기 */
		.btn-success{
			margin-right:5px;
		}
		/* 모달창 크기 조정*/
		.modal-sm{
			width:325px;
		}
	</style>
</head>
<body>
	<!-- 네비게이션 시작 -->
	<jsp:include page="/Template/DataRoomTop.jsp" />
	<!-- 네비게이션 끝 -->
	<!-- 실제 내용 시작 -->
	<div class="container">
		<div class="jumbotron">
			<h1>
				자료실<small>상세보기 페이지</small>
			</h1>
		</div>
			<div class="col-md-offset-1 col-md-10 table-responsive">
			<table class="table table-bordered table-hover table-condensed table-striped">
				<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->
					<tr>
						<th class="col-md-2 text-center">번 호</th>
						<td>${dto.no}</td>
						<th class="col-md-2 text-center">조회수</th>
						<td class="col-md-2 text-center">${dto.visitcount }</td>
						<th class="text-center">작성자</th>
						<td class="text-center">${dto.id}</td>
						
					</tr>
					<tr>
						<th class="text-center">제 목</th>
						<td colspan="5">${dto.title }</td>
					</tr>
					
					<tr>
						<th class="text-center">다녀온 곳</th>
						<td colspan="5" id="downcount">${dto.trip}</td>
					</tr>
					<tr>
						<th class="text-center">등록일</th>
						<td colspan="5">${dto.postdate}</td>
					</tr>
					<tr>
						<th class="text-center" colspan="6">내 용</th>
					</tr>
					<tr>
						<td colspan="6">${dto.content }</td>					
					</tr>
				</table>
			</div>
		<div class="row">
			<div class="col-md-offset-10 col-md-2" >
				<ul id="pillMenu" class="nav nav-pills pull-right" style="width:200px;margin-bottom:10px">
				<c:if test="${user==dto.id}">
					<li><a href="#"  onclick="editchk()" class="btn btn-success" >수정</a></li>
					<li><a href="#" onclick="delchk();" class="btn btn-success" >삭제</a></li>
				</c:if>
					<li style="padding-right: 0%"><a href="<c:url value="/PDM/List.kosmo"/>" class="btn btn-success">목록</a></li>
				</ul>
			</div>
		</div><!-- row -->	
	<hr>

		<div class="table-responsive">
			<table class="table table-bordered table-hover table-condensed">
				<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->
				<tr>
					<th class="text-center col-md-1">작성자</th>
					<th class="text-left">댓글</th>
					<th class="text-center col-md-2">등록일</th>
				</tr>
				<c:if test="${empty list }" var="isEmpty">
					<tr class="text-center">
						<td colspan="6">등록된 댓글이 없습니다</td>					
					</tr>
					
				</c:if>
				<c:if test="${not  isEmpty}">
					<c:forEach var="item" items="${list}" varStatus="loop">
						<tr>
							<td class="text-center col-md-1">${item.id }</td>
							<td class="text-left">${item.comments }</td>
							<td class="text-center col-md-1">${item.regidate }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		
			<form class="form-horizontal" method="post" action="<c:url value="/PDM/Commets.kosmo?no=${dto.no }"/>">
				<div class="form-group"><!-- <div class="row">와 같다 -->
					<!--  label에 control-label도 함께:가운데 수직 정렬 -->
					<label class="col-sm-2 control-label">댓글</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="comments" placeholder="댓글을 달아주세요!">
					</div>
					<div class="col-sm-4">
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</div>
			</form>	
			
		<div class="modal  fade" id="small-modal" data-backdrop="static">
	   		<div class="modal-dialog modal-sm">
	   			<div class="modal-content">    				
	   				<div class="modal-body">
	   					<button class="close" data-dismiss="modal">
	   						<span>&times;</span>
	   					</button>
	   					<h5 class="modal-title"><span class="glyphicon glyphicon-bullhorn"></span>로그인</h5>
	   					<h4 id="warningMessage" style="color:red"></h4>
	   				</div>    			
	   			</div>    		
	   		</div>    	
	   	</div>
	   	
	</div><!-- container -->
	
	
	<!-- 수정/삭제시 사용할 모달 끝 -->
	<!-- 실제 내용 끝 -->
	
	<!--  푸터 시작 -->
	<jsp:include page="/Template/DataRoomFooter.jsp" />
	<!-- 푸터 끝 -->
	<script type="text/javascript">
		 function delchk(){
			 if(confirm("삭제하시겠습니까?")){
				 location.href = "<c:url value='/PDM/Delete.kosmo?no=${dto.no}'/>";
				 return true;
			 }
			 else{
				 return false;
			 }
		 }
		 
		 function editchk(){
			 if(confirm("수정하시겠습니까?")){
				 location.href = "<c:url value='/PDM/Edit.kosmo?no=${dto.no}'/>";
				 return true;
			 }
			 else{
				 return false;
			 }
		 }
	
	
	</script>
</body>
</html>