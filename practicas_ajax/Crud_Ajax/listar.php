<?php
include("database.php");

$query = "SELECT * FROM tareas";

$result = mysqli_query($conexion, $query);

if (!$result) {
    die("Fallo la consulta Listar") . mysqli_error($conexion);
}

$json = array();
while ($row = mysqli_fetch_array($result)) {
    $json[] = array(
        "nombre" => $row["nombre"],
        "descripcion" => $row["descripcion"],
        "id" => $row["id"]
    );
}
$jsonstring = json_encode($json);
echo $jsonstring;