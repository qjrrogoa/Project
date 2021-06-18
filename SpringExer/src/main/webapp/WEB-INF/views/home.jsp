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
        level: 7
        };
        

var map = new kakao.maps.Map(mapContainer, mapOption); 
var positions = [
	<c:forEach items="${list}" var="item">
	    {
	        title: '${item.sno}', 
	        latlng: new kakao.maps.LatLng(${item.lat}, ${item.lng})
	    },
	</c:forEach>
];

var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    var imageSize = new kakao.maps.Size(24, 35); 
    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    var marker = new kakao.maps.Marker({
        map: map, 
        position: positions[i].latlng, 
        title : positions[i].title, 
        image : markerImage  
    });
}
</script>
</body>
</html>
