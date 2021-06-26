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
<title>Mypage.jsp</title>

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
	<jsp:include page="/WEB-INF/views/templates/Top.jsp" />
	<!-- 네비게이션 끝 -->
	<!-- 실제 내용 시작 -->
	<div class="container">
		<div class="jumbotron">
			<h1>마이페이지</h1>
		</div>
		<div class="row">
		
		<c:if test="${sessionScope.id != dto.id && sessionScope.id !=null}">
			<c:if test="${followCheck != 1 }" >
				<input type="button" id="follow" value="팔로우 "/>
			</c:if>
			<c:if test="${followCheck == 1 }">
				<input type="button" id="follow" value="팔로우 취소"/>
			</c:if>		
		</c:if>
		
			<div>					
				<a href="#" id="followerAjax" data-toggle="modal" data-target="#followerShow">팔로워</a><span id="followCount">${followerCnt }</span>
				<!-- Modal -->
				<div class="modal fade" id="followerShow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">팔로워 리스트</h4>
				      </div>
				      <div class="modal-body">
						<ul id="followerList">
						</ul>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>					
					
			<div>					
				<a href="#" id="followAjax" data-toggle="modal" data-target="#followShow">팔로우</a><span id="followerCount">${followCnt }</span>
				<!-- Modal -->
				<div class="modal fade" id="followShow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">팔로우 리스트</h4>
				      </div>
				      <div class="modal-body">
						<ul id="followList">
						</ul>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
			
			<div class="col-md-offset-2 col-md-8">
				<table class="table table-bordered table-striped">
				
				<tr>
					<th class="col-md-2 text-center">이 름</th>
				</tr>
				<tr>
					<td class="text-center">${dto.name }</td>
				</tr>
				</table>
			</div>
		</div><!-- row -->
		
	</div>
	<!-- 실제 내용 끝 -->
	<!--  푸터 시작 -->
	<jsp:include page="/WEB-INF/views/templates/Footer.jsp" />
	
	<!-- 푸터 끝 -->
	<script>
	
	var followerId = "${sessionScope.id}"
	var followId = "${dto.id}"
	var followCount = Number.parseInt($("#followCount").html())
	var followerCount = Number.parseInt($("#followerCount").html())

	$("#follow").click(function(){
		$.ajax({
			url:"<c:url value="/Follow/follow.do"/>",
			type:"post",
			data:{followerId,followId},
			dataType:"text",
			success:function(data){
				if(data==0){
					$("#follow").val("팔로잉 중");
					$("#followCount").html(++followCount);
				}
				else{
					$("#follow").val("팔로우");
					$("#followCount").html(--followCount);
				}
			},
			error:function(){
				alert("에러")
			}
			
		})
	})
	
	$('#followerShow').on('shown.bs.modal', function () {
		  $('#myInput').focus()
		})
			
	$('#followerAjax').click(function(){
		$("#followerList").html("");
		 $.ajax({
				url:"<c:url value="/Follow/followerList.do"/>",
				type:"post",
				data:{followId},
				dataType:"json",
				success:function(data){
					for(var i=0;i<data.length;i++){
						var id = data[i].followerId;
						$("#followerList").append("<li><a href='<c:url value='/Member/Mypage.do?id="+id+"'/>'>"+id+"</a></li>")
					}
				},
				error:function(){
					alert("에러")
				}
			})
		})
		
	
	$('#followAjax').click(function(){
		$("#followList").html("");
		 $.ajax({
				url:"<c:url value="/Follow/followList.do"/>",
				type:"post",
				data:{followId},
				dataType:"json",
				success:function(data){
					for(var i=0;i<data.length;i++){
						var id = data[i].followId;
						$("#followList").append("<li><a href='<c:url value='/Member/Mypage.do?id="+id+"'/>'>"+id+"</a></li>")
					} 
				},
				error:function(){
					alert("에러")
				}
			})
		})
		
	
	

		
	$('#followShow').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	})
		
	</script>
</body>
</html>