<?php
//Se comprueba que llegan datos por método POST
if ($_POST) {	
	$email = $_POST['email'];	
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');
	mysqli_set_charset($mysqli,"utf8");
	if ($mysqli){
		$sql="INSERT INTO newsletter (email) VALUES ('$email');";
		$query=$mysqli->query($sql);
		if ($query) {
			echo "Se ha grabado correctamente la información";
		}
		else 
		{
			echo "Ha habido un problema con el registro del formulario";
		}
		$mysqli->close();
	}
}
else {
	echo "No llega nada por post";
}
?>