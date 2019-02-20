<?php
	include("../StatusCheck.php");
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
    #session_start();
    #$db = mysqli_connect('23.229.173.35','jsl039','Password','projectCSC446') or die('Error connecting to MySQL server.');
	
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
                <p>The School system has a vulnerable website that is unprotected against MySQL injection, oh no! There is a table inside with some encrypted passwords alongside the encryption method and the key used to encrypt them. However, the school is sloppy and left a bunch of junk tables and records laying around, you will have to sift through these. Once you find the passwords table you will need the alphabetic value of your team name, for example a team with the name ‘patience’ would have a value of ‘73’. Given this value and taking the mod of the number of records in the password table you can get the ID of the record that pertains to your team. You can then decrypt the password and use it to move forward. Good Luck!</p>
            </div>
            <div style="width:75%; margin:auto;">
            	<form method="get" style="text-align:center;"action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
               		<label id="passwordLbl">Query: </label>
                	<input type="text" name="userInput" value="">
                	<input type="submit" name="submit" value="Submit">  
            	</form>
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




<?php

if ($_SERVER["REQUEST_METHOD"] == "GET") 
{
	function query($connection, $variable) 
	{   
		$query = "SELECT * FROM `usertable` WHERE username='$variable'";
	

		#echo "<br>$query<br>";

		/* execute multi query */
		if ($connection->multi_query($query)) 
		{
			do 
			{
				#echo "<tr>";
				/* store first result set */
				if ($result = $connection->store_result()) 
				{
					while ($row = $result->fetch_row()) 
					{
						echo "<tr>";
						foreach ($row as $value)
						{
							echo "<td style='border:solid 1px;'>$value</td>";
						}
						echo "</tr>";
					}
					$result->free();
				}
				#echo "</tr>";

				/* print divider */
				if ($connection->more_results()) 
				{
					echo"<tr><td style='border:solid 1px;'>-</td></tr>";
				}
				else
				{
					return;
				}
			} while ($connection->next_result());
		}
	}

	

	$injectDB = mysqli_connect('localhost', 'injectionuser', 'injectionuser', 'injectiondb') or die('Could not connect to IDB');

	echo '<div style="position:absolute; top:250px; left:12%; height:400px; width:76%; margin:auto; text-align:center; overflow:auto;">';
	echo '<table style="width:50%; border: solid 1px; border-collapse:collapse; margin:auto;">';
	query($injectDB, $_GET['userInput']); 
  	echo '</table>';
	echo '</div>';
}
?>


