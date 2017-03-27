<?php
//Para comprobar si se recibe un post desde un ajax
if ($_SERVER['REQUEST_METHOD']==='POST'){
	//Para almacenar los datos JSON recibidos en una variable
	$request= file_get_contents('php://input');
	//Para convertir un Json en un array de php
	$datos = json_decode($request, true);
	$ids='';
	$cantidades="";
	$importe=0;
	
	foreach ($datos as $value){
	$ids .= $value['id'].',';
	$cantidades.= $value['cantidad'].',';
	$importe=$importe+$value['precio']*$value['cantidad'];
	}

	$ids = substr($ids,0, -1);
	$cantidades = substr($cantidades,0, -1);
	$sqlPedido = "INSERT INTO pedidos (id_cliente,importe) VALUES (1,200);";
	
	$sql = "INSERT INTO detalle_pedido (id_plato,cantidad,id_pedido) VALUES ('$ids','$cantidades'); SELECT_LAST_INSERT_ID()";
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');

	mysqli_set_charset($mysqli,"utf8");
	if ($mysqli) {
		$query=$mysqli->query($sqlPedido);
		$lastID=$mysqli->insert_id;				
	}

	if ($query) {		
	echo json_encode([
		"ids" 	=> $ids,
		"error"		=> 0,
		"sqlpedido"	=> $sqlPedido,
		"lastid"		=> $lastID,
		"resultado" => "se ha grabado"
		]);	
	}
	else {
		$lastID="No se encuentra último id";
		echo json_encode([
		"ids" 	=> $ids,
		"error"		=> 0,
		"sqlpedido"	=> $sqlPedido,
		"sql"		=> $lastID,
		"resultado" => "NO se ha grabado!!"
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