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
<title>Ulsan.jsp</title>

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

	<jsp:include page="/Template/DataRoomTop.jsp" />
		
	  	<div class="container">
	  	<div class="jumbotron">
			<h1>
				울산<small>울산 12경</small>
			</h1>			
		</div>

    	<ul class="nav nav-tabs" id="tabMenu">
    		<li><a href="#menu1">태화강 국가정원과 십리대밭</a></li>
    		<li><a href="#menu2">대왕암</a></li>
    		<li><a href="#menu3">간절곶</a></li>    	
    		<li><a href="#menu4">주전 몽돌해변</a></li>    	
    		<li><a href="#menu5">울산대공원</a></li>    	
    		<li><a href="#menu6">울산대교</a></li>    	
    		<li><a href="#menu7">장생포 고래문화마을</a></li>    	
    		<li><a href="#menu8">외고산 옹기 마을</a></li>    	
    		<li><a href="#menu9">내원암 계곡</a></li>    	
    	</ul>
    	<!-- 탭메뉴에 따른 내용 -->

    	<div class="tab-content">
			<c:set value="${list}" var="list"/>
  	    	<c:forEach begin="1" end="9" var="i">
    		<div class="tab-pane fade" id="menu${i }">
				<div id="carousel${i }" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel${i }" data-slide-to="0" class="active"></li>
						<li data-target="#carousel${i }" data-slide-to="1"></li>
						<li data-target="#carousel${i }" data-slide-to="2"></li>
						<li data-target="#carousel${i }" data-slide-to="3"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/${i }.jpg" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/${i }-1.jpg" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/${i }-2.jpg" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/${i }-3.jpg"style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
					
		    		<a class="left carousel-control" href="#carousel${i }"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel${i }"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
					<div class="col-md-12">
				<div><span>&nbsp;</span></div>
    			<table class="table table-bordered table-striped table-condensed table-responsive">
    			<!-- 테이블 컬럼폭은 col-*_*계열로  -->
    				
	    			<tr style="text-align: center">
	    				<th class="text-center col-md-2">주소</th>
						${list[i-1].addr}
	    			</tr>
	    			<tr class="text-center">
	    				<td>문의처</td>
						${list[i-1].tel}
	    			</tr>
	    			<tr class="text-center">
	    				<td>홈페이지</td>
	    				<td>${list[i-1].page}</td>
	    			</tr>
	    			
	    			<tr class="text-center">
	    				<td colspan="2" class="text-left">${list[i-1].sb}</td>
	    			</tr>
	    		</table>
    		</div>
			</div><!-- carousel -->
		
  
		</div><!-- menu1 -->
		  	    </c:forEach>
    	</div>
    	
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    
    <script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
    <script>

    	
    	$(function(){
    		//페이지 로드시 메뉴1이 보이도록 설정
    		$('#tabMenu a:first').tab('show');
    		//각 탭 메뉴 클릭시 해당 내용이 보이도록 이벤트 처리
    		$('#tabMenu a').click(function(){
    			$(this).tab('show');    			
    		});
    		
        	$('#carousel').carousel({
      		  interval: 2000
      		});
    	});
		
    </script>
	<jsp:include page="/Template/DataRoomFooter.jsp" />
	
</body>
</html>