<?php
//Para comprobar si se recibe un post desde un ajax
if ($_SERVER['REQUEST_METHOD']==='POST'){
	//Para almacenar los datos JSON recibidos en una variable
	$request= file_get_contents('php://input');
	//Para convertir un Json en un array de php
	$datos = json_decode($request, true);
	
	
	$latitud=$datos["lat"];
	$longitud=$datos["lng"];
	
	
	$sqlPedido = "INSERT INTO geo (lat,lng) VALUES ($latitud,$longitud);";
	
	
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');

	mysqli_set_charset($mysqli,"utf8");
	if ($mysqli) {
		$query=$mysqli->query($sqlPedido);
		
		
	}
	
	
	
	if ($query) {		
	echo json_encode([
		"latitud" 	=> $latitud,
		"longitud"	=> $longitud,
		"resultado" => "se ha grabado"
		]);	
	}
	else {
		echo json_encode([
		"latitud" 	=> $latitud,
		"longitud"	=> $longitud,
		"resultado" => "se ha grabado"
		]);	
	}
}
else {
echo json_encode([
		"campos" => "KO",
		"error"		=> 1,
		"valores"	=> "no hay"
	]);

}
$mysqli->close();
?>