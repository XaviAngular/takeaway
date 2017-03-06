<?php
//Para comprobar si se recibe un post desde un ajax
if ($_SERVER['REQUEST_METHOD']==='GET'){	
	$sql = "SELECT a.id, a.nombre, a.descripcion, a.precio, b.nombre as nombreCat, a.foto, a.activado FROM platos a, categoria b where a.id_categoria=b.id";
	$sql_cats="SELECT * FROM categoria";
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');
	mysqli_set_charset($mysqli,"utf8");
	if ($mysqli) {
		$query=$mysqli->query($sql);
		$query_cats=$mysqli->query($sql_cats);
		$mysqli->close();
		$rows = $query->fetch_all(MYSQLI_ASSOC);
		$rowsCats = $query_cats->fetch_all(MYSQLI_ASSOC);		
		}
	if ($query) {
	echo json_encode([
		"query" 	=> $rows,
		"cats"		=> $rowsCats,
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