<?php
$conexion = mysqli_connect("localhost:3307", "root", "", "productosbd"); 

if (!$conexion){
    die("Error de conexion".mysqli_connect_error()); 

}

//Se recoge el id desde la url
//vamos a buscar ese identificador
$id_producto = $_GET['id_producto']; 

//Se prepara la consulta
$sql = "SELECT fotografia FROM productos WHERE id_producto = ?"; 
$sentencia = mysqli_prepare($conexion, $sql); 

//comprobar que no falla la sentencia
if (!$sentencia){
    die ("Error al preparar la sentencia: " .mysqli_error($conexion)); 
}

//Bind para asociar los datos a la sentencia más el Execute para ejecutar la sentencia
//"i" tipo de dato entero
mysqli_stmt_bind_param($sentencia, "i", $id_producto); 
//ejecutar la sentencia
mysqli_stmt_execute($sentencia); 

//Obtener los resultados
//almacenar los resultados en la variable imagen (que se crea justo en ese momento)
//esto se hace para datos binario (imagen-video-sonido...)
mysqli_stmt_bind_result($sentencia, $imagen); 
//nºde registros que vamos a tener
mysqli_stmt_fetch($sentencia);

//avisar al navegador de que se trata de una imagen
header("Content-Type: image/jpeg"); 

//mostrar imagen
echo $imagen; 

//Se cierra la sentencia y la conexión 
mysqli_stmt_close($sentencia); 
?>