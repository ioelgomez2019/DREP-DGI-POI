<?php 
    headerAdmin($data); 
    getModal('modalRegistropoi',$data);
    //getModal('modalClientes',$data);
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
          <li class="breadcrumb-item"><a href="<?= base_url(); ?>/clientes"><?= $data['page_title'] ?></a></li>
        </ul>
      </div>
        <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="tile-body">
                  <div class="table-responsive">
                    <table class="table table-hover table-bordered" id="tableActividadestrategica">
                      <thead>
                        <tr>
                          <th>ID_POI</th>
                          <th>ID_AE</th>
                          <th>Objetivo Estrategico</th>
                          <th>Accion estrategica</th>
                          <th>Indicador</th>
                          <th>ACCIONES</th>
                          
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>AE1</td>
                          <td>OEI1</td>
                          <td>Ponencia a lo docentes</td>
                          <td>ponencia</td>
                          <td>Estudiantes</td>
                          
                          <td> <a href="http://localhost/tienda_poiv6/cuadronesesidad"><button class="btn btn-info btn-sm btnViewUsuario" onclick="fntView()" title="Ver usuario"><i class="far fa-eye" aria-hidden="true"></i></button></a></td>

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
    