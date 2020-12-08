$(function () {
    let variable = false;
    obetenerTareas();            

    $("#task-form").submit(function (e) {
        const datos = {
            name: $("#name").val(),
            description: $("#description").val(),
            id: $("#taskId").val()
        };

        let url = variable === false ? "insertar.php" : "modificar.php";        
        $.post(url, datos, function (response) {
            console.log(response);
            obetenerTareas();
            $("#task-form").trigger("reset");
        });
        e.preventDefault();
    });

    function obetenerTareas() {
        $.ajax({
            type: "GET",
            url: "listar.php",
            success: function (response) {
                let tasks = JSON.parse(response);
                let template = "";
                tasks.forEach(tarea => {
                    template += `
                    <tr taskId="${tarea.id}">
                        <td>${tarea.id}</td>
                        <td>
                            <a href="#" class="task-item" title="Pulsar para editar">${tarea.nombre}</a>
                        </td>
                        <td>${tarea.descripcion}</td>
                        <td>
                            <button class="task-delete btn btn-danger">
                                Eliminar
                            </button>
                        </td>
                    </tr>`
                });
                $("#tasks").html(template);
            }
        });
    }


    $(document).on("click", ".task-item", function () {
        let element = $(this)[0].parentElement.parentElement;
        let id = $(element).attr("taskId");
        console.log(id);
    }); 
});
