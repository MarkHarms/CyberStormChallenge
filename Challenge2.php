<!DOCTYPE html>
<html>
    <header>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<title>OpenLayers - User input to create marker</title>
        <link rel="stylesheet" type="text/css" href="Challenge2.css">	
    </header>
    <body>
        
	<style>
#mapdiv {
    width:800px;
    height:600px;
}
</style>
<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
	echo "Test";
	session_start();
 	echo $_SESSION['username'];
	if(!isset($_SESSION['username'])){
		header("Location: userlogin.php");
		
	}
	
	$db = mysqli_connect('23.229.173.35','jsl039','Password','projectCSC446')
	 or die('Error connecting to MySQL server.');
	 echo "Test";
	$login = mysqli_query($db,"select * from challengeTable where (Challenge= 1) and (Password = '" . $_POST['password'] . "')");
	$rowcount = mysqli_num_rows($login);
	echo $rowcount;
	if ($rowcount == 1) {
	mysqli_query($db,"Update userloginTable Set Grade = 'C' Where Username = '".$_SESSION['username']."'");
	header("Location: Challenge3.php");
	}
	else
	{
	header("Location: Challenge2.php");
	}
}	
?>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/openlayers/2.13.1/OpenLayers.js"></script>
<script type="text/javascript">
     var map, basemap, markers;
    $(document).ready(function () {
        init_map();
        
        $("#btn_addmarker").on("click", function () {
            var partsOfStr = $("#latitude1").val().split(',');
            console.log(partsOfStr);
           /* var lon1 = $("#latitude1").val();
            var lat1 = $("#longitude1").val();
            var lon2 = $("#latitude2").val();
            var lat2 = $("#longitude2").val();*/
            add_marker(partsOfStr[1],partsOfStr[0], partsOfStr[3], partsOfStr[2]);
        });
    });

    function init_map() {
        map = new OpenLayers.Map("mapdiv",{numZoomLevels: 10,
    projection: new OpenLayers.Projection("EPSG:900913"),
    displayProjection: new OpenLayers.Projection("EPSG: 4326")});
        var ol = new OpenLayers.Layer.OSM();
        map.addLayers([ol]);
        map.setCenter(new OpenLayers.LonLat(-74.01636,40.71012).transform(
                new OpenLayers.Projection("EPSG:4326"),
                map.getProjectionObject()), 15);
    }

    function add_marker(latitude1, longitude1,latitude2, longitude2) {
        var start_point = new OpenLayers.Geometry.Point(latitude1,longitude1);
        var end_point = new OpenLayers.Geometry.Point(latitude2,longitude2);
        
        var vector = new OpenLayers.Layer.Vector();
        vector.addFeatures([new OpenLayers.Feature.Vector(new OpenLayers.Geometry.LineString([start_point, end_point]).transform(new OpenLayers.Projection("EPSG:4326"), new OpenLayers.Projection("EPSG:900913")))]);
        map.addLayers([vector]);
        map.setCenter(new OpenLayers.LonLat(latitude1,longitude1).transform(
                new OpenLayers.Projection("EPSG:4326"),
                map.getProjectionObject()), 15);
        //console.log(latitude + ", " + longitude);
    }
</script>
        <div id="titleDiv">
            <label id="pageTitle">Challenge Number 2</label>
            <button onclick="location.href='gradechecker.php';" id="gradesBtn">See Grades</button>
        </div>
        <div>
    		<div id="mapdiv"></div>
            <div id="inputForm">
                <p>Enter Coordinates in the box below. Follow the given example format!</p>
                <p>In this example, a line is drawn from start of 40.71012, -74.01636 to finish 40.7128, -72.0060</p>
              Coordinates:<input id="latitude1" size="35" type="text" value="40.71012, -74.01636, 40.7128, -72.0060"/>
             <!-- Longitude 1:
              <input id="longitude1" type="text" value="-74.01636"/>
              Latitude 2:
              <input id="latitude2" type="text" value="40.7128"/>
              Longitude 2:
              <input id="longitude2" type="text" value="-72.0060"/> -->
              <input id="btn_addmarker" type="button" value="Add Marker" />
            </div>
        </div>
        <div>
            <form id="passDiv" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
               <label id="passwordLbl">Password: </label>
                <input type="text" name="password" value="<?php echo $password;?>">
                <input type="submit" name="submit" value="Submit">  
              
            </form>
            <div>
                <label id="wrongPass">*Incorrect Password</label>
            </div>
        </div>
            
    </body>
</html>