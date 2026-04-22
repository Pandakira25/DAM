<!-- Mezclamos los dos (php y html) porque con html va a quedar más "bonito" -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Listar</title>
</head>
<body>
    <?php
    //se incluye la conexión a la BD
    include "indexConexion.php"; 

    //se selecciona la BD de trabajo
    mysqli_select_db($conexion, "productosbd"); 
    
    //selecionar todos los registros de la tabla productos 
    $consultar = "SELECT * FROM productos"; 
    
    //se ejectua la sentancia y se almacenan todos los registros en una variable ($registros")
    $registros = mysqli_query($conexion, $consultar); 
    ?>

    <!-- volvemos a html para crear la tabla "bonita" -->
     <table border="2">
        <thead>
            <tr>
                <th>id</th>
                <th>nombre</th>
                <th>descripcion</th>
                <th>precio</th>
                <th>fotografia</th>
            </tr>
        </thead>
        <tbody>
            <?php
            //recorrer los registros $registros uno a uno hasta que no haya más y se van almacenando en el array $unRegistro, para eso regreso a php
            while ($unRegistro=mysqli_fetch_row($registros)) {
                ?>
            <!-- volvemos a html para crear las columnas y cerraremos el bucle en el próximo php-->
            <!-- se irá saltando constantemente de html a php para combinar datos y formato... -->
            <tr>
                <td><?php echo $unRegistro[0];?></td>
                <td><?php echo $unRegistro[1];?></td>
                <td><?php echo $unRegistro[2];?></td>
                <td><?php echo $unRegistro[3];?></td>
                <!-- <td><?php echo $unRegistro[4];?></td> -->
                <!-- al ser una imagen se muestra del siguiente modo -->
                <!-- <td> <img src="data:image/jpg;base64, <?php echo base64_encode ($unRegistro[4]);?>" width="75" height="50"> </td> -->
                 <td><img src="verFoto.php?id_producto=<?php echo $unRegistro[0];?>" alt=""></td>
            </tr>    
            <?php
            //fin del bucle while        
            }
            ?>
        </tbody>
     </table>

</body>
</html>