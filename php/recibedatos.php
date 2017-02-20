<?php
echo "<h1>Hola, aquí llegará el form</h1>";
if ($_POST) {
	echo "LLegan variables por post:<br>";
	echo $_POST['nombreApellido'];
	echo "<br>";
	echo $_POST['email'];
	}
else {
	echo "No llega nada por post";
}
?>