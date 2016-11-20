

<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TrPF</title>
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
try {			
		String qid=(String)session.getAttribute("qid");
		String myid=(String)session.getAttribute("myid");
		
			
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");

			PreparedStatement ps=con1.prepareStatement("INSERT INTO answer VALUES(?,?,?,?)");
				ps.setInt(1,id);
               	ps.setString(2,name);
				ps.setString(3,phone);	
       			ps.setString(4,password);
       			ps.setString(5,location);
			    ps.setString(6,usertype);
				ps.setString(7,status);
			   
	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("home.html?message=success");
			}
			else
			{
				response.sendRedirect("home.html?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
</body>
</html>

