<?php
if ($_SERVER['REQUEST_METHOD']==='GET'){	
	$id=$_GET['id'];
	$tipo=$_GET['tipo'];
	
	if($tipo=="cat"){
		$sql = "DELETE FROM categoria WHERE id=$id";
	}
	else {
		$sql = "DELETE FROM platos WHERE id=$id";
	}
	
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');
	mysqli_set_charset($mysqli,"utf8");
	if ($mysqli) {
		$query=$mysqli->query($sql);
		$mysqli->close();
		}
	if ($query) {
	echo json_encode([
		"error"		=> 0,	
		"resultado" => "se ha eliminado"
		]);	
	}
	else {
		echo json_encode([
		"error"		=> 1,
		"resultado" => "No se ha eliminado"
		]);	
	}
}
else {
echo json_encode([
		"query" => "KO",
		"error"		=> 1,
		"resultado"	=> "no hay"
	]);
}
?>