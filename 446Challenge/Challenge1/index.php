<?php
//	require "../StatusCheck.php";
?>
<!DOCTYPE html>
    <header>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<title>Challenge 1</title>
        <link rel="stylesheet" type="text/css" href="Challenge1.css">
    </header>
    <body>
        <style>
            #mapdiv {
                width:800px;
                height:600px;
            }
            #fileDisplayArea {
              margin-top: 2em;
              width: 100%;
              overflow-x: auto;
            }
        </style>
        <?php

if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    session_start();
    $db = mysqli_connect('23.229.173.35','jsl039','Password','projectCSC446') or die('Error connecting to MySQL server.');
	$query = $db->prepare
	(
	   "SELECT t.team_name,
			p.password
		FROM `challenge_passwords` p
			JOIN `teams` t ON (p.team_id=t.team_id)
		WHERE t.team_name=?
			AND p.challenge_id=1
			AND p.password=?"
	);
	// b = blob, d = double, i = int, s = string
	$query->bind_param("ss", $_SESSION['username'], $_POST['password']);
	$query->execute();
	$query->store_result();
	$rowcount = $query->num_rows;
	$query->close();
	
	if ($rowcount == 1) 
	{
		$newQuery = $db->prepare
		(
			"UPDATE `teams` 
			 SET `team_grade`='C' 
			 WHERE `team_name`=?;"
		);
		$newQuery->bind_param('s', $_SESSION['username']);
		$newQuery->execute();
		$numAffected = $newQuery->affected_rows;
		$newQuery->close();
		
		if ($numAffected == 1)
			header("Location: ../Challenge2/");
		else
			echo "Update of grade failed! Team Name:{$_SESSION['username']} Num Affected:$numAffected";	
	}
	else
	{
		echo "Incorrect Password!";
	}
}	
?>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/openlayers/2.13.1/OpenLayers.js"></script>
<script type="text/javascript">
     var map, basemap, markers;
    $(document).ready(function () {
        init_map();
        var fileInput = document.getElementById('fileInput');
		var fileDisplayArea = document.getElementById('fileDisplayArea');
		
		fileInput.addEventListener('change', function(e) {
			var file = fileInput.files[0];
			var textType = /text.*/;

			if (file.type.match(textType)) {
				var reader = new FileReader();

				reader.onload = function(e) {
					var fileOutput = reader.result;
					var fileSplitOutput = fileOutput.split('\n');
					var arrayLength = fileSplitOutput.length;
                    for (var i = 0; i < arrayLength; i++) {
                        var partsOfStr = fileSplitOutput[i].split(',');
                        console.log(partsOfStr);
                        add_marker(partsOfStr[1],partsOfStr[0], partsOfStr[3], partsOfStr[2]);
                    }
				}

				reader.readAsText(file);	
			} else {
				fileDisplayArea.innerText = "File not supported!"
			}
		});
		
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
            <label id="pageTitle">Challenge Number 1</label>
            <button onclick="location.href='../GradePage/';" id="gradesBtn">See Grades</button>
        </div>
        <div>
            <div style="width:75%; margin:auto; text-align:center">
                <p >Your teacher is investigating the path of alien space ships spotted off the coast of New York, marking the coordinates for the beginning and end of each of their flights. He has created a map to help him draw out the paths, but needs help deciphering the message. He is currently broadcasting them through packets on this network. Unfortunately, government agencies are actively broadcasting fake coordinates to throw you off track and keep alien activity a secret, so it might be beneficial to sniff for this Veginere cyphered source destination: zsh qhxc tvuu chvKabxihj ohu wkb tvuu nyir zki yxtrlvg key: <a target="_blank" href="fruit.jpg"> The name of this fruit.</a> Perhaps a reverse image search would be helpful if you arent a fruit connoisseur. Be prepared, you might be standing on your head before the final password for this challenge becomes clear.</p>
            </div>
            <div id="mapdiv" style="margin:auto !important;"></div>
            </br></br>
        	<div style="text-align:center">
                <div id="inputForm">
                    <p>Enter Coordinates in the box below. Follow the given example format!</p>
                    <p>In this example, a line is drawn from start of 40.71012, -74.01636 to finish 40.7128, -72.0060</p>
                  Coordinates:<input id="latitude1" size="35" type="text" value="40.71012, -74.01636, 40.7128, -72.0060"/>
                  <input id="btn_addmarker" type="button" value="Add Marker" />
                </div>
           
            <br/>
                <div>
        			Alternatively, upload a Text file of coordinates separated by new lines!  
        			<input type="file" id="fileInput">
        		</div>
        	</div>
        </div>
         </br>
        
        <form id="passDiv" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
               <label id="passwordLbl">Password: </label>
                <input type="text" name="password" value="">
                <input type="submit" name="submit" value="Submit">  
            </form>
    </body>
<html>
