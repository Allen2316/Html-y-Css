$(function () {
    let modificar = false;
    obetenerTareas();
    $("#task-form").submit(function (e) {
        const datos = {
            name: $("#name").val(),
            description: $("#description").val(),
            id: $("#taskId").val()
        };

        let url = modificar === false ? "insertar.php" : "modificar.php";
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
        $.post("getTareas.php", { id },
            function (response) {
                console.log(response);
                const task = JSON.parse(response);
                $("#name").val(task.nombre);
                $("#description").val(task.descripcion);
                $("#taskId").val(task.id);
                modificar = true;
            },
        );
    });
});
