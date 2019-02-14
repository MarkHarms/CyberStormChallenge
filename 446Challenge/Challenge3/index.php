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
	
	$db = mysqli_connect('localhost','hsbuser','hsbpasswordisareallygoodpassword','hsbcyberstorm') or die('Error connecting to MySQL server.');
	echo "Test";
	 
	$query = $db->prepare
	(
	   "SELECT t.team_name,
			p.password
		FROM `hsbcyberstorm`.`challenge_passwords` p
			JOIN `hsbcyberstorm`.`teams` t ON (p.team_id=t.team_id)
		WHERE t.team_name=?
			AND p.challenge_id=3
			AND p.password=?"
	);
	// b = blob, d = double, i = int, s = string
	$query->bind_param("ss", $_SESSION['username'], $_POST['password']);
	$query->execute();
	$query->store_result();
	$rowcount = $query->num_rows;
	$query->close();
	 
	echo $rowcount;
	
	if ($rowcount == 1)                        
	{
		$newQuery = $db->prepare
		(
			"UPDATE `hsbcyberstorm`.`teams` 
			 SET `team_grade`='A' 
			 WHERE `team_name`=?;"
		);
		$newQuery->bind_param('s', $_SESSION['username']);
		$newQuery->execute();
		$numAffected = $newQuery->affected_rows;
		$newQuery->close();
		
		if ($numAffected == 1)
			header("Location: ../GradePage/");
		else
			echo "Update of grade failed! Team Name:{$_SESSION['username']} Num Affected:$numAffected";	
	}
	else
	{
		header("Location: index.php");
	}
}	
?>
		<pre id="fileDisplayArea"><pre>
        <div>
            <form id="passDiv" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
               <label id="passwordLbl">Password: </label>
                <input type="text" name="password" value="<?php echo $password;?>">
                <input type="submit" name="submit" value="Submit">  
              
            </form>
        </div>
            
    </body>
</html>