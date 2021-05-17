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
<title>Main.jsp</title>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

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
			<h1>울산<small>울산에 오신 걸 환영합니다.</small></h1>
		</div>
		<div id="carousel" class="carousel slide"	data-ride="carousel">
			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#carousel" data-slide-to="0" class="active"></li>
				<li data-target="#carousel" data-slide-to="1"></li>
				<li data-target="#carousel" data-slide-to="2"></li>
				<li data-target="#carousel" data-slide-to="3"></li>
				<li data-target="#carousel" data-slide-to="4"></li>
				<li data-target="#carousel" data-slide-to="5"></li>
				<li data-target="#carousel" data-slide-to="6"></li>
				<li data-target="#carousel" data-slide-to="7"></li>
				<li data-target="#carousel" data-slide-to="8"></li>
			</ul>
				<!-- Wrapper for slides -->
					<div class="carousel-inner">
					
						<div class="item active">
							<a href="https://www.ulsan.go.kr/garden">						
								<img src="../Images/1.jpg" alt="태화강 국가정원과 십리대밭" style="width:100%;height:400px"/>
									<div class="carousel-caption">
										<h2>태화강 국가정원과 십리대밭</h2>
									</div>
							</a>						
						</div>
					
					<div class="item">
						<a href="http://daewangam.donggu.ulsan.kr">						
							<img src="../Images/2.jpg" alt="대왕암 공원" style="width:100%;height:400px"/>
								<div class="carousel-caption">
									<h2>대왕암 공원</h2>
								</div>
						</a>
					</div>
					
					<div class="item">
						<a href="https://tour.ulju.ulsan.kr/">						
							<img src="../Images/3.jpg" alt="간절곶" style="width:100%;height:400px"/>
								<div class="carousel-caption">
									<h2>간절곶</h2>
								</div>
						</a>
					</div>
					
					<div class="item">
						<a href="http://www.donggu.ulsan.kr/tour/">						
							<img src="../Images/4.jpg" alt="강동 주전 몽돌해변" style="width:100%;height:400px"/>
								<div class="carousel-caption">
									<h2>강동 주전 몽돌해변</h2>
								</div>
						</a>
					</div>
					
					<div class="item">
						<a href="http://www.ulsanpark.com">						
						<img src="../Images/5.jpg" alt="울산대공원" style="width:100%;height:400px"/>
						<div class="carousel-caption">
							<h2>울산대공원</h2>
						</div>
						</a>>
					</div>
					
					<div class="item">
						<a href="http://www.donggu.ulsan.kr/tour/touristInfo/ulsanBridgeInfo.jsp">						
							<img src="../Images/6.jpg" alt="울산대교" style="width:100%;height:400px"/>
								<div class="carousel-caption">
									<h2>울산대교</h2>
								</div>
						</a>
					</div>
					
					<div class="item">
						<a href="http://www.whalecity.kr">										
							<img src="../Images/7.jpg" alt="장생포 고래 문화 마을" style="width:100%;height:400px"/>
								<div class="carousel-caption">
									<h2>장생포 고래 문화 마을</h2>
								</div>
						</a>
					</div>
					
					<div class="item">
						<a href="http://onggi.ulju.ulsan.kr/academy/intro.php">						
							<img src="../Images/8.jpg" alt="외고산 옹기 마을" style="width:100%;height:400px"/>
								<div class="carousel-caption">
									<h2>외고산 옹기 마을</h2>
								</div>
						</a>
					</div>
					
					<div class="item">
						<a href="https://tour.ulju.ulsan.kr/">						
							<img src="../Images/9.jpg" alt="대운산 내원암 계곡" style="width:100%;height:400px"/>
								<div class="carousel-caption">
									<h2>대운산 내원암 계곡</h2>
								</div>
						</a>
					</div>
					
				</div>
				<!-- Controls -->
				  <a class="left carousel-control" href="#carousel"  data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left"></span>				    
				  </a>
				  <a class="right carousel-control" href="#carousel"  data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>				   
				  </a>
			</div>
	</div>
	<!-- 실제 내용 끝 -->
	<!--  푸터 시작 -->
	<jsp:include page="/Template/DataRoomFooter.jsp" />
	<script>
		$('#carousel').carousel({
			  interval: 2000
			})
		</script>
	<!-- 푸터 끝 -->
</body>
</html>

