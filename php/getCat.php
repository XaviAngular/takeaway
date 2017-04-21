<?php
//Para comprobar si se recibe un post desde un ajax
if ($_SERVER['REQUEST_METHOD']==='GET'){	
	$id= $_GET['id'];
	$sql = "SELECT * FROM categoria WHERE id=$id";
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');
	mysqli_set_charset($mysqli,"utf8");
	if ($mysqli) {
		$query=$mysqli->query($sql);
		$mysqli->close();
		$rows = $query->fetch_all(MYSQLI_ASSOC);
			  		
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