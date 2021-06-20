<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
	<title>Home</title>
<style>
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/styles/common.css"/>">
</head>

<body>
	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
	<div id="map" style="width:100%;height:350px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a1543cd28a4530c70758ba5ea975b33a"></script>
<script>


console.log("${list.size()}");




var mapContainer = document.getElementById('map'),  
    mapOption = { 
		center: new kakao.maps.LatLng(37.56681519680827, 126.97867489950377), 
        level: 9
        };
        
var map = new kakao.maps.Map(mapContainer, mapOption); 

var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png'
	 imageSize = new kakao.maps.Size(50, 50),
	 imageOption = {offset: new kakao.maps.Point(27, 69)};

var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)


var positions = [
	<c:forEach items="${list}" var="item">
	    {
	        title: '${item.sno}', 
	        latlng: new kakao.maps.LatLng(${item.lat}, ${item.lng}),
	        content : '<div class="customoverlay">' +
	        '  <a href="<c:url value="/BBS/View.do?no=${item.no }"/>">' +
	        '    <span class="title">${item.title}</span>' +
	        '  </a>' +
	        '</div>'
	    },
	</c:forEach>
];


	 
	 
for (var i = 0; i < positions.length; i ++) {
	
    var marker = new kakao.maps.Marker({
        position: positions[i].latlng, 
        image : markerImage,
    });
    marker.setMap(map);  

    var customOverlay = new kakao.maps.CustomOverlay({
        map: map,
        position: positions[i].latlng,
        content: positions[i].content,
        yAnchor: 1 
    });

}

</script>
</body>
</html>
