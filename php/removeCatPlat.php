<?php
if ($_SERVER['REQUEST_METHOD']==='GET'){	
	$id=$_GET['id'];
	$tipo=$_GET['tipo'];
	
	$sql = "SELECT * FROM categoria";
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');
	mysqli_set_charset($mysqli,"utf8");
	if ($mysqli) {
		$query=$mysqli->query($sql);
		$mysqli->close();
		$rows = $query->fetch_all(MYSQLI_ASSOC);
		$array= Array();
	while ($row=$query->fetch_array(MYSQLI_ASSOC)){
		$array[] = $row;
	}   		
		}
	if ($query) {
	echo json_encode([
		"query" 	=> $rows,
		"error"		=> 0,	
		"resultado" => "se ha cargado"
		]);	
	}
	else {
		echo json_encode([
		"query" 	=> $query,
		"error"		=> 1,
		"resultado" => "NO se ha cargado!!"
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