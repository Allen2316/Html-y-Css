<?php
include("database.php");
if (isset($_POST["id"])) {
    $id = $_POST["id"];
    $query = "SELECT * FROM tareas WHERE id = $id";
    $result = mysqli_query($conexion, $query);
    if (!$result) {
        die("Fallo consulta edicion");
    }

    $json = array();
    while ($row = mysqli_fetch_array($result)) {
        $json[] = array(
            "nombre" => $row["nombre"],
            "descripcion" => $row["descripcion"],
            "id" => $row["id"]
        );
    }
}
$jsonstring = json_encode($json[0]);
echo $jsonstring;
