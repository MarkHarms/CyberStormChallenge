<?php
//Step1
	session_start();
	if(!isset($_SESSION['username'])){
		header("Location: userlogin.php");
		}
		
 $db = mysqli_connect('23.229.173.35','jsl039','Password','projectCSC446')
 or die('Error connecting to MySQL server.');
?>

<html>
 <header>
 <link rel="stylesheet" type="text/css" href="GradePage.css">
 </header>
 <body>
 
	<div style="margin-top: 20px; margin-bottom: 50px;">
            <center><label id="pageTitle">Grade Report</label></center>
        </div>
 
 <div>
<table id="gradeTable">
            <tr>
                <th>Team Name</th>
                <th>Grade</th>
            </tr>

<?php

//Step2
$query = "SELECT team_name,team_grade from teams;";
mysqli_query($db, $query) or die('Error querying database.');

//Step3
$result = mysqli_query($db, $query);

while ($row = mysqli_fetch_array($result)) {
   //echo "Name:".$row{'TeamName'}." Grade:".$row{'Grade'}."<br>";
   echo "<tr>";
                   echo "<td>".$row[team_name]."</td>";
                   echo '<td class="gradeColumn">'.$row[team_grade].'</td>';
                   echo "</tr>";
}

//Step 4
mysqli_close($db);
?>

</table>
</div>
</body>
</html>