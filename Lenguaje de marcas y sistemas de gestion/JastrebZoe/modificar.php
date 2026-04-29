<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modifica</title>
</head>
<body>
    <?php
    include "conexion.php"; 
    mysqli_select_db($conexion, "universidad");
    
    $id = $_POST['id'];
    $nombre = $_POST['nombre'];
    $curso = $_POST['curso'];
    $nota_media = $_POST['nota_media'];
    $faltas = $_POST['faltas'];
    
    $modificar = "UPDATE alumnos SET nombre = '$nombre', curso = '$curso', nota_media = '$nota_media', faltas = '$faltas' WHERE id = '$id' "; 

    //ejecutar la sentencia
    mysqli_query($conexion, $modificar); 

    header("Location: index.php");
  
    ?>
</body>
</html>