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
<title>Membership.jsp</title>

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
			<h1>회원가입<small>회원 가입 하세요</small></h1>
		</div>
		<div class="row">
			<div class="col-md-offset-1 col-md-10">
				<form id="myform" method="post" class="form-horizontal" action="<c:url value="/PDM/Membership.kosmo"/>">
					
					<div class="form-group"><!-- <div class="row">와 같다 -->
						<!--  label에 control-label도 함께:가운데 수직 정렬 -->
						<label class="col-sm-2 control-label" >아이디</label>
						<div class="col-sm-4">
							<input type="text" id="id" name="id" class="form-control" placeholder="아이디">
						</div>
							<p class="help-block" style="color:red;"><small>필수 항목입니다.</small></p>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-4">
							<a href="javascript:void(0);" id="check" class="btn btn-danger">아이디 중복 확인</a>
						</div>
					</div>
					
					<div class="form-group"><!-- <div class="row">와 같다 -->
						<!--  label에 control-label도 함께:가운데 수직 정렬 -->
						<label class="col-sm-2 control-label" >비밀번호</label>
						<div class="col-sm-4">
							<input type="password" name="password" class="form-control" placeholder="비밀번호">
						</div>
						<p class="help-block" style="color:red;"><small>필수 항목입니다.</small></p>
						
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" >이름</label>
						<div class="col-sm-4">
							<input type="text" name="name" class="form-control" placeholder="이름">
						</div>
							<p class="help-block" style="color:red;"><small>필수 항목입니다.</small></p>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">성별</label>
						<div class="col-sm-4">
							<div class="radio">
								<label><input name="gender" value="남자" type="radio"/>남자</label>
								<label><input name="gender" value="여자" type="radio"/>여자</label>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">관심사항</label>
						<div class="col-sm-4">
							<div class="checkbox">
								<label><input name="inter" value="정치" type="checkbox"/>정치</label>
							</div>
							<div class="checkbox">
								<label><input  name="inter" value="경제" type="checkbox"/>경제</label>
							</div>
							<div class="checkbox">
								<label><input  name="inter" value="연예" type="checkbox"/>연예</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">학력</label>
						<div class="col-sm-2">
							<select name="grade" class="form-control">
								<option >학력 미선택</option>
								<option value="초등학교">초등학교</option>
								<option value="중학교">중학교</option>
								<option value="고등학교">고등학교</option>
								<option value="대학교">대학교</option>
							</select>						
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">자기소개</label>
						<!-- 중첩 컬럼 사용 -->
						<div class="col-sm-10">
							<div class="row">
								<div class="col-sm-8">
									<textarea name="intro" rows="5" class="form-control"></textarea>	
								</div>
							</div>				
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-4">
							<button type="submit" class="btn btn-primary">확인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 실제 내용 끝 -->
	<!--  푸터 시작 -->
	<!-- 실제 내용 끝 -->
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
</body>

<script>

	


	$("#check").on("click",function(){
		var value = $('#id').val();
		console.log(value);

		$.ajax({
			url:"/ParkDaeMinProj2/PDM/Check.kosmo",
			type:"POST",
			data:{"id": value},
			success: function(data) {
				$('#small-modal').modal('show');
				if (data === '1') {
					$('.modal-title').html('아이디 중복 체크');
					$('#warningMessage').html('아이디가 중복되었습니다.');
				}
				else if (data === '-1') {
					$('.modal-title').html('아이디 중복 체크');
					$('#warningMessage').html('사용하실 수 있는 아이디입니다.');
				}
			}
		})
		
	});
	
	/*
	$("id").blur(function(){
		var id = ${"id"}.val();
		$.ajax({
			url:"/PDM/Check.kosmo",
			type:"POST",
			
			success: function(data){
				if(data==1){
					$("#id_check").text("사용중인 아이디입니다.");
				}
				else
					$("#id_check").text("사용 가능합니다.");
			}			
		});
	});
	*/
	
	var flag = "${flag}";
	var focusObject;
				$('#small-modal').on('hidden.bs.modal',function(){
					if (focusObject)
						focusObject.focus();
				});
				
				$("#myform").on("submit",function(){
					if(flag == "중복"){
						$('#warningMessage').html("아이디 중복 확인 부탁드립니다.");
						$('#small-modal').modal('show');
						focusObject= $(this).get(0).id;
						return false;
					}
					
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
				
				if($(this).get(0).name.value==""){
					$('#warningMessage').html("이름을 입력하세요");
					$('#small-modal').modal('show');
					focusObject= $(this).get(0).name;
					return false;
				}
				
				
				
			});
			console.log(flag)
				
	</script>
</html>