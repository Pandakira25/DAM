<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modifica</title>
</head>
<body>
    <?php
    //nos conectamos
    include "indexConexion.php"; 
    //seleccionamos la base de datos con la que vamos a trbajar
    mysqli_select_db($conexion, "productosbd");
    //variable
    $modificarProducto = $_GET["id_producto"]; 
    $nombre = "YoNew";
    $descripcion = "Descripción Nueva"; 
    $precio = 1; 
    
    //escribimos la sentencia entre comillas simples para que trabaje bien con todo lo que sea String
    $modificar = "UPDATE productos SET nombre = '$nombre', descripcion = '$descripcion', precio = $precio WHERE id_producto = $modificarProducto "; 

    //ejecutar la sentencia
    mysqli_query($conexion, $modificar); 
    //se manda a header modifica
    header("Location: indexModificar.php");
  
    ?>
</body>
</html>