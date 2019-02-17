<?php
	//include("../StatusCheck.php");
?>
<!DOCTYPE html>
     <header>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<title>Challenge 2</title>
        <link rel="stylesheet" type="text/css" href="Challenge3.css">	
    </header>
    <body>

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
			AND p.challenge_id=3
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
		echo "Incorrect Password!";	
	}
}	
?>
        <div id="titleDiv">
            <label id="pageTitle">Challenge Number 3</label>
            <button onclick="location.href='../GradePage/';" id="gradesBtn">See Grades</button>
        </div>
        <div>
            <div style="width:75%; margin:auto; text-align:center">
                <p>Your teacher has been working on a brand new programming language that he believes will take over the computer science industry. Unlike difficult languages such as Python or Java, this language is simple, and only contains 7 symbols, “+”, “-”, “<”, “>”, “.”, “[“, “]”. These seven commands can be used to encode/decode strings to hide passwords. He began work on this language, and built an encoder. He has sucessfully built an encoder for strings, but needs help finishing the decoder. He has set up a socket server on IP port **** to broadcast messages to clients. Access the python script provided to make a connection to the server and receive his message. You will have to uncomment the method call to the decoder, to get the actual password to this challenge provided by your interpreter you implement. The only changes needed will be apparent in the method being called. The code for “[“ and “]”, or the loop logic has already been added, you only need to implement the rest of the commands.</p>
            </div>
            <div style="width:55%; margin:auto;">
                <li>The program will iterate over an array and make changes to the array as It reads input.</li>
                <li>If the intrepertor reads a “+” then the value at the current pointer index Needs to be incremented by 1. </li>
                <li>If the intrepertor reads a “-”, the value at pointer needs to be decremented by 1.</li>
                <li>If the intrepertor reads a “>”, you need to move the pointer one index position to the right.</li>
                <li>If the intrepertor reads a “<”, you need to move the pointer one index position to the left.</li>
                <li>If the intrepertor reads a “.”, then the changes are finished for that value at index and it can be added to the final output</li>
            </div>
            </br></br>
            <div style="width:75%; margin:auto; text-align:center">
                <p>Be careful, the password will be changed every 5 minutes, so its best to write a program instead of doing it by hand.</p>
                <p><a target="_blank" href="client-student.py">Download the template!</a></p>
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
