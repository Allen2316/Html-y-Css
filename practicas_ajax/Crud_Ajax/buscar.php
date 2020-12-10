<?php
include("database.php");

$search = $_POST["search"];

if (!empty($search)) {
    $query = "SELECT * FROM tareas WHERE nombre LIKE '$search%'";
    $resultado = mysqli_query($conexion, $query);
    if (!$resultado) {
        die("Consultar buscar falló");
    }

    $json = array();
    while ($row = mysqli_fetch_array($resultado)) {
        $json[] = array(
            "nombre" => $row["nombre"],
            "descripcion" => $row["descripcion"],
            "id" => $row["id"]
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
