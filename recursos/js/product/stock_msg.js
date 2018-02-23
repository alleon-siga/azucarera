function verificateStockMin() {
    $menu = $("#notificaciones")
     //$(".badge").html()
    $.ajax({
        type: 'GET',
        url: BASE_URL+'producto/verificateStockMin',
        dataType: "json",

        success: function (data) {
            badge = 0;
            enlace="";
            $.each(data, function (index , producto) {
                id = producto.id;
                nombre = producto.nombre;
                cantidadInventario = producto.cantidad;
                stockMin = producto.producto_stockminimo;
                localPertenece = producto.local_nombre;

                if(cantidadInventario <= (stockMin - 1))
                {
                    badge +=1;
                    enlace += "<li><a href='#'>" +
                        " "+nombre+" - " +
                        " Bajo Stock en el local" +
                        " ("+localPertenece+")" +
                        " </a></li>";



                }


            }); // end Each
                $menu.find(".dropdown-menu").html("");
                $menu.find(".dropdown-menu").append(enlace);
                $menu.find(".badge").html(badge);
                $("#widget-stock-min").html(badge);

        },
        error: function () {
            var growlType = 'warning';

            $.bootstrapGrowl('<h4>Ha ocurrido un error</h4>', {
                type: growlType,
                delay: 2500,
                allow_dismiss: true
            });

        }

    })


}