<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/bootstrap.css">
    
	<script src="../assets/js/jquery-3.6.0.js"></script>
    <script src="../assets/js/bootstrap.js"></script>
    <title>Lista Tareas</title>
</head>
<body>
<?php
    $html = file_get_contents('..\components\navbar.php');
    echo $html;
    ?>

<div class="row ">
        <div class="col  "></div>
        <div class="col  ">
            <div class="card text-black ">
              <!-- <img class="card-img-top" src="assets\img\Sin-título-1.png" alt=""> -->
              <div class="card-body">
                <h4 class="card-title">Lista de tareas</h4>
                <table class="table">
<?php
// Hacer una solicitud GET a la API y obtener los datos en formato JSON
$url = "http://localhost:4000/listTarea";
$data = file_get_contents($url);
$json = json_decode($data, true);
?>        

  <thead>
    <tr>
    <th scope="col">Titulo</th>
    <th scope="col">Descripcion</th>
    <th scope="col">Fecha</th>
    <th scope="col">Usuario</th>
    <th scope="col">Estado</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($json as $item): ?>
        <tr>
       
        <td><?= $item['titulo'] ?></td>
        <td><?= $item['descripcion'] ?></td>
        <td><?= $item['fecha'] ?></td>
        <td><?= $item['usuario'] ?></td>
        <td><?= $item['estado'] ?></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>


              </div>
            </div>
            
        
        </div>
        <div class="col"></div>
    </div>





</body>
</html>