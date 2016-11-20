<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>


<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>trpf1</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_400-Myriad_Pro_700-Myriad_Pro_italic_400-Myriad_Pro_italic_700.font.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/jquery.easing.compatibility.js"></script>
<script type="text/javascript" src="js/jcarousellite.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/general.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>

<style type="text/css">
body {
    margin: 0;
    padding: 0;
    font-family: "Gill sans", sans-serif;
    background-color: #fff;
    color: #000;
}
div#bd {
    position: relative;
}
div#gmap {
    width: 100%;
    height: 300px;
}
.style4 {
	color: #FF0000;
	font-weight: bold;
	font-size: 16pt;
}
</style>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
var map;
var marker=false;
function initialize() {
  var myLatlng = new google.maps.LatLng(13.331769700000000000,77.127360100000030000);
  
  var myOptions = {
    zoom: 16,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
	
  }
  
  map = new google.maps.Map(document.getElementById("gmap"), myOptions);
  
  marker = new google.maps.Marker({
      	position: myLatlng, 
      	map: map
  	});
	
  google.maps.event.addListener(map, 'center_changed', function() {
  	var location = map.getCenter();
	document.getElementById("lat").innerHTML = location.lat();
	document.getElementById("lon").innerHTML = location.lng();
    placeMarker(location);
  });
  google.maps.event.addListener(map, 'zoom_changed', function() {
  	zoomLevel = map.getZoom();
	document.getElementById("zoom_level").innerHTML = zoomLevel;
  });
  google.maps.event.addListener(marker, 'dblclick', function() {
    zoomLevel = map.getZoom()+1;
    if (zoomLevel == 20) {
     zoomLevel = 10;
   	}    
	document.getElementById("zoom_level").innerHTML = zoomLevel; 
	map.setZoom(zoomLevel);
	 
  });
  
   document.getElementById("zoom_level").innerHTML = 16; 
  document.getElementById("lat").innerHTML = 13.331769700000000000;
  document.getElementById("lon").innerHTML = 77.127360100000030000;
  
}
  
function placeMarker(location) {
  var clickedLocation = new google.maps.LatLng(location);
  marker.setPosition(location);
}
window.onload = function(){initialize();};

</script>

</head>
<body>
	<form name="form" action="varysecurity.jsp" onSubmit="return valid();" method="post"  >
  <div id="wrapper"> 
    <div id="header"> 
      <h2><font color="#00FFFF" size="+2">trpf1: A Trajectory Privacy-Preserving Framework
for Participatory Sensing</font></h2>
    </div>
    <div id="nav"> 
      <div class="inner"> 
        <ul>
          
        </ul>
      </div>
    </div>
    <div id="hold"> 
      <div id="content"> 
        <div id="subheader"> 
          <h2 style="color:#FF0000">Participator Sharing &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</h2>
        </div>
        <div id="leftcolumn"> 
          <table width="400px" height="250px">
          
          <tr>
          
          
            
            <tr> 
              <td><font color="#660000" size="2"><strong>Title:</strong></font></td>
              <td><input name="title" type="textbox" ></td>
            </tr>
            <tr> 
              <td><font color="#660000" size="2"><strong>Description:</strong></font></td>
              <td><textarea name="description" cols="50" rows="5"></textarea></td>
            </tr>
			<tr> 
              <td><font color="#660000" size="2"><strong>Latitude:</strong></font></td>
              <td> <input name="lat" type="textbox"></td>
            </tr>
            <tr> 
              <td><font color="#660000" size="2"><strong>Longitude:</strong></font></td>
              <td><input name="lon" type="textbox"></td>
            </tr>
            <tr> 
              <td><font color="#660000" size="2"><strong>Location:</strong></font></td>
              <td> <input name="location" type="textbox"></td>
            </tr>
            <tr> 
              <td colspan="2" align="center"><input name="search" type="submit" value="Send" class="button"> 
                &nbsp;&nbsp;&nbsp; 
                <input name="search" type="reset" value="Reset" class="button"></td>
            </tr>
                      </table>
   
          <div id="error"></div>
        </div>
        <div id="rightcolumn"> 
          <h3> 
            
          </h3>
          <ul class="blog-entries">
            <img src="images/overview.jpg" width="300" height="300"> 
          </ul>
        </div>
        <div class="clear"></div>
      </div>
      <div id="footer"> 
    <!--map-->   
    	<div id="bd"> 
                <div id="gmap"></div>
                
                lat:<span id="lat"></span> 
                lon:<span id="lon"></span><br/>
                zoom level: <span id="zoom_level"></span> </div>
	<!--end map-->
        <div class="clear"></div>
      </div>
      <div id="copyright"> 
        <p align="center">trpf1: A Trajectory Privacy-Preserving Framework
for Participatory Sensing</p>
      </div>
    </div>
  </div>
</form>
</body>
</html>
