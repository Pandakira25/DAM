<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejemplo 1 Formulario PHP</title>
</head>
<body>
    <h1>Ejemplo 1 formulario PHP</h1>
    <h3>muestra todos los datos recibidos en el fichero form.php (archivo desde el que gestionaré los datos) mediante el método POST</h3>
    <P>Primero: muestar un array con todos los datos recibidos</P>
    <p>Segundo: muestra los valores de los campos "nombre" y "email"</p>
    <br>
    <!--a ese fichero le vamos a mandar la información por eso ponemos post -->
    <!-- <form action="form.php" method="post">-->
     
    <form action="form.php" method="get">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre">
        <br>
        <label for="email">email:</label>
        <input type="text" id="email" name="email">
        <br>
        <input type="submit" name="btn_enviar" id="btn_enviar" value="Enviar">
    </form>

    <!-- Con Get en el formulario la información se manda de la siguiente manera
     <a href="form.php?nombre=Inma&email=inma@inma.com">Enviar Informacion</a> 
     -->
</body>
</html>

<!-- localhost/PruebasInmaPHP -->