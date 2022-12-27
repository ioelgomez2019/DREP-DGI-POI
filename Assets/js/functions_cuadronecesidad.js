var tableCuadrones;
document.addEventListener('DOMContentLoaded', function(){

    tableCuadrones = $('#tableCuadrones').dataTable( {
        "aProcessing":true,
        "aServerSide":true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Cuadronecesidad/getSelectcuanes",
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
    document.querySelector('#idCuadronecesidad').value ='';
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary");
    document.querySelector('#btnText').innerHTML ="Guardar";
    document.querySelector('#titleModal').innerHTML = "Nuevo Registro Ficha POI";
    document.querySelector("#formCuadronecesidad");
    $('#modalFormCuadronecesidad').modal('show');
}

$('#tableCuadrones').DataTable();
