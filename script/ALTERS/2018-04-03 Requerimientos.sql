ALTER TABLE cliente

ADD codigo VARCHAR(20) NOT NULL



ALTER TABLE `azucarera`.`cliente` 

ADD UNIQUE INDEX(`codigo`);

INSERT INTO opcion(nOpcionClase, cOpcionDescripcion, cOpcionNombre) VALUES('7','costoinventario','Costo de Inventario');
INSERT INTO opcion(nOpcionClase, cOpcionDescripcion, cOpcionNombre) VALUES('7','ventacliente','Ventas por cliente');