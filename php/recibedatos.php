<?php
echo "<h1>Hola, aquí llegará el form</h1>";
if ($_POST) {
	echo "LLegan variables por post:<br>";
	echo $_POST['nombreApellido'];
	echo "<br>";
	echo $_POST['email'];
	echo "<br>";
	echo $_POST['mensaje'];
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');
	if ($mysqli){
		$sql="";
	}
	$mysqli->close();
}
	
else {
	echo "No llega nada por post";
}
?>