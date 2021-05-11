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
    		<li><a href="#menu2">대왕암 공원</a></li>
    		<li><a href="#menu3">가지산 사계</a></li>    	
    		<li><a href="#menu4">신불산 억새평원</a></li>    	
    		<li><a href="#menu5">간절곶</a></li>    	
    		<li><a href="#menu6">반구대암각화와 천전리각석</a></li>    	
    		<li><a href="#menu7">강동 주전 몽돌해변</a></li>    	
    		<li><a href="#menu8">울산대공원</a></li>    	
    		<li><a href="#menu9">울산대교</a></li>    	
    		<li><a href="#menu10">장생포 고래 문화 마을</a></li>    	
    		<li><a href="#menu11">외고산 옹기 마을</a></li>    	
    		<li><a href="#menu12">대운산 내원암 계곡</a></li>    	
    	</ul>
    	<!-- 탭메뉴에 따른 내용 -->
    	<div class="tab-content">
    		<div class="tab-pane fade" id="menu1">
				<div id="carousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel" data-slide-to="0" class="active"></li>
						<li data-target="#carousel" data-slide-to="1"></li>
						<li data-target="#carousel" data-slide-to="2"></li>
						<li data-target="#carousel" data-slide-to="3"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/1.jpg" alt="태화강 국가정원과 십리대밭" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/1-1.jpg" alt="태화강 국가정원과 십리대밭2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/1-2.jpg" alt="태화강 국가정원과 십리대밭3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/1-3.jpg" alt="태화강 국가정원과 십리대밭4" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/1-4.jpg" alt="태화강 국가정원과 십리대밭5" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
					
		    		<a class="left carousel-control" href="#carousel"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu -->
    		<div class="tab-pane fade" id="menu2">
    			Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.
    		</div>
    		<div class="tab-pane fade" id="menu3">
    			Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.
    		</div>
    		
    	</div>
    	
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