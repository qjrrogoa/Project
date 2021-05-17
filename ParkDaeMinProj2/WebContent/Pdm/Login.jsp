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
		<div class="jumbotron">
			<h1>로그인<small>로그인 하세요</small></h1>
		</div>
		
		<div class="row">
				<form id="myform" class="form-horizontal" method="post" action="<c:url value="/PDM/Login.kosmo"/>">
					<div class="form-group"><!-- <div class="row">와 같다 -->
						<!--  label에 control-label도 함께:가운데 수직 정렬 -->
						<label class="col-sm-2 control-label" >아이디</label>
						<div class="col-sm-4">
							<input type="text" id="id" name="id" class="form-control" placeholder="아이디">
						</div>
					</div>
					<div class="form-group"><!-- <div class="row">와 같다 -->
						<!--  label에 control-label도 함께:가운데 수직 정렬 -->
						<label class="col-sm-2 control-label" >비밀번호</label>
						<div class="col-sm-4">
						
							<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호">
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-4">
							<button type="submit" class="btn btn-primary">로그인</button>
						</div>
					</div>
				</form>
	</div>
	
	<!-- 실제 내용 끝 -->
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
	<jsp:include page="/Template/DataRoomFooter.jsp" />
</body>
	<script>
	var focusObject;		
			$('#small-modal').on('hidden.bs.modal',function(){
				console.log('모달창이 닫힘');
				focusObject.focus();
			});
	
			$("#myform").on("submit",function(){
				if($(this).get(0).id.value==""){
					$('#warningMessage').html("아이디를 입력하세요");
					$('#small-modal').modal('show');
					focusObject= $(this).get(0).id;
					return false;
				}
				if($(this).get(0).password.value==""){
					$('#warningMessage').html("비밀번호를 입력하세요");
					$('#small-modal').modal('show');
					focusObject= $(this).get(0).password;
					return false;
				}
			});
			
	</script>
</html>