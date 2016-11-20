<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<title>Google Maps JavaScript API v3 Example: Reverse Geocoding</title>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
  var geocoder;
  var map;
  var infowindow = new google.maps.InfoWindow();
  var marker;
  function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(21.0000,78.0000);
    var myOptions = {
      zoom: 8,
      center: latlng,
      mapTypeId: 'roadmap'
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  }

  function codeLatLng() {

    var lat = document.getElementById('Latitude').value;
    var lng = document.getElementById('Longitude').value;

    var latlng = new google.maps.LatLng(lat, lng);
    geocoder.geocode({'latLng': latlng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[1]) {
          map.setZoom(11);
          marker = new google.maps.Marker({
              position: latlng,
              map: map
          });
          alert(results[1]);

        var address= (results[1].formatted_address);
        var faddr=address.split(",",1);
        //alert(faddr);
        document.getElementById('Address').value= faddr;

        //document.getElementById('Address').value= results[1].formatted_address;
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
<form action="participatorshare1.jsp">
<div>
        <% String lat=(String)request.getParameter("lat");%>
        <% String lon=(String)request.getParameter("lng");%>
        <% session.setAttribute("lat",lat);
         session.setAttribute("lon",lon);
        System.out.println(lat+""+lon); %>
  <input name="Latitude" type="text" id="Latitude" size="10" maxlength="10" value=<%= request.getParameter("lat")%> />
  <input name="Longitude" type="text" id="Longitude" size="10" maxlength="10" value=<%= request.getParameter("lng")%> />
  <input name="Address" type="text" id="Address" size="55" />
</div>
 
<div>
  <input type="button" value="Reverse Geocode" onClick="codeLatLng()">
  <br>
  <input type="submit" value="enter desc"name="submit" >
</div>
<div id="map_canvas" style="height: 90%; top:60px; border: 1px solid black;"></div>
  
</form>
</body>
</html>


