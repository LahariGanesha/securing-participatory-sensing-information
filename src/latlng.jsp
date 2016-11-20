<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<title>Google Maps JavaScript API v3 Example: Reverse Geocoding</title>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
  var map;
  function initialize() {
  var myLatlng = new google.maps.LatLng(13.3400,77.1000);

  var myOptions = {
     zoom: 8,
     center: myLatlng,
     mapTypeId: google.maps.MapTypeId.ROADMAP
     }
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions); 

  var marker = new google.maps.Marker({
  draggable: true,
  position: myLatlng, 
  map: map,
  title: "Your location"
  });

  google.maps.event.addListener(marker,'click',function(overlay,point){
	  
     document.getElementById("latbox").value = lat();
     document.getElementById("lngbox").value = lng();
     });
  google.maps.event.addListener(marker, 'dragend', function (event) {
	  
	    document.getElementById("latbox").value = this.getPosition().lat();
	    document.getElementById("lngbox").value = this.getPosition().lng();
	});
  google.maps.event.addListener(marker, 'click', function (event) {
	  
	    document.getElementById("latbox").value = event.latLng.lat();
	    document.getElementById("lngbox").value = event.latLng.lng();
	});

	google.maps.event.addListener(marker, 'click', function (event) {
		
	    document.getElementById("latbox").value = this.getPosition().lat();
	    document.getElementById("lngbox").value = this.getPosition().lng();
	});
	google.maps.event.addListener(marker, 'drag', function(event){
		
	       document.getElementById("latbox").value = event.latLng.lat();
	       document.getElementById("lngbox").value = event.latLng.lng();
	});

}
  function codeLatLng() {

	    var lat = document.getElementById('latbox').value;
	    var lng = document.getElementById('lngbox').value;

	    var latlng = new google.maps.LatLng(lat, lng);
	    geocoder.geocode({'latLng': latlng}, function(results, status) {
	      if (status == google.maps.GeocoderStatus.OK) {
	        if (results[1]) {
	          map.setZoom(11);
	          marker = new google.maps.Marker({
	              position: latlng, 
	              map: map
	          }); 
	        var address= (results[1].formatted_address);
	        document.getElementById('Address').value= results[1].formatted_address;
	        infowindow.setContent(results[1].formatted_address);
	          infowindow.open(map, marker);
	        } else {
	          alert("No results found");
	        }
	      } else {
	        alert("Geocoder failed due to: " + status);
	      }
	    });
	  }
</script> 
</head>
<body onload="initialize()">
<form action="rg1.jsp" >
  <div id="map_canvas" style="width:50%; height:50%"></div>

  <div id="latlong">
    <p>Latitude: <input size="10" type="text" id="latbox" name="lat" ></p>
    <p>Longitude: <input size="10" type="text" id="lngbox" name="lng" ></p>
    
  

  </div>
</div>
 <input  type="submit" name="submit" value="Submit Address" >
    
</form>
</body>

</html>