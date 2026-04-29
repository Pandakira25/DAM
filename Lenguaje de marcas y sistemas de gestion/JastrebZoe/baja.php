<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bajas</title>
</head>
<body>
    <?php
        include "conexion.php"; 
        mysqli_select_db($conexion, "universidad");
        $eliminar = $_POST["id"]; 

        $eliminar = "DELETE FROM alumnos WHERE id = $eliminar "; 

        mysqli_query($conexion, $eliminar); 

        header("Location: index.php");
            exit; 
    ?>
</body>
</html>