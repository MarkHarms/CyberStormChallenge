<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body> 
<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
	echo "Test";
	session_start();
	
	$db = mysqli_connect('localhost','hsbuser','hsbpasswordisareallygoodpassword','hsbcyberstorm') or die('Error connecting to MySQL server.');
	echo "Test";
	 
	$query = $db->prepare
	(
	   "SELECT t.team_name
		FROM `hsbcyberstorm`.`teams` t
		WHERE t.team_name=?"
	);
	// b = blob, d = double, i = int, s = string
	$query->bind_param("s", $_POST['username']);
	$query->execute();
	$query->store_result();
	$rowcount = $query->num_rows;
	$query->close();
	 
	echo $rowcount;
	
	if ($rowcount == 1) 
	{
		$_SESSION['username'] = $_POST['username'];
		
		$newQuery = $db->prepare
		(
			"UPDATE `hsbcyberstorm`.`teams` 
			 SET `team_grade`='D' 
			 WHERE `team_name`=?;"
		);
		$newQuery->bind_param('s', $_SESSION['username']);
		$newQuery->execute();
		$numAffected = $newQuery->affected_rows;
		$newQuery->close();
		
		if ($numAffected == 1)
			header("Location: ../Challenge1/");
		else
			echo "Update of grade failed! Team Name:{$_SESSION['username']} Num Affected:$numAffected";	
	}
	else
	{
		//header("Location: index.php");
	}
}	
?>

<h2>Login Challenge</h2>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  

  Username: <input type="text" name="username" value="<?php echo $username;?>">
  
  <input type="submit" name="submit" value="Submit">  
</form>
</body>
</html>