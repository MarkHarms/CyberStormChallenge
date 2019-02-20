<?php

	$redirect = true;
	#$redirect = false;

	session_start();

	if (!isset($_SESSION['username']))
		header("Location: ../LoginPage");


	$db = mysqli_connect('localhost', 'hsbuser', 'hsbpasswordisareallygoodpassword', 'hsbcyberstorm') or die('Error connecting to MySQL server.');

	$pageQuery = $db->prepare
	(
		"SELECT t.team_grade
		 FROM `hsbcyberstorm`.`teams` t
		 WHERE t.team_name=?"
	);
	$pageQuery->bind_param("s", $_SESSION['username']);
	$pageQuery->execute();
	$pageQuery->bind_result($grade);
	$pageQuery->fetch();
	$pageQuery->close();


	$directory = __DIR__;

	$loc = htmlentities($_SERVER["PHP_SELF"]);

	if ($redirect)
	{
		switch($grade)
		{
			case 'D':
				if (!stristr($loc, "Challenge1"))
					header("Location: $dir/446Challenge/Challenge1");
				break;
			case 'C':
				if (!stristr($loc, "Challenge2"))
					header("Location: $dir/446Challenge/Challenge2");
				break;
			case 'B':
				if (!stristr($loc, "Challenge3"))
					header("Location: $dir/446Challenge/Challenge3");
				break;
			case 'A':
				if (!stristr($loc, "GradePage"))
					header("Location: $dir/446Challenge/GradePage");
				break;
			default:
				header("Location: $dir/446Challenge/Challenge0");
		}
	}
?>
