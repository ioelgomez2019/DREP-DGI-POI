<?php 
    headerAdmin($data); 
    getModal('modalRegistropoi',$data);
?>
  <main class="app-content">    
      <div class="app-title">
        <div>
            <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
                <?php if($_SESSION['permisosMod']['w']){ ?>
                <button class="btn btn-primary" type="button" onclick="openModal();" ><i class="fas fa-plus-circle"></i> Nuevo</button>
              <?php } ?>
            </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="<?= base_url(); ?>/registropoi"><?= $data['page_title'] ?></a></li>
        </ul>
      </div>
        <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="tile-body">
                  <div class="table-responsive">
                    <table class="table table-hover table-bordered" id="tableRegistropoi">
                      <thead>
                        <tr>
                          <th>ID_POI</th>
                          <th>Centro de costo</th>
                          <th>Objetivo Estrategico</th>
                          <th>Codigo OE</th>
                          <th>Indicador OE</th>
                          <th>Unidad de medida OE</th>
                          <th>Meta OE</th>
                          <th>Accion Estrategica</th>
                          <th>Codigo AE</th>
                          <th>Indicador AE</th>
                          <th>Unidad de mediad AE</th>
                          <th>Meta AE</th>
                          <th>ACCIONES</th>
                          
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1</td>
                          <td>Educacion secundaria</td>
                          <td>500</td>
                          <td>O1</td>
                          <td>ESTUDIANTES</td>
                          <td>DOCENTES</td>
                          <td>01</td>
                          <td>ponencia para estudaintes </td>
                          <td>A1</td>
                          <td>dOCENTES</td>
                          <td>18</td>
                          <td>200</td>
                          <td> <a href="http://localhost/tienda_poiv6/actividadestrategica"><button class="btn btn-info btn-sm btnViewUsuario" onclick="fntView()" title="Ver usuario"><i class="far fa-eye" aria-hidden="true"></i></button></a></td>

                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </main>
<?php footerAdmin($data); ?>
    