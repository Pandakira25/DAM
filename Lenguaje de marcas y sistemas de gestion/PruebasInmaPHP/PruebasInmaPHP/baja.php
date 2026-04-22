<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bajas</title>
</head>
<body>
    <?php
    include "indexConexion.php"; 
    mysqli_select_db($conexion, "productosbd");
    $eliminarProducto = $_GET["id_producto"]; 

    //comillas simples para que trabaje bien con todo lo que sea String
    $eliminar = "DELETE FROM productos WHERE id_producto = $eliminarProducto "; 

    mysqli_query($conexion, $eliminar); 
    //si no da error al eliminar me llevas a la página de la web que te indico
    //header("Location: https://universidadeuropea.com/"); 

    //si no da error al eliminar desaparece el elemento seleccionado
    header("Location: indexBajas.php");
    //Sin exit, php podría seguir ejecutando código después del header. 
        //La sentencia 'Exit' detiene la ejecución de PHP
        exit; 
    ?>
</body>
</html>