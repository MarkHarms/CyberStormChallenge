<?php
	include("../StatusCheck.php");
?>

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
#fileDisplayArea {
  margin-top: 2em;
  width: 100%;
  overflow-x: auto;
}
</style>
<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
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
		<pre id="fileDisplayArea"><pre>
        <div>
            <form id="passDiv" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
               <label id="passwordLbl">Password: </label>
                <input type="text" name="password" value="">
                <input type="submit" name="submit" value="Submit">  
              
            </form>
        </div>
            
    </body>
</html>
