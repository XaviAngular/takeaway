<?php
//Para comprobar si se recibe un post desde un ajax
$data = array();
if ($_POST){
	$nombre=$_POST['nombre'];
	$precio=$_POST['precio'];
	$descripcion=$_POST['descripcion'];
	
	$activado=$_POST['activado'];
	$id_categoria=$_POST['id_categoria'];

//subida de archivos
if ($_FILES) {
		$files = array();
		$uploadDir= "../img/";

	foreach($_FILES as $file){
	if (move_uploaded_file($file['tmp_name'], "$uploadDir".basename($file['name'])))
	{
		$files[]= $uploadDir.$file['name'];
	}
	else {
		$files[]="no se ha subido archivo";
		}
	}
	$foto = "img/".$_POST['foto'];
	}
	else {
		$foto = $_POST['foto'];
	}
//fin subida archivos
	if (isset($_GET['update'])){
		$id=$_POST['idPlato'];
		$sql="UPDATE platos SET nombre='$nombre', precio='$precio',descripcion='$descripcion', foto='$foto', activado='$activado',id_categoria='$id_categoria' WHERE id=$id";
	}
	else {
		$sql = "INSERT INTO platos (nombre,precio,descripcion,foto,activado,id_categoria) VALUES ('$nombre','$precio','$descripcion','$foto','$activado','$id_categoria')";
	}
	
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');
	mysqli_set_charset($mysqli,"utf8");
	if ($mysqli) {
		$query=$mysqli->query($sql);
		$mysqli->close();
	}

	if ($query) {
	echo json_encode([
		"campos" 	=> "no hay",
		"error"		=> 0,
		"valores"	=> "no hay",
		"sql"		=> $sql,
		"resultado" => "se ha grabado"
		]);	
	}
	else {
		echo json_encode([
		"campos" 	=> "no hay",
		"error"		=> 1,
		"valores"	=> "no hay",
		"sql"		=> $sql,
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
?>