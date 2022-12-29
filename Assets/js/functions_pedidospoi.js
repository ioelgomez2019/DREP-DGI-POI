var tableRegistropoi;
let rowTable = "";
document.addEventListener('DOMContentLoaded', function () {

    tableRegistropoi = $('#tableRegistropoi').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax": {
            "url": " " + base_url + "/Pedidospoi/getSelectregistrop",
            "dataSrc": ""
        },
      //  registropoi.idregistro, 
        //            registropoi.centrocosto, 
           //         registropoi.objestrinst, 
            //        registropoi.indicadoroe, 
              //      registropoi.accestrinst, 
                //    registropoi.indicadorae, 
                 //   actividad.nombre_act, 
                  //  actividad.desc_act_ope, 
                   // actividad.responsable
        "columns": [
            { "data": "idregistro" },
            { "data": "centrocosto" },
            { "data": "objestrinst" },
            { "data": "indicadoroe" },
            { "data": "accestrinst" },
            { "data": "indicadorae" },
            { "data": "nombre_act" },
            { "data": "desc_act_ope" },
            { "data": "options" }
        ],
        "resonsieve": "true",
        "bDestroy": true,
        "iDisplayLength": 10,
        "order": [[0, "desc"]]
    });
});

$('#tableRegistropoi').DataTable();