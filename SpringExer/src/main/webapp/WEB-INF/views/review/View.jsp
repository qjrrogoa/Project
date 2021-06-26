<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
@SessionAttributes("id")와 컨틀로러 메소드의 인자로 @ModelAttribute("id") String id 사용시
아래 로그인 여부 체크를 위한 인클루드 불필요
 -->
<%--@ include file="/WEB-INF/views/common/IsLogin.jsp" --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>View.jsp</title>
<style>
.invisible {
	display: none;
}
</style>
	
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
		<div class="page-header">
			<h1>
				한줄 메모 게시판<small>상세보기 페이지</small>
			</h1>
		</div>
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<table class="table table-bordered table-striped">
					<tr>
						<th class="col-md-2 text-center">번호</th>
						<td>${dto.rvNo }</td>
						<th class="col-md-2 text-center">좋아요</th>
						<td id="likecount">${dto.rvLikeCnt}</td>
						
					</tr>
					<tr>
						<th class="text-center">제목</th>
						<td colspan='3'>${dto.rvTitle }</td>
					</tr>
					<tr>
						<th class="text-center">작성자</th>
						<td colspan='3'>${dto.name }</td>
					</tr>
				
					<tr>
						<th class="text-center" colspan="4">내용</th>
					</tr>
					<tr>
						<td colspan="4">${dto.rvCtt}</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- row -->
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
			
		<c:if test="${not empty sessionScope.id }">
			<c:if test="${dto.rvLikeCheck != 1 }" >
				<input type="button" id="like" value="좋아요"/>
			</c:if>
			<c:if test="${dto.rvLikeCheck == 1 }">
				<input type="button" id="like" value="좋아요 취소"/>
			</c:if>
		</c:if>		 
				<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
				<ul id="pillMenu" class="nav nav-pills center-block" style="width: 200px; margin-bottom: 10px">
					<c:if test="${sessionScope.id == dto.id}">
						<li><a href="<c:url value='/Review/Edit.do?rvNo=${dto.rvNo}'/>" class="btn btn-success">수정</a></li>
						<li><a href="<c:url value='/Review/Delete.do?rvNo=${dto.rvNo}'/>" class="btn btn-success">삭제</a></li>
					</c:if>
						<li><a href="<c:url value='/Review/List.do'/>" class="btn btn-success">목록</a></li> 
				</ul>
			</div>
		</div>	​

		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<div class="text-center">​ ​
				</div>
			</div>
		</div>
	</div>
	<!-- 실제 내용 끝 -->

	
	
	<!--  푸터 시작 -->
	<jsp:include page="/WEB-INF/views/templates/Footer.jsp" />
	<!-- 푸터 끝 -->
	<script>

	<!-- 

		$(".like").click(function(){
			if($(this).val()=="좋아요"){
				action="<c:url value="/Review/Like.do"/>";
				type = "post";
			}
			else{
				action="<c:url value="/Review/UnLike.do"/>";
				type = "post";
			}
			console.log("클릭 이벤트 발생:"+$(this).val());
			$.ajax({
				url:action,
				data:$("#like").serialize(),
				dataType:"text",
				type:"post",
				success:function(data){ 
					console.log("서버로부터 받은 데이타:"+data);
				}				
			});				
		});///////////////
		 -->
		
		var id = "${sessionScope.id}"
		var rvNo = "${dto.rvNo}"
		var likecount = Number.parseInt($("#likecount").html())
	
		$("#like").click(function(){
			$.ajax({
				url:"<c:url value="/Review/Like.do"/>",
				type:"post",
				data:{id, rvNo},
				dataType:"text",
				success:function(data){
					if(data==0){
						$("#like").val("좋아요 취소");
						$("#likecount").html(++likecount);
					}
					else{
						$("#like").val("좋아요");
						$("#likecount").html(--likecount);
					}
				},
				error:function(){
					alert("에러");
				}
			})
		})
	
		</script>
	
</body>
</html>