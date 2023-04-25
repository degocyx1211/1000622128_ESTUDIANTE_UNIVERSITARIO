
<?php 
$url = "http://localhost:4000/listTarea";
$data = file_get_contents($url);
$json = json_decode($data, true);
?>