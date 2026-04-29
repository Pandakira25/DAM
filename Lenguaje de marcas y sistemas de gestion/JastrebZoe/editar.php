<?php
include("conexion.php");
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar registro</title>
</head>
<body>
        <h1>Modificar Alumno Nº: <?php 
            include "conexion.php"; 
            mysqli_select_db($conexion, "universidad");
            $id = $_POST["id"];
            echo $id;?></h1>

        <form action="modificar.php" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="id" value="">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre" value="">
			<br><br>
            <label for="curso">Curso:</label>
            <input type="text" name="curso" id="curso" value="">
			<br><br>
            <label for="nota_media">Nota media:</label>
            <input type="number" name="nota_media" id="nota_media" value="" step="0.01">
			<br><br>
            <label for="faltas">Faltas:</label>
            <input type="number" name="faltas" id="faltas" value="" step="1">
			<br><br>
            <label for="id"></label>
            <input type="hidden" name="id" value="<?php echo $id;?>">
            
            <button type="submit">Actualizar</button>
			<br><br>
            <a href="index.php">Volver</a>
			<br><br>
        </form>
</body>
</html>
