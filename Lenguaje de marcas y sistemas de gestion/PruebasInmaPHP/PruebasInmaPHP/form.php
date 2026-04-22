<?php //obligatorio abrirlo pero no cerrarlo siempre y cuando sea el único php en la página
    echo "<pre>"; //para mostrar la información preformateada

    //para los comentarios dos barras
    /* para los comentarios
    de más de una línea
    */

    //MUESTRA EL ARRAY CON TODA LA INFORMACIÓN RECIBIDA
    //Variables nada de números y cuidado que es case sensitive, van en minúsculas y como mucho con _
    //print_r para que la informción que veamos sea legible por nosotros
    //print_r($_POST);
    print_r($_GET); 

    //Asignar el valor de cada campo a una variable diferente
    //Las variables empiezan por $
    //$nombre = $_POST['nombre'];
    //$email = $_POST['email'];

    //AHORA VAMOS A UTILIZAR EL MÉTODO GET PARA MANDAR LA INFORMACIÓN
    //La información se almacena en un array $_GET & $_POST a los que se puede acceder o por su índice [0] [1] (array indexados) o por su nombre (array asocitavos)
    //con $lo que se hace declarar la varible
    $nombre = $_GET['nombre'];
    $email = $_GET['email'];

    //Mostrar el valor de cada campo
    echo 'nombre: ' . $nombre . '<br>';  //para concatenar se una . en lugar de +
    echo "email: $email <br>"; //podemos usar comillas dobles o simples, con las dobles ponemos la variable y la sustituye por su valor con las simples no sustituye el valor