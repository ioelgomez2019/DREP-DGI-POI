var tableActividad;
document.addEventListener('DOMContentLoaded', function(){

    tableActividad = $('#tableActividad').dataTable( {
        "aProcessing":true,
        "aServerSide":true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Actividadestrategica/getSelectactest",
            "dataSrc":""
        },
        "columns":[
            {"data":"idregistro"},
            {"data":"idregistro"},
            {"data":"objestrinst"},
            {"data":"accestrinst"},
            {"data":"nombre_act"},
            {"data":"desc_act_ope"},
            {"data":"responsable"},
            {"data":"options"}
        ],
        "resonsieve":"true",
        "bDestroy": true,
        "iDisplayLength": 10,
        "order":[[0,"desc"]]  
    });
});
function openModal()
{
    document.querySelector('#idActividadestrategica').value ='';
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary");
    document.querySelector('#btnText').innerHTML ="Guardar";
    document.querySelector('#titleModal').innerHTML = "Nuevo Registro De Actividad Estrategica";
    document.querySelector("#formActividadestrategica");
    $('#modalFormActividadestrategica').modal('show');
}

$('#tableActividad').DataTable();
function openModalcua()
{
    document.querySelector('#idCuadronecesidad').value ='';
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary");
    document.querySelector('#btnText').innerHTML ="Guardar";
    document.querySelector('#titleModal').innerHTML = "Bienvenido a la tienda de la DREP";
    document.querySelector("#formCuadronecesidad");
    $('#modalFormCuadronecesidad').modal('show');
}


