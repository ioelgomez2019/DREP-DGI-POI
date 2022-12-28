var tableActividad;
var divLoading = document.querySelector("#divLoading");
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
    //Actualizar Actividad Estrategica
    if (document.querySelector("#formActividadestrategica")) {
        var formActividadestrategica = document.querySelector("#formActividadestrategica");
        formActividadestrategica.onsubmit = function (e) {
            e.preventDefault();
            var strNombreao = document.querySelector('#txtNombreao').value;
            var strProgp = document.querySelector('#txtProgp').value;
            var strDescao = document.querySelector('#txtDescao').value;
            var strDescma = document.querySelector('#txtDescma').value;
            var strResp = document.querySelector('#txtResp').value;

            if (strNombreao == '' 
            || strProgp == '' 
            
            || strDescao == '' || strDescma == '' || strResp == '') {
                swal("Atención", "Todos los campos son obligatorios.", "error");
                return false;
            }
            var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            //var ajaxUrl = base_url + '/Registropoi/putActividadestr';
            var ajaxUrl = base_url+'/Actividadestrategica/setActividadestrategica'; //put perfil
            var formData = new FormData(formActividadestrategica);
            request.open("POST", ajaxUrl, true);
            request.send(formData);
            
            request.onreadystatechange = function () {
                if (request.readyState == 4 && request.status == 200) {
                    
                    var objData = JSON.parse(request.responseText);
                    //console.log(objData);
                    if (objData.status) 
                    {
                        $('#modalFormActividadestrategica').modal("hide");
                        formActividadestrategica.reset();
                        swal("Actividad Estrategica", objData.msg, "success");
                        tableActividad.api().ajax.reload();
                    } else {
                        swal("Error", objData.msg, "error");
                    }
                }
                //divLoading.style.display = "none";
                return false;
            }
            

        }
    }

},false);

window.addEventListener('load', function() {
        cargarPP();
        /*fntViewUsuario();
        fntEditUsuario();
        fntDelUsuario();*/
}, false);


function fntEditInfoact(idregistro){

    //rowTable = element.parentNode.parentNode.parentNode;
    document.querySelector('#titleModal').innerHTML ="Actualizar Registro De Actividad Estrategica";
    document.querySelector('.modal-header').classList.replace("headerRegister","headerUpdate");
    document.querySelector('#btnActionForm').classList.replace("btn-primary", "btn-info");
    document.querySelector('#btnText').innerHTML ="Actualizar";
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url + '/Actividadestrategica/getSelectallregistroact/' + idregistro;
    //let ajaxUrl = base_url+'/Clientes/getCliente/'+idpersona;
    request.open("GET",ajaxUrl,true);
    request.send();
    request.onreadystatechange = function(){

        if(request.readyState == 4 && request.status == 200){
            let objData = JSON.parse(request.responseText);
            
                //alert(objData.centrocosto);
                document.querySelector("#idActividadestrategica").value = objData.idcodigo_act;
                document.querySelector("#txtACOei").value = objData.codigooe;
                document.querySelector("#txtAOei").value = objData.objestrinst;

                document.querySelector("#txtACAei").value = objData.codigoae;
                document.querySelector("#txtCAei").value = objData.accestrinst;

                document.querySelector("#txtNombreao").value = objData.nombre_act;
                document.querySelector("#txtProgp").value = objData.programa_pre_idprograma_pre;

                document.querySelector("#txtCodpp").value = objData.codigo_pp;

                document.querySelector("#txtDescao").value = objData.desc_act_ope;
                document.querySelector("#txtDescma").value = objData.desc_cua_met;


                //document.querySelector("#txtResp").value = objData.responsable;                

                if(objData.responsable == 'Esp. Finanzas'){
                    document.querySelector("#txtResp").value = 1;
                }else if(objData.responsable == 'Esp. Planificador'){
                    document.querySelector("#txtResp").value = 2;
                }
                $('#txtResp').selectpicker('render');
                

            
        }
        $('#modalFormActividadestrategica').modal('show');
    }
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


function cargarPP() {
    select = document.getElementById('txtProgp');
    var ajaxUrl = base_url + '/Actividadestrategica/getSelectpp';
    //var ajaxUrl = base_url+'/Registropoi/getSelectObjetivoestricoNombre';
    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    request.open("GET", ajaxUrl, true);
    request.send();

    request.onreadystatechange = function () {
        if (request.readyState == 4 && request.status == 200) {
            //document.querySelector('#txtCc').innerHTML = request.responseText;
            //$('#txtCc').selectpicker('refresh');
            const objData = JSON.parse(request.responseText);
            console.log(objData);
            //alert(objData.length);
            var cadena = "";

            for (var i = 0; i < objData.length; i++) {
                cadena = cadena + '<option  value=' + objData[i].idprograma_pre + '  >' + objData[i].nombre_pp + '</option>';
            }
            document.getElementById("txtProgp").innerHTML = cadena;
            $('#txtProgp').selectpicker('refresh');
            $('#txtProgp').selectpicker('refresh');
            $(document).on('change', '#txtProgp', function (event) {
                var value;
                value = $(this).val();
                objData[value - 1];

                document.querySelector('#txtCodpp').value = objData[value - 1].cod_pp;
            });
        }
    }
}