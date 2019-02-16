<?php
	//include("../StatusCheck.php");
?>
<!DOCTYPE html>
     <header>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<title>Challenge 2</title>
        <link rel="stylesheet" type="text/css" href="Challenge2.css">	
    </header>
    <body>
        
        <style>
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
			AND p.challenge_id=2
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
			 SET `team_grade`='B' 
			 WHERE `team_name`=?;"
		);
		$newQuery->bind_param('s', $_SESSION['username']);
		$newQuery->execute();
		$numAffected = $newQuery->affected_rows;
		$newQuery->close();
		
		if ($numAffected == 1)
			header("Location: ../Challenge3/");
		else
			echo "Update of grade failed! Team Name:{$_SESSION['username']} Num Affected:$numAffected";	
	}
	else
	{
		echo "Incorrect Password!";	
	}
}	
?>
        <div id="titleDiv">
            <label id="pageTitle">Challenge Number 2</label>
            <button onclick="location.href='../GradePage/';" id="gradesBtn">See Grades</button>
        </div>
        <div>
            <div style="width:75%; margin:auto; text-align:center">
                <p>Put challenge info here.</p>
            </div>
            <div>
                <pre id="fileDisplayArea"><pre>
            </div>
        </div>
        <div id="passDiv">
            <form id="passDiv" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
               <label id="passwordLbl">Password: </label>
                <input type="text" name="password" value="">
                <input type="submit" name="submit" value="Submit">  
            </form>
        </div>
    </body>
<html>