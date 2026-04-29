<?php 
    include 'conexion.php';

    $nombre = $_POST['nombre'];
    $curso = $_POST['curso'];
    $nota_media = $_POST['nota_media'];
    $faltas = $_POST['faltas'];

    $sql = "INSERT INTO alumnos (nombre, curso, nota_media, faltas) VALUES ('$nombre', '$curso', '$nota_media', '$faltas')";

    mysqli_query($conexion, $sql);

    header("Location: index.php");
            exit; 
?>