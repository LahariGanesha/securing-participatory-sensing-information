
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
 <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
    
        function GetLocation() {
            var geocoder = new google.maps.Geocoder();
            var address = document.getElementById("txtAddress").value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    document.getElementById('latbox').value=latitude;
                    document.getElementById('lngbox').value=longitude;
                   // alert("Latitude: " + latitude + "\nLongitude: " + longitude);
                } else {
                    alert("Request failed.")
                }
            });
        };
        
    </script>
<body>
<form action="graph1.jsp">
    <textarea id="txtAddress" name="txtAddress" rows="3" cols="25"></textarea>
    <br/>
    <input type="button" onclick="GetLocation()" value="Get Location" />
    <input type="text" name="lngbox" id="lngbox" />
      <input type="text" name="latbox" id="latbox"/>
       <input type="submit" value="submit" name="submit" />
   
  
    </form>
</body>
</html>