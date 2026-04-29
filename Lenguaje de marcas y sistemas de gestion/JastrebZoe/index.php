<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de alumnos</title>
</head>
<body>
        <h1>Gestión de alumnos</h1>
        <?php 
            include "conexion.php";

            mysqli_select_db($conexion, "universidad");

            $consultar = "SELECT * from alumnos";

            $registros = mysqli_query($conexion, $consultar);
       ?> 
        <a href="crear.php">Nuevo registro</a>
		<br><br>
        <table border="2">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Curso</th>
                    <th>Nota media</th>
                    <th>Faltas</th>
                    <th>Fecha creación</th>
                    <th>Eliminar</th>
                    <th>Editar</th>
                </tr>
            </thead>
            
            <tbody>
                <?php 
                while($unRegistro=mysqli_fetch_row($registros)){
                ?>
                <tr>
                    <td><?php echo $unRegistro[0];?></td>
                    <td><?php echo $unRegistro[1];?></td>
                    <td><?php echo $unRegistro[2];?></td>
                    <td><?php echo $unRegistro[3];?></td>
                    <td><?php echo $unRegistro[4];?></td>
                    <td><?php echo $unRegistro[5];?></td>
                    <td><form method="post" action="baja.php" >
                        <input type="hidden" name="id" value="<?php echo $unRegistro[0]; ?>">
                        <button type="submit">ELIMINAR</button>
                    </form></td>
                    <td><form method="post" action="editar.php" >
                        <input type="hidden" name="id" value="<?php echo $unRegistro[0]; ?>">
                        <button type="submit">Editar</button>
                    </form></td>
                </tr>
                <?php 
                    }
                ?>
            </tbody>
        </table>
</body>
</html>
<?php
    $conexion->close();
?>