<!-- Modal -->
<div class="modal fade" id="modalFormCuadronecesidad" class="modalFormCuadronecesidad" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal">BIEN VENIDO A LA TIENDA POI</h5>
          <p>Techo Presupuestal 
            <span class=" badge bg-danger">470</span>
          </p>
      
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <form id="formCuadronecesidad" name="formCuadronecesidad" class="form-horizontal">
              <input type="hidden" id="idCuadronecesidad" name="idCuadronecesidad" value="">
              <p class="text-primary">Usted esta llenando los requrimientos de la ficha poi<button type="button" class="btn btn-primary" onclick="agregarreq()">
                Agregar  + 1
              </button>
              </p>
              <h4 id="requerimiento" >Requerimiento 1</h4>        
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="txtNombreae">Requerimiento <span class="required">*</span></label>
                  <input type="text" class="form-control valid validText" id="txtCae" name="txtCae" required=""  >
                </div>
                <div class="form-group col-md-4">
                  <label for="txtNombreae">Especifica de gasto <span class="required">*</span></label>
                  <input type="text" class="form-control valid validText" id="txtCae" name="txtCae" required="" >
                </div>
                <div class="form-group col-md-2">
                  <label for="txtNombreae">Cantidad <span class="required">*</span></label>
                  <input type="text" class="form-control valid validNumber" id="txtMoe" name="txtMoe" required="" onkeypress="return controlTag(event);" maxlength="3">
                </div>
                <div class="form-group col-md-4">
                  <label for="txtNombreae">Especifica de mes<span class="required">*</span></label>
                  <input type="date" id="start" name="trip-start"
                     value=""
                     min="2022-01-01" max="2023-12-31">

                </div>
              </div>

              <div class="form-row" id="addreq">
              </div>

              <div class="tile-footer">
                <button id="btnActionForm" class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i><span id="btnText">Guardar</span></button>&nbsp;&nbsp;&nbsp;
                <button class="btn btn-danger" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
              </div> 
            </form>
      </div>
    </div>
  </div>
</div>