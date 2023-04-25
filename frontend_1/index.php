
           

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    
	<script src="assets/js/jquery-3.6.0.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <title><I>Gestor de Tareas</I></title>
</head>
<body>
    <?php
    $html = file_get_contents('components\navbar.php');
    echo $html;
    ?>
   
    <div class="row ">
        <div class="col  ">
        
        </div>
        <div class="col  ">
            <div class="card text-black ">
              <!-- <img class="card-img-top" src="assets\img\Sin-título-1.png" alt=""> -->
              <div class="card-body">
                <h4 class="card-title">Crear Tarea</h4>
                <form method="POST" action="controller/connect.php">>
                    <hr>    
                    <label for="">Titulo: </label>
                    <input type="text" name="title" id="title" >
                    <hr>
                    <label for="">Descripcion: </label>
                    <input type="text" name="description" id="description">
                    <hr>
                    <label for="">Fecha limite: </label>
                    <input type="date" name="date" id="date">
                    <hr>
                    <label for="">Asignacion: </label>
                    <select name="mySelect" id="mySelect">
                    <script type="text/javascript">
                        fetch('http://localhost:4000/idexud_Proyect/createTarea')
                        .then(response => response.text())
                        .then(data => {
                            const select = document.getElementById('mySelect');
                            const options = JSON.parse(data);
                            options.forEach(option => {
                            const optionElement = document.createElement('option');
                            optionElement.text = option;
                            select.add(optionElement);
                            });
                        });
                    </script>


                    </select>
                    <hr>
                    <button type="submit" class="btn btn-success" >Crear</button>
                    



                </form>
              </div>
            </div>
            
        
        </div>
        <div class="col  ">
            
        </div>
    </div>
   
</body>
</html>


<!-- feedback  -->
