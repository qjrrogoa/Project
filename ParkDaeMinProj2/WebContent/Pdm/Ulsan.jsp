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
				<div id="carousel1" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel1" data-slide-to="0" class="active"></li>
						<li data-target="#carousel1" data-slide-to="1"></li>
						<li data-target="#carousel1" data-slide-to="2"></li>
						<li data-target="#carousel1" data-slide-to="3"></li>
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
					
		    		<a class="left carousel-control" href="#carousel1"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel1"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
		
    		<div class="tab-pane fade" id="menu2">
				<div id="carousel2" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carouse2" data-slide-to="0" class="active"></li>
						<li data-target="#carousel2" data-slide-to="1"></li>
						<li data-target="#carousel2" data-slide-to="2"></li>
						<li data-target="#carousel2" data-slide-to="3"></li>
						<li data-target="#carousel2" data-slide-to="4"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/2.jpg" alt="대왕암" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/2-1.jpg" alt="대왕암2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/2-2.jpg" alt="대왕암3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/2-3.jpg" alt="대왕암4" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						<div class="item">
							<img src="../Images/2-4.jpg" alt="대왕암5" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
					
		    		<a class="left carousel-control" href="#carousel2"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel2"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
		
    		<div class="tab-pane fade" id="menu3">
				<div id="carousel3" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel3" data-slide-to="0" class="active"></li>
						<li data-target="#carousel3" data-slide-to="1"></li>
						<li data-target="#carousel3" data-slide-to="2"></li>
						<li data-target="#carousel3" data-slide-to="3"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/3.jpg" alt="가지산 사계" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/3-1.jpg" alt="가지산 사계2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/3-2.jpg" alt="가지산 사계3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/3-3.jpg" alt="가지산 사계4" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
					
		    		<a class="left carousel-control" href="#carousel3"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel3"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
		
    		<div class="tab-pane fade" id="menu4">
				<div id="carousel4" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel4" data-slide-to="0" class="active"></li>
						<li data-target="#carousel4" data-slide-to="1"></li>
						<li data-target="#carousel4" data-slide-to="2"></li>
						<li data-target="#carousel4" data-slide-to="3"></li>
						<li data-target="#carousel4" data-slide-to="4"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/4.jpg" alt="신불산 억새 평원" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/4-1.jpg" alt="신불산 억새 평원2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/4-2.jpg" alt="신불산 억새 평원3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/4-3.jpg" alt="신불산 억새 평원5" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/4-5.jpg" alt="신불산 억새 평원5" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
					
		    		<a class="left carousel-control" href="#carousel4"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel4"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
		
    		<div class="tab-pane fade" id="menu5">
				<div id="carousel5" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel5" data-slide-to="0" class="active"></li>
						<li data-target="#carousel5" data-slide-to="1"></li>
						<li data-target="#carousel5" data-slide-to="2"></li>
						<li data-target="#carousel5" data-slide-to="3"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/5.jpg" alt="간절곶" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/5-1.jpg" alt="간절곶2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/5-2.jpg" alt="간절곶3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/5-3.jpg" alt="간절곶4" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
					
		    		<a class="left carousel-control" href="#carousel5"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel5"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
		
    		<div class="tab-pane fade" id="menu6">
				<div id="carousel6" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel6" data-slide-to="0" class="active"></li>
						<li data-target="#carousel6" data-slide-to="1"></li>
						<li data-target="#carousel6" data-slide-to="2"></li>
						<li data-target="#carousel6" data-slide-to="3"></li>
						<li data-target="#carousel6" data-slide-to="4"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/6.jpg" alt="반구대암각화와 천전리각석" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/6-1.jpg" alt="반구대암각화와 천전리각석2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/6-2.jpg" alt="반구대암각화와 천전리각석3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/6-3.jpg" alt="반구대암각화와 천전리각석4" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/6-4.jpg" alt="반구대암각화와 천전리각석5" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
					
		    		<a class="left carousel-control" href="#carousel6"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel6"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
		
    		<div class="tab-pane fade" id="menu7">
				<div id="carousel7" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel7" data-slide-to="0" class="active"></li>
						<li data-target="#carousel7" data-slide-to="1"></li>
						<li data-target="#carousel7" data-slide-to="2"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/7.jpg" alt="강동 주전 몽돌해변" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/7-1.jpg" alt="강동 주전 몽돌해변2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/7-2.jpg" alt="강동 주전 몽돌해변3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
					
		    		<a class="left carousel-control" href="#carousel7"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel7"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
		
    		<div class="tab-pane fade" id="menu8">
				<div id="carousel8" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel8" data-slide-to="0" class="active"></li>
						<li data-target="#carousel8" data-slide-to="1"></li>
						<li data-target="#carousel8" data-slide-to="2"></li>
						<li data-target="#carousel8" data-slide-to="3"></li>
						<li data-target="#carousel8" data-slide-to="4"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/8.jpg" alt="울산대공원" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/8-1.jpg" alt="울산대공원2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/8-2.jpg" alt="울산대공원3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/8-3.jpg" alt="울산대공원4" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/8-4.jpg" alt="울산대공원5" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
					
		    		<a class="left carousel-control" href="#carousel8"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel8"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
		
    		<div class="tab-pane fade" id="menu9">
				<div id="carousel9" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel9" data-slide-to="0" class="active"></li>
						<li data-target="#carousel9" data-slide-to="1"></li>
						<li data-target="#carousel9" data-slide-to="2"></li>
						<li data-target="#carousel9" data-slide-to="3"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/9.jpg" alt="울산대교" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/9-1.jpg" alt="울산대교2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/9-2.jpg" alt="울산대교3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/9-3.jpg" alt="울산대교4" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
					
		    		<a class="left carousel-control" href="#carousel9"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel9"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
		
    		<div class="tab-pane fade" id="menu10">
				<div id="carousel10" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel10" data-slide-to="0" class="active"></li>
						<li data-target="#carousel10" data-slide-to="1"></li>
						<li data-target="#carousel10" data-slide-to="2"></li>
						<li data-target="#carousel10" data-slide-to="3"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/10.jpg" alt="장생포 고래 문화 마을" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/10-1.jpg" alt="장생포 고래 문화 마을2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/10-2.jpg" alt="장생포 고래 문화 마을3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/10-3.jpg" alt="장생포 고래 문화 마을4" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/10-4.jpg" alt="장생포 고래 문화 마을5" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
					
		    		<a class="left carousel-control" href="#carousel10"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel10"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
		
    		<div class="tab-pane fade" id="menu11">
				<div id="carousel11" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel11" data-slide-to="0" class="active"></li>
						<li data-target="#carousel11" data-slide-to="1"></li>
						<li data-target="#carousel11" data-slide-to="2"></li>
						<li data-target="#carousel11" data-slide-to="3"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/11.jpg" alt="외고산 옹기 마을" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/11-1.jpg" alt="외고산 옹기 마을2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/11-2.jpg" alt="외고산 옹기 마을3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/11-3.jpg" alt="외고산 옹기 마을4" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
					
		    		<a class="left carousel-control" href="#carousel11"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel11"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
		
    		<div class="tab-pane fade" id="menu12">
				<div id="carousel12" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#carousel12" data-slide-to="0" class="active"></li>
						<li data-target="#carousel12" data-slide-to="1"></li>
						<li data-target="#carousel12" data-slide-to="2"></li>
						<li data-target="#carousel12" data-slide-to="3"></li>
					</ul>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../Images/12.jpg" alt="대운산 내원암 계곡" style="width:100%;height:400px"/>
							<div class="carousel-caption">
						</div>
					</div>
					
						<div class="item">
							<img src="../Images/12-1.jpg" alt="대운산 내원암 계곡2" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/12-2.jpg" alt="대운산 내원암 계곡3" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
						<div class="item">
							<img src="../Images/12-3.jpg" alt="대운산 내원암 계곡4" style="width:100%;height:400px"/>
							<div class="carousel-caption">
							</div>
						</div>
						
					
		    		<a class="left carousel-control" href="#carousel12"  data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>				    
			  		</a>
				  	<a class="right carousel-control" href="#carousel12"  data-slide="next">
				   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				 	 </a>
				</div><!-- carousel-inner -->
			</div><!-- carousel -->
		</div><!-- menu1 -->
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