<?php $ruta = base_url(); ?>
<style>
    .datepicker {
        z-index: 9999 !important;
    }
</style>
<script type="text/javascript">
    var base_url = '<?php echo $ruta; ?>';
    var contador_universal = 0;
    var contadordireccion = 0;
    var contadorrazon_social = 0;
    var contadortelefono = 0;
    var contadorcorreo = 0;
    var contadorrepresentante = 0;
    var contadorpagina_web = 0;
    var contadorcumpleanos = 0;

</script>
<script src="<?php echo $ruta; ?>recursos/js/cliente.js"></script>
<input type="hidden" id="new_from_venta" value="<?= isset($new_from_venta) ? $new_from_venta : 0 ?>">

<div class="modal-dialog modal-lg" style="width: 75%">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

            <h4 class="modal-title"><?= isset($cliente['id_cliente']) ? 'Editar Activo Fijo' : 'Nuevo Activo Fijo' ?></h4>
        </div>
        <div class="modal-body">
            <form name="formagregar" onsubmit="return validarFrm(this)" action="<?= base_url() ?>cliente/guardar"
                  method="post" id="formagregar"
                  enctype="multipart/form-data">

                <input type="hidden" name="idClientes" id="idClientes"
                       value="<?php if (isset($cliente['id_cliente'])) echo $cliente['id_cliente']; ?>">

                <div class="row" style="display: none;">
                    <div class="form-group">

                        <div class="col-md-8">

                        </div>
                        <div class="col-md-2" id="abrir_imagen_empresa" style="position: absolute; top:0px; right:0px;">

                            <?php if (empty($images)) { ?>
                                <img id="imgSalida_je0" data-count="0"
                                     src="<?php echo $ruta . "recursos/img/la_foto.png" ?>" width="80%"
                                     height="150">
                                <span
                                        class="btn btn-default" style="position:relative;width:100px;" id="subirImg_je">Subir  <i
                                            class="fa fa-file-image-o" aria-hidden="true"></i></span>
                                <input style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;width:100%;height:100%;opacity: 0;"
                                       type="file" onchange="asignar_imagen_je(0)" class="form-control input_imagen"
                                       data-count="0" name="userfile_je[]" accept="image/*"
                                       id="input_imagen_je0">

                                <?php
                            }
                            if (isset($cliente['id_cliente']) and !empty($images)): ?>


                                <?php $ruta_imagen = "clientes/" . $cliente['id_cliente'] . "/" ?>


                                <?php

                                $con_image = 0;
                                foreach ($images as $img): ?>
                                    <div style="text-align: center; margin-bottom: 20px;"
                                         id="div_imagen_producto_je<?= $con_image ?>">

                                        <a href="#" class="img_show"
                                           data-src="<?php echo $ruta . $ruta_imagen . $img; ?>">
                                            <img alt='' width='100' height='150'
                                                 src="<?php echo $ruta . $ruta_imagen . $img; ?>">
                                        </a>
                                        <br>
                                        <a href="#"
                                           onclick="borrar_img_je('<?= $cliente['id_cliente'] ?>','<?= $img ?>','<?= $con_image ?>')"
                                           style="width: 150px; margin: 0;" id="eliminar_je"
                                           class="btn btn-raised btn-danger"><i

                                                    class="fa fa-trash-o"></i> Eliminar</a>
                                    </div>


                                    <?php
                                    $con_image++;
                                endforeach; ?>


                            <?php endif; ?>

                        </div>

                    </div>

                </div>


                <h4>Identificaci&oacute;n General</h4>
                <div class="row">

                    <div class="col-md-2">
                        <label class="control-label panel-admin-text">Tipo de Activo</label>
                        <select id="tipo_cliente" name="tipo_cliente" class="form-control"
                                style="display: <?= $operacion == TRUE ? 'block' : 'none' ?>;">
                            <?php if (!isset($cliente['tipo_cliente'])): ?>
                                <option value="">Seleccione</option>
                            <?php endif; ?>
                            <option value="0" <?= (isset($cliente['tipo_cliente']) && $cliente['tipo_cliente'] == 0) ? 'selected' : '' ?>>
                                Maquinaria
                            </option>
                            <option value="1" <?= (isset($cliente['tipo_cliente']) && $cliente['tipo_cliente'] == 1) ? 'selected' : '' ?>>
                                Mobiliario
                            </option>
                        </select>
                        <?php if ($operacion == FALSE): ?>
                            <h5><?= (isset($cliente['tipo_cliente']) && $cliente['tipo_cliente'] == 1) ? 'Jur&iacute;dico' : 'Natural' ?></h5>
                        <?php endif; ?>
                    </div>


                    <div class="col-md-4">
                        <label class="control-label panel-admin-text">Descripci&oacute;n</label>
                        <input type="text" name="razon_social_j"
                               value="<?php if (isset($cliente['razon_social'])) echo $cliente['razon_social']; ?>"
                               id="razon_social_j" class="form-control"/>
                    </div>


                    <div class="col-md-3">
                        <label class="control-label panel-admin-text">Grupo</label>
                        <select id="grupo_id_juridico" name="grupo_id_juridico" required="true"
                                class="chosen form-control">
                            <option value="">Seleccione</option>
                            <?php foreach ($grupos as $grupo): ?>
                                <option
                                        value="<?php echo $grupo['id_grupos_cliente'] ?>" <?php if (isset($cliente['grupo_id']) and $cliente['grupo_id'] == $grupo['id_grupos_cliente']) echo 'selected' ?>><?= $grupo['nombre_grupos_cliente'] ?></option>
                            <?php endforeach ?>
                        </select>
                    </div>

                    <div class="col-md-2">
                        <label class="control-label panel-admin-text">Subgrupo</label>
                        <input type="text" name="ruc_j"
                               value="<?php if (isset($cliente['identificacion'])) echo $cliente['identificacion']; ?>"
                               id="ruc_j" class="form-control"/>
                    </div>

                    <div class="col-md-2" style="display: none;">
                        <label class="control-label panel-admin-text"></label>
                        <select id="tipo_iden" name="tipo_iden" class="form-control">

                            <?php if (isset($cliente['tipo_cliente'])): ?>
                                <?php if ($cliente['tipo_cliente'] == 0): ?>
                                    <option value="2" <?= isset($cliente['ruc']) && $cliente['ruc'] == 2 ? 'selected' : '' ?>>
                                        RUC
                                    </option>
                                    <?php if ($operacion == TRUE): ?>
                                        <option value="1" <?= isset($cliente['ruc']) && $cliente['ruc'] == 1 ? 'selected' : '' ?>>
                                            DNI
                                        </option>
                                    <?php endif; ?>
                                <?php endif; ?>
                                <?php if ($cliente['tipo_cliente'] == 1): ?>
                                    <option value="2">RUC</option>
                                <?php endif; ?>
                            <?php else: ?>
                                <option value="">Seleccione</option>
                            <?php endif; ?>
                        </select>
                    </div>
                </div>
                <br>

                <div class="row">

                    <div class="col-md-3">
                        <label class="control-label panel-admin-text">Numero de Serie</label>
                        <input type="text" name="nombres"
                               value="<?php if (isset($cliente['nombres'])) echo $cliente['nombres']; ?>"
                               id="nombres" class="form-control" data-placeholder="Nombre"/>
                    </div>

                    <div class="col-md-3">
                        <label class="control-label panel-admin-text">Fecha de Adquisici&oacute;n</label>
                        <input type="text" name="apellido_paterno"
                               readonly style="cursor: pointer;"
                               value="<?php if (isset($cliente['apellido_paterno'])) echo $cliente['apellido_paterno']; ?>"
                               id="apellido_paterno" class="form-control" data-placeholder="Apellido paterno"/>
                    </div>

                    <div class="col-md-3">
                        <label class="control-label panel-admin-text">Ubicaci&oacute;n</label>
                        <input type="text" name="apellido_materno"
                               value="<?php if (isset($cliente['apellido_materno'])) echo $cliente['apellido_materno']; ?>"
                               id="apellido_materno" class="form-control" data-placeholder="Apellido materno"/>
                    </div>


                    <div class="col-md-2">
                        <label class="control-label panel-admin-text">Localizaci&oacute;n</label>
                        <input type="text" name="apellidoPJuridico"
                               value="<?php if (isset($cliente['dni'])) echo $cliente['dni']; ?>"
                               id="apellidoPJuridico" class="form-control" data-placeholder="Nombre"/>
                    </div>
                </div>

                <br>

                <h4>Datos Adicionales</h4>
                <div class="row">

                    <div class="col-md-2">
                        <label class="control-label panel-admin-text">Asegurado</label>
                        <select id="telefono2" name="telefono2" required="true" class="chosen form-control">
                            <option value="0" <?php if (isset($cliente['telefono2']) and $cliente['telefono2'] == 0) echo "selected" ?>>
                                NO
                            </option>
                            <option value="1" <?php if (isset($cliente['telefono2']) and $cliente['telefono2'] == 1) echo "selected" ?>>
                                SI
                            </option>

                        </select>

                    </div>


                    <div class="col-md-4">
                        <label class="control-label panel-admin-text">Compa&ntilde;ia</label>
                        <input type="text" id="direccion_j" required="true"
                               class="form-control" name="direccion_j"
                               value="<?php if (isset($cliente['direccion'])) echo $cliente['direccion']; ?>">
                    </div>

                    <div class="col-md-3">
                        <label class="control-label panel-admin-text">Mantenimiento</label>
                        <select id="genero" name="genero" required="true" class="chosen form-control">
                            <option value="0" <?php if (isset($cliente['genero']) and $cliente['genero']==0) echo "selected" ?>>NO</option>
                            <option value="1" <?php if (isset($cliente['genero']) and $cliente['genero']==1) echo "selected" ?>>SI</option>

                        </select>
                    </div>

                    <div class="col-md-2">
                        <label class="control-label panel-admin-text">Proveedor</label>
                        <input type="text" name="correo"
                               value="<?php if (isset($cliente['email'])) echo $cliente['email']; ?>"
                               id="correo" class="form-control" data-placeholder="Correo"/>
                    </div>

                </div>


                <br>

                <div class="row" style="display: none">
                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label panel-admin-text">Estado</label>
                            <select id="estatus_j" name="estatus_j" required="true" class="chosen form-control">

                                <option value="1" <?php if (isset($cliente['cliente_status']) AND $cliente['tipo_cliente'] == 1 and $cliente['cliente_status'] == 1) echo "selected" ?>>
                                    ACTIVO
                                </option>
<!--                                <option value="0" --><?php //if (isset($cliente['cliente_status']) AND $cliente['tipo_cliente'] == 1 and $cliente['cliente_status'] == 0) echo "selected" ?><!-->-->
<!--                                    INACTIVO-->
<!--                                </option>-->

                            </select>

                        </div>

                    </div>
                </div>

        </div>


        <div class="modal-footer">
            <button type="button" id="" class="btn btn-primary" onclick="guardarcliente(); ">Confirmar</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <!-- grupo.guardar();; -->

        </div>
        <!-- /.modal-content -->
        </form>
    </div>
</div>
</div>

<script>
    $(function(){
        $('#apellido_paterno').datepicker({
            weekStart: 1,
            format: 'dd-mm-yyyy',
            startDate: '+1d'})
    })
</script>

