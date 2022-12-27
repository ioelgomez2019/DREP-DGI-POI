

window.addEventListener('load',function(){
    fntCentroCosto();
    //fntObjetivoEstrategicoInstitucional();
    cargarIndicadorOE();
    cargaObjetivoEI();
    cargarunidadmoe();
    //cargaSubcategoria();
    //cargaSubcategoria2();
    
},false)

function fntCentroCosto(){
    if(document.querySelector('#txtCc')){
        var ajaxUrl = base_url+'/Centrocosto/getSelectCentrocosto';
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        request.open("GET",ajaxUrl,true);
        request.send();
        request.onreadystatechange = function(){
            if(request.readyState == 4 && request.status == 200){
                document.querySelector('#txtCc').innerHTML = request.responseText;
                $('#txtCc').selectpicker('render');
                $('#txtCc').selectpicker('refresh');
            }
        }
    }

}

function cargaObjetivoEI(){
        select = document.getElementById('txtOei');
        var ajaxUrl = base_url+'/Registropoi/getSelectObjetivoestricoNombre';
        //var ajaxUrl = base_url+'/Registropoi/getSelectObjetivoestricoNombre';
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        request.open("GET",ajaxUrl,true);
        request.send();
       
        request.onreadystatechange = function(){
            if(request.readyState == 4 && request.status == 200){
                const objData = JSON.parse(request.responseText);
                console.log(objData);
                //alert(objData.length);
                var cadena="";

                for (var i = 0; i<objData.length; i++){
                    cadena = cadena + '<option  value='+objData[i].idobjestr+'  >'+objData[i].nomobjestr+'</option>';
                }
                document.getElementById("txtOei").innerHTML=cadena ;
                $('#txtOei').selectpicker('refresh');
                $(document).on('change', '#txtOei', function(event) {
                    var value;
                    value=$(this).val();
                    objData[value-1];
                    
                    document.querySelector('#txtCoe').value =objData[value-1].codoe;
                });
            }
        } 
    }
function cargarIndicadorOE(){
        select = document.getElementById('txtOei');
        oeiseleccionado=select.value;
        //alert(oeiseleccionado);
        select2=document.getElementById("txtIoe");
        

        select3=document.getElementById("txtAei");
        

        if(oeiseleccionado == 0){
            oeiseleccionado = 1 ;
            var ajaxUrlioe = base_url+'/Registropoi/getSelectIndicadorOE/'+oeiseleccionado;
            var ajaxUrlaei = base_url+'/Registropoi/getSelectAccionestrategica/'+oeiseleccionado;    
        }else{
            var ajaxUrlioe = base_url+'/Registropoi/getSelectIndicadorOE/'+oeiseleccionado;
            var ajaxUrlaei = base_url+'/Registropoi/getSelectAccionestrategica/'+oeiseleccionado;
        }
        
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        request.open("GET",ajaxUrlioe,true);
        request.send();

        request.onreadystatechange = function(){
            if(request.readyState == 4 && request.status == 200){
                const sub = JSON.parse(request.responseText);
                var cadena="";
                var cadena2="";
                

                for (var i = 0; i<sub.length; i++){
                    if(sub[i].obj_estrategico_idobjestr==oeiseleccionado){
                        cadena = cadena + '<option  value='+sub[i].idindicadoroei+'  >'+sub[i].nombreoei+'</option>';
                        
                    }
                }
                document.getElementById("txtIoe").innerHTML=cadena ;
                $('#txtIoe').selectpicker('refresh');
            }
        }

        var requestaei = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        requestaei.open("GET",ajaxUrlaei,true);
        requestaei.send();
        requestaei.onreadystatechange = function(){
            if(requestaei.readyState == 4 && requestaei.status == 200){
                const aei = JSON.parse(requestaei.responseText);
                var cadenaaei="";
                for (var i = 0; i<aei.length; i++){
                    if(aei[i].obj_estrategico_idobjestr==oeiseleccionado){
                        cadenaaei = cadenaaei + '<option  value='+aei[i].idaccestr+'  >'+aei[i].accionestr+'</option>';
                        document.getElementById("txtAei").innerHTML=cadenaaei ;
                          $('#txtAei').selectpicker('refresh');
                    }
                }
            }
        }
}
function cargarunidadmoe(){
    select = document.getElementById('txtIoe');
    oeiseleccionado=select.value;
    select2=document.getElementById("txtIoe");
    ioeseleccionado = select.value;    
        if(oeiseleccionado == 0){
            oeiseleccionado = 1 ;
            var ajaxUrlioe = base_url+'/Registropoi/getSelectUnidadMOE/'+oeiseleccionado;   
        }else{
            var ajaxUrlioe = base_url+'/Registropoi/getSelectUnidadMOE/'+oeiseleccionado;
        }
        
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        request.open("GET",ajaxUrlioe,true);
        request.send();
        request.onreadystatechange = function(){
            if(request.readyState == 4 && request.status == 200){
                const sub = JSON.parse(request.responseText);
                var cadena2="";
                for (var i = 0; i<sub.length; i++){
                    cadena2 = sub[i].nombre;
                    //alert(cadena2);
                    document.getElementById("txtUmoe").innerHTML=cadena2 ;
                    $('#txtUmoe').selectpicker('refresh');
                }
                
            }
        }   
}

/*
function cargaCategoria(){
        select = document.getElementById('selectcat');

        var ajaxUrl = base_url+'/Registropoi/getSelectObjetivoestricoNombre';
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        request.open("GET",ajaxUrl,true);
        request.send();
       
        request.onreadystatechange = function(){
            if(request.readyState == 4 && request.status == 200){
                const objData = JSON.parse(request.responseText);
                console.log(objData);
                //alert(objData.length);
                var cadena="";
                for (var i = 0; i<objData.length; i++){
                    cadena = cadena + '<option  value='+objData[i].idobjestr+'  >'+objData[i].nomobjestr+'</option>';
                    
                    
                }
                document.getElementById("selectcat").innerHTML=cadena ;
                $('#selectcat').selectpicker('refresh');
            }
        } 
    }

function cargaSubcategoria(){
        select = document.getElementById('selectcat');
        categoriaseleccionada=select.value;

        select2=document.getElementById("selectsubcat");
        

        select3=document.getElementById("selectsubcat2");
        

        if(categoriaseleccionada == 0){
            categoriaseleccionada = 1 ;
            var ajaxUrlioe = base_url+'/Registropoi/getSelectObjetivoestricooei1/'+categoriaseleccionada;
            var ajaxUrlaei = base_url+'/Registropoi/getSelectAccionestrategica/'+categoriaseleccionada;    
        }else{
            var ajaxUrlioe = base_url+'/Registropoi/getSelectObjetivoestricooei1/'+categoriaseleccionada;
            var ajaxUrlaei = base_url+'/Registropoi/getSelectAccionestrategica/'+categoriaseleccionada;
        }
        
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        request.open("GET",ajaxUrlioe,true);
        request.send();

        request.onreadystatechange = function(){
            if(request.readyState == 4 && request.status == 200){
                const sub = JSON.parse(request.responseText);
                var cadena="";
                //alert(sub[1].idobjestr);
                for (var i = 0; i<sub.length; i++){
                    if(sub[i].obj_estrategico_idobjestr==categoriaseleccionada){
                        cadena = cadena + '<option  value='+sub[i].idindicadoroei+'  >'+sub[i].nombreoei+'</option>';
                    }
                }
                document.getElementById("selectsubcat").innerHTML=cadena ;
                $('#selectsubcat').selectpicker('refresh');
            }
        }

        var requestaei = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        requestaei.open("GET",ajaxUrlaei,true);
        requestaei.send();
        requestaei.onreadystatechange = function(){
            if(requestaei.readyState == 4 && requestaei.status == 200){
                const aei = JSON.parse(requestaei.responseText);
                var cadenaaei="";
                
                for (var i = 0; i<aei.length; i++){
                    if(aei[i].obj_estrategico_idobjestr==categoriaseleccionada){
                        cadenaaei = cadenaaei + '<option  value='+aei[i].idaccestr+'  >'+aei[i].accionestr+'</option>';
                        document.getElementById("selectsubcat2").innerHTML=cadenaaei ;
                          $('#selectsubcat2').selectpicker('refresh');
                    }
                }
            }
        }
}
function cargaSubcategoria2(){
        select = document.getElementById('selectcat');
        categoriaseleccionada=select.value;

        select2=document.getElementById("selectsubcat");
        select2.innerHTML="";
        if(categoriaseleccionada == 0){
            categoriaseleccionada = 1 ;
            
            var ajaxUrlioe = base_url+'/Registropoi/getSelectObjetivoestricooei1/'+categoriaseleccionada;    
        }else{

            var ajaxUrlioe = base_url+'/Registropoi/getSelectObjetivoestricooei1/'+categoriaseleccionada;
        }
        
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        request.open("GET",ajaxUrlioe,true);
        request.send();
        request.onreadystatechange = function(){
            if(request.readyState == 4 && request.status == 200){
                const sub = JSON.parse(request.responseText);
                
                for (var i = 0; i<sub.length; i++){
                    if(sub[i].obj_estrategico_idobjestr==categoriaseleccionada){
                        var opt = document.createElement('option');
                        opt.value = sub[i].idindicadoroei;
                        opt.innerHTML = sub[i].nombreoei;
                        select2.appendChild(opt);
                    }
                }
            }
        }
}

function fntObjetivoEstrategicoInstitucional(){
     if(document.querySelector('#txtOei')){
        var ajaxUrl = base_url+'/Registropoi/getSelectObjetivoestricoNombre';
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        request.open("GET",ajaxUrl,true);
        request.send();
       
        request.onreadystatechange = function(){
            if(request.readyState == 4 && request.status == 200){
                const objData = JSON.parse(request.responseText);
                console.log(objData);
                //alert(objData.length);
                var cadena="";
                for (var i = 0; i < objData.length; i++) {
                                   
                    cadena = cadena + '<option  value='+objData[i].idobjestr+'  >'+objData[i].nomobjestr+'</option>';
                }
                document.getElementById("txtOei").innerHTML=cadena ;
                $('#txtOei').selectpicker('refresh');

                $(document).on('change', '#txtOei', function(event) {
                    var value;
                    value=$(this).val();
                    objData[value-1];
                    
                    document.querySelector('#txtCoe').value =objData[value-1].codoe;
                    const ajaxUrlioe = base_url+'/Registropoi/getSelectObjetivoestricooei1/'+value;
                    const requestioe = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
                    requestioe.open("GET",ajaxUrlioe,true);
                    requestioe.send();
                    
                    requestioe.onreadystatechange = function(){
                        if(requestioe.readyState == 4 && requestioe.status == 200){
                            const objDataioe = JSON.parse(requestioe.responseText);
                            console.log(requestioe);
                            alert(objDataioe.length);
                            var cadenaioe="";
                            //alert(objDataioe.size());
                            for (var j = 0; j < 2; j++) {     
                            }
                            //cadenaioe = cadenaioe + '<option  value='+objDataioe[0].idindicadoroei+'  >'+objDataioe[0].nombreoei+'</option>';

                            document.getElementById("txtIoe").innerHTML=cadenaioe ;
                            $('#txtIoe').selectpicker('refresh'); 
                        }
                    }

            });


            }
        }
    }
}
*/

function openModal()
{
    document.querySelector('#idRegistropoi').value ='';
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary");
    document.querySelector('#btnText').innerHTML ="Guardar";
    document.querySelector('#titleModal').innerHTML = "Nuevo Registro Ficha POI";
    document.querySelector("#formRegistropoi").reset();
    //document.querySelector("#modalFormRegistropoi").reset();
    $('#modalFormRegistropoi').modal('show');
}
function openModalPerfil(){
    $('#modalFormPerfil').modal('show');
}

