<?php
// You need to add server side validation and better error handling here

$data = array();

$nombre = $_POST['nombre'];
$desc = $_POST['descripcion'];
$foto = "img/cats/".$_POST['foto'];

//comprobar si es un update
if(isset($_GET['update'])){
	$id= $_POST['id'];
	$sql = "UPDATE categoria SET nombre='$nombre', descripcion='$desc',foto='$foto' WHERE id=$id";
}
else {$sql = "INSERT INTO categoria (nombre,descripcion,foto) VALUES ('$nombre','$desc','$foto')";}


$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');
mysqli_set_charset($mysqli,"utf8");
if ($mysqli) {
	$query=$mysqli->query($sql);
	$mysqli->close();
	($query) ? $datos="se ha grabado" : $datos="no se ha grabado";
}


if(isset($_GET['files']))
{  
    $error = false;
    $files = array();
    if ($_FILES) $lleganFiles="Llegan files"; else $lleganFiles="No llegan files";
    $uploaddir = '../img/cats/';
    foreach($_FILES as $file)
    {
        if(move_uploaded_file($file['tmp_name'], "$uploaddir".basename($file['name'])))
        {
            $files[] = $uploaddir .$file['name'];
        }
        else
        {
            $error = true;
        }
    }
    $data = ($error) ? array('error' => $lleganFiles) : array('files' => $datos, 'llega' => $sql);
}
else
{
    $data = array('success' => $lleganFiles, 'formData' => $_POST);
}





echo json_encode($data);
?>