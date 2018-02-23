<?php $ruta = base_url(); ?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>EASY INVENTORY</title>
    <meta name="description" content="">

    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">


    <script src="<?php echo $ruta; ?>recursos/js/vendor/jquery-1.11.1.min.js"></script>

    <meta name="description"
          content="ProUI is a Responsive Bootstrap Admin Template created by pixelcave and published on Themeforest.">
    <meta name="author" content="pixelcave">
    <meta name="robots" content="noindex, nofollow">

    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">

    <!-- Icons -->
    <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
    <link rel="shortcut icon" href="<?php echo $ruta; ?>recursos/img/favicon.ico">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/img/icon57.png" sizes="57x57">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/img/icon72.png" sizes="72x72">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/img/icon76.png" sizes="76x76">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/img/icon114.png" sizes="114x114">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/img/icon120.png" sizes="120x120">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/img/icon144.png" sizes="144x144">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/img/icon152.png" sizes="152x152">
    <!-- END Icons -->

    <!-- Stylesheets -->
    <!-- Bootstrap is included in its original form, unaltered -->
    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/bootstrap.min.css">

    <!-- Related styles of various icon packs and plugins -->
    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/plugins.css">

    <!-- The main stylesheet of this template. All Bootstrap overwrites are defined in here -->
    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/main.css">

    <!-- Include a specific file here from css/themes/ folder to alter the default theme of the template -->

    <!-- The themes stylesheet of this template (for using specific theme color in individual elements - must included last) -->
    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/themes.css">
    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/style.css">
    <!-- END Stylesheets -->

    <!-- Modernizr (browser feature detection library) & Respond.js (Enable responsive CSS code on browsers that don't support it, eg IE8) -->
    <script src="<?php echo $ruta; ?>recursos/js/vendor/modernizr-2.7.1-respond-1.4.2.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $(document).keypress(function(e){
                if(e.which == 13) {
                    $("#btnlogin").click();
                }
            });

            $("#btnlogin").click(function (event) {
                <?php $mensaje = "<a ></a>";?>
                event.preventDefault();
                $.ajax({
                    type: "POST",
                    data: $('#frmLogin').serialize(),
                    url: "<?php echo $ruta;?>" + "inicio/validar_login",
                    success: function (msj) {
                        if (msj == 'ok') {
                            window.location.href = "<?php echo $ruta;?>" + "principal/";
                        } else {
                          //  document.getElementById("error").innerHTML = "<a>Usuario o clave incorrecta, por favor vuelva a intentar</a>";

                          //  document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block';
               $("#light").html('Usuario o clave incorrecta, por favor vuelva a intentar')        
    $("#light").delay("slow").fadeIn().delay(2000).fadeOut();


                        }
                    }
                });
            });
        });



    </script>
<style type="text/css">
     .btn_login {
  background: #7ed962;
  background-image: -webkit-linear-gradient(top, #7ed962, #4eb82b);
  background-image: -moz-linear-gradient(top, #7ed962, #4eb82b);
  background-image: -ms-linear-gradient(top, #7ed962, #4eb82b);
  background-image: -o-linear-gradient(top, #7ed962, #4eb82b);
  background-image: linear-gradient(to bottom, #7ed962, #4eb82b);
  -webkit-border-radius: 6;
  -moz-border-radius: 6;
  border-radius: 6px;
  text-shadow: 1px 1px 3px #666666;
  font-family: Arial;
  color: #ffffff;
  font-size: 16px;
  padding: 3% 24% 3% 24%;
  border: solid #44ad34 2px;
  text-decoration: none;
}

.btn_login:hover {
  background: #63b557;
  background-image: -webkit-linear-gradient(top, #63b557, #1bb52a);
  background-image: -moz-linear-gradient(top, #63b557, #1bb52a);
  background-image: -ms-linear-gradient(top, #63b557, #1bb52a);
  background-image: -o-linear-gradient(top, #63b557, #1bb52a);
  background-image: linear-gradient(to bottom, #63b557, #1bb52a);
  text-decoration: none;
}
.black_overlay{
    display: none;
    position: absolute;
    top: 0%;
    left: 0%;
    width: 100%;
    height: 100%;
    background-color: black;
    z-index:1001;
    -moz-opacity: 0.8;
    opacity:.80;
    filter: alpha(opacity=80);
}

.white_content {
    display: none;
    position: absolute;
    top: 45%;
    left: 22%;
    width: 270px;
    height: 70px;
    padding: 16px;
    border: 1px solid red;
    -webkit-border-radius: 10px 10px 10px 10px;
     border-radius: 10px 10px 10px 10px;
    background-color: rgba(215, 44, 44, 0.8);
background: rgba(215, 44, 44, 0.8);
color: white;

    z-index:1002;
    overflow: auto;
}
</style>
</head>
<body class='login_body'>
<img src="<?php echo $ruta; ?>recursos/img/placeholders/backgrounds/fondo-madera.jpg" alt="Login Full Background"
     class="full-bg animation-pulseSlow">
<center>
    <div id="light" class="white_content"></div>

    <div id="error"></div>
    <form method="post" id="frmLogin" class="base">

        <h1 class="title">Easy Inventory</h1>



        <div id="form1">
            <div id="form-img">
                <img src="<?php echo base_url();?>/recursos/img/placeholders/avatars/profile-img.png" width="99" height="99"   />
            </div>
            <div class="mailbox">
                <input placeholder="Usuario" type="text" id="user" name="user"    />
            </div>
            <div class="mailbox">
                <input placeholder="Contraseña" type="password" id="pw" name="pw" style="width:270px; height:42px; border: solid 1px #c2c4c6; font-size:16px; padding-left:8px;" />
            </div>
            <div>

                <button class="btn btn-success"  id="btnlogin" type="button" class="btn_login"> Iniciar Sesión
                </button>
            </div>

        </div>



    </div>
    </form>
</center>

<center>
    <div id="logo-create">
        <h2 style="float: left;margin-left:10px;color:gray"> By: </h2> <img   src="<?php echo base_url();?>/recursos/img/placeholders/photos/easytech.png"  width="200" height="88"  />
    </div>
</center>




</body>

</html>