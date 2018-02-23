<?php $ruta = base_url(); ?>

<ul class="breadcrumb breadcrumb-top">
    <li>Usuarios</li>
    <li><a href="">Ver Usuarios</a></li>
</ul>
<div class="row">
    <div class="col-xs-12">
        <div class="alert alert-success alert-dismissable" id="success"
             style="display:<?php echo isset($success) ? 'block' : 'none' ?>">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
            <h4><i class="icon fa fa-check"></i> Operaci&oacute;n realizada</h4>
            <span id="successspan"><?php echo isset($success) ? $success : '' ?></div>
        </span>
    </div>
</div>
<!--
<div class="row">
    <div class="col-xs-12">
        <div class="alert alert-danger alert-dismissable" id="error"
             style="display:<?php //echo isset($error) ? 'block' : 'none' ?>">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
            <h4><i class="icon fa fa-check"></i> Error</h4>
            <span id="errorspan"><?php //echo isset($error) ? $error : '' ?></div>
    </div>
</div>-->

<div class="block">


    <div class="row">
        <div class="col-md-1">
            <a class="btn btn-primary" onclick="agregar();">
                <i class="fa fa-plus "> Nuevo</i>
            </a>
        </div>

    </div>
    <br>
    <div class="box-content box-nomargin">
        <div class="table-responsive">


            <table class='table table-striped table-media dataTable table-bordered'>
                <thead>
                <tr>
                    <th>ID Usuario</th>
                    <th>Usuario</th>
                    <th>Ubicaci&oacute;n</th>
                    <th>Cargo&nbsp;&nbsp;</th>
                    <th>Acci&oacute;n</th>
                </tr>
                </thead>
                <tbody>
                <?php if (count($lstUsuario) > 0): ?>
                    <?php foreach ($lstUsuario as $usu): ?>
                        <tr>
                            <td style="text-align: center;"><?php echo $usu->nUsuCodigo; ?></td>
                            <td style="text-align: center;"><?php echo $usu->username; ?></td>
                            <td><?php if(count($locales_usuario)>0){

                                    foreach($locales_usuario as $row){

                                        if($row['usuario_id']==$usu->nUsuCodigo){
                                            echo $row['local_nombre']; echo "<br>";
                                        }
                                    }

                                } ?></td>
                            <td><?php echo $usu->nombre_grupos_usuarios; ?></td>
                            
                            <td class='actions_big'>
                            <?php if ($usu->esSuper != 1)
                            { ?>
                                <div class="btn-group">
                                    <a style="cursor:pointer;"
                                       onclick="editar(<?php echo $usu->nUsuCodigo; ?>,'<?php echo $usu->username; ?>')"
                                       class='btn btn-default tip' title="Editar">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="#" class='btn btn-default tip' onclick="borrar(<?php echo $usu->nUsuCodigo; ?>,'<?php echo $usu->username; ?>')" title="Eliminar" >
                                        <i class="fa fa-trash-o"></i>
                                    </a>


                                </div>
                                <?php } ?>
                            </td>
                            
                        </tr>
                    <?php endforeach; ?>
                <?php else : ?>
                <?php endif; ?>
                </tbody>
            </table>
        </div>


    </div>
</div>

<script type="text/javascript">

    function borrar(id, nom) {

        $('#borrar').modal('show');
        $("#id_borrar").attr('value', id);
        $("#nom_borrar").attr('value', nom);
    }


    function editar(id) {
        console.log(id);
        $("#agregar").load('<?= $ruta ?>usuario/form/'+id);
        $('#agregar').modal('show');
    }

    function agregar() {
        $("#agregar").load('<?= $ruta ?>usuario/form');
        $('#agregar').modal('show');
    }



    var usuario = {
        ajaxgrupo : function(){
            return  $.ajax({
                url:'<?= base_url()?>usuario'

            })
        },                


        guardar : function () {
            $('#load_div').show()
            if ($("#username").val() == '') {
                var growlType = 'warning';

                $.bootstrapGrowl('<h4>Debe seleccionar el username</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });

                $(this).prop('disabled', true);

                return false;
            }

            if ($("#var_usuario_clave").val() == '' && $("#nUsuCodigo").val() == '') {
                var growlType = 'warning';

                $.bootstrapGrowl('<h4>Debe ingresar el password</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });

                $(this).prop('disabled', true);

                return false;
            }

            if ($("#id_local").val() == '') {
                var growlType = 'warning';

                $.bootstrapGrowl('<h4>Debe ingresar una ubicacion por defecto</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });

                $(this).prop('disabled', true);

                return false;
            }


            if ($("#nombre").val() == '') {
                var growlType = 'warning';

                $.bootstrapGrowl('<h4>Debe ingresar el nombre completo</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });

                $(this).prop('disabled', true);

                return false;
            }


            if ($("#identificacion").val() == '') {
                var growlType = 'warning';

                $.bootstrapGrowl('<h4>Debe ingresar la identificacon</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });

                $(this).prop('disabled', true);

                return false;
            }


            if ($("#grupo").val() == '') {
                var growlType = 'warning';

                $.bootstrapGrowl('<h4>Debe seleccionar el grupo</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });

                $(this).prop('disabled', true);

                return false;
            }
            
            App.formSubmitAjax($("#formagregar").attr('action'), this.ajaxgrupo, 'agregar', 'formagregar');

              setTimeout(function () {
                        //$(".alert-danger").css('display','none');
                        $('#load_div').hide()
                    }, 2000)
        }
    }

    function eliminar(){

        App.formSubmitAjax($("#formeliminar").attr('action'), usuario.ajaxgrupo, 'borrar', 'formeliminar' );

    }

    function CargarDefecto(obj,des){
    	var locales = document.getElementById('id_local');
        if (obj.checked){
          var opt = document.createElement('option');
          opt.value = obj.value;
          opt.innerHTML = des;
          locales.appendChild(opt);
        }else{
        	 for (var i=0; i<locales.length; i++){
        		  if (locales.options[i].value == obj.value )
        			  locales.remove(i);
        		  }
        }
    }
    
</script>


<div class="modal fade" id="agregar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">

</div>


<div class="modal fade" id="borrar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <form name="formeliminar" id="formeliminar" method="post" action="<?= $ruta ?>usuario/eliminar">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Eliminar Usuario</h4>
                </div>
                <div class="modal-body">
                    <p>Est&aacute; seguro que desea eliminar el usuario seleccionado?</p>
                    <input type="hidden" name="id" id="id_borrar">
                    <input type="hidden" name="nombre" id="nom_borrar">
                </div>
                <div class="modal-footer">
                    <button type="button" id="confirmar" class="btn btn-primary" onclick="eliminar()">Confirmar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                </div>
            </div>
            <!-- /.modal-content -->
        </div>

</div>



<script src="<?php echo $ruta ?>recursos/js/pages/tablesDatatables.js"></script>
<script>$(function () {
        TablesDatatables.init();

    });</script>

