<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Crear registro</title>
</head>
<body>
        <h1>Nuevo registro</h1>

        <form action="guardar.php" method="POST" enctype="multipart/form-data">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre">
			<br><br>
            <label for="curso">Curso:</label>
            <input type="text" name="curso" id="curso">
			<br><br>
            <label for="nota_media">Nota media:</label>
            <input type="number" name="nota_media" id="nota_media" step="0.01">
			<br><br>
            <label for="faltas">Faltas:</label>
            <input type="number" name="faltas" id="faltas" step="1">
			<br><br>
            <button type="submit">Guardar</button>
			<br><br>
            <a href="index.php">Volver</a>
        </form>
    </div>
</body>
</html>
