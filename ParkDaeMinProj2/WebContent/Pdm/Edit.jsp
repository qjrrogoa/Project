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
<title>Edit.jsp</title>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- SummerNotes -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- IE8 에서 HTML5 요소와 미디
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
			<h1>
				수정<small>수정 페이지</small>
			</h1>
		</div>
		<div>
			<form id="myform" method="post" class="form-horizontal" action="<c:url value="/PDM/Edit.kosmo"/>">
				<input type="hidden" name="no" value="${param.no}"/>
				<input type="hidden" name="nowPage" value="${param.nowPage }"/>
				<div class="form-group">					
					<label class="col-sm-2 control-label">제 목</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요">
					</div>
				</div>
				<div class="form-group">
						<label class="col-sm-2 control-label">다녀온 곳</label>
						<div class="col-sm-3">
							<select class="form-control" name="trip">
								<option>태화강 국가정원과 십리대밭</option>
								<option>대왕암 공원</option>
								<option>간절곶</option>
								<option>강동 주전 몽돌해변</option>
								<option>울산대공원</option>
								<option>울산대교</option>
								<option>장생포 고래 문화 마을</option>
								<option>외고산 옹기 마을</option>
								<option>대운산 내원암 계곡</option>
							</select>						
						</div>
					</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">내 용</label>
					<!-- 중첩 컬럼 사용 -->
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-8">
								<textarea rows="10" class="form-control" id="summernote" name="content" placeholder="내용을 입력하세요"></textarea>
									<script>
									      $('#summernote').summernote({
									        placeholder: 'Hello stand alone ui',
									        tabsize: 2,
									        height: 400,
									        toolbar: [
									          ['style', ['style']],
									          ['font', ['bold', 'underline', 'clear']],
									          ['color', ['color']],
									          ['para', ['ul', 'ol', 'paragraph']],
									          ['table', ['table']],
									          ['insert', ['link', 'picture', 'video']],
									          ['view', ['fullscreen', 'codeview', 'help']]
									        ]
									      });
								    </script>
							</div>
						</div>
					</div>
				</div>

				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-4">
						<button  class="btn btn-primary">수정하기</button>
					</div>
				</div>
			</form>
		</div>
	</div><!-- container -->
	<!-- 경고창 모달 시작 -->
	<div class="modal fade" id="small-modal" data-backdrop="static">
   		<div class="modal-dialog modal-sm">
   			<div class="modal-content">    				
   				<div class="modal-body">
   					<button class="close" data-dismiss="modal">
   						<span>&times;</span>
   					</button>
   					<h5 class="modal-title"><span class="glyphicon glyphicon-bullhorn"></span> 확인 메시지</h5>
   					<h4 id="warningMessage" style="color:red"></h4>
   				</div>    			
   			</div>    		
   		</div>    	
   	</div>
	
	<!-- 경고창 모달 끝 -->
	<!-- 실제 내용 끝 -->
	
	<!--  푸터 시작 -->
	<jsp:include page="/Template/DataRoomFooter.jsp" />
	<!-- 푸터 끝 -->
	<script>
		/*    	
		//파일 사이즈(바이트):파일객체(자스 DOM).files[0].size
		//파일 명:파일객체(자스 DOM).files[0].name
		//파일 컨텐츠 타입:파일객체(자스 DOM).files[0].type
		*/
		

		$(function(){
			
			var focusObject;		
			
			var jQueryDom = $('input[name=attachFile]');			
			console.log('제이쿼리 돔객체:%O',jQueryDom);
			var jsDom = $('input[name=attachFile]').get(0);			
			console.log('자스 돔객체:%O',jsDom);
			
			$('#small-modal').on('hidden.bs.modal',function(){
				console.log('모달창이 닫힘');
				focusObject.focus();
			});
			
			$("#myform").on("submit",function(){
				//자스 DOM으로 input type="file" 얻기
				var fileObj = $(this).get(0).attachfile;
				
				if($(this).get(0).title.value==""){
					$('#warningMessage').html("제목을 입력하세요");
					$('#small-modal').modal('show');
					focusObject= $(this).get(0).title;
					return false;
				}
				
				if($('textarea').val()==""){
					$('#warningMessage').html("내용을 입력하세요");
					$('#small-modal').modal('show');
					focusObject= $('textarea');
					return false;
				}				
			});
			
		});
	</script>
</body>
</html>