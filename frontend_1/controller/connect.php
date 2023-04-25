<?php
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // el formulario ha sido enviado con el método POST
    $title = $_POST['title'];
    $description = $_POST['description'];
    $date = $_POST['date'];
    $mySelect = $_POST['mySelect'];
    $datos = array('title' => $title, 'description' => $description, 'date' => $date,'mySelect' => $mySelect);
      // URL de destino
    $url = 'http://localhost:4000/idexud_Proyect/createTarea';
    $options = array(
        'http' => array(
            'method'  => 'POST',
            'header'  => 'Content-type: application/json',
            'content' => json_encode($datos)
        )
    );
    $context  = stream_context_create($options);
    $response = file_get_contents($url, false, $context);
    $response_data = json_decode($response, true);
    
    header('Location: http://localhost/idexud_Proyect/view/lista.php');
    exit;
} else {
    header('Location:  http://localhost/idexud_Proyect/view/index.php');
    exit;
}


?>
