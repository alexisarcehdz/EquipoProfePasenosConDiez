INSERT INTO
    proveedor(id_proveedor,razon_social,nombre_pila,apellido_pat,apellido_mat,
              calle,colonia,numero,codigo_postal,estado)
VALUES
    (1,'razon social 1','Roberto','Rodriguez','Rodriguez', 'calle1', 'colonia1', 23,12440,'estado de mexico');


INSERT INTO
    producto(codigo_barras,nombre_producto,stock,descripcion,marca,precio_venta,
              es_articulo, es_regalo, es_impresion, es_recarga)
VALUES
    (10001,'Regalo1', 20, 'descripcion', 'marca1', 20.50,false,true,false,false),
    (10002,'Regalo2', 5, 'descripcion2', 'marca2', 15.50,false,true,false,false),
    (10003,'Articulo1', 10, 'descripcion3', 'marca3', 30.50,true,false,false,false),
    (10004,'Articulo2', 2, 'descripcion4', 'marca4', 20.00,true,false,false,false);

INSERT INTO
    suministra(id_proveedor,codigo_barras,precio_compra,fecha_compra)
VALUES
    (1,10001,10.0,'2020-01-05'),
    (1,10002,5.90,'2020-01-06'),
    (1,10003,12.20,'2021-01-14'),
    (1,10004,14.40,'2021-01-05');


INSERT INTO
    cliente(id_cliente,razon_social,nombre_pila,apellido_pat,apellido_mat,
              calle,colonia,numero,codigo_postal,estado)
VALUES
    (1,'razon social 2','Christian','hernandez','Rodriguez', 'calle2', 'colonia2', 26,15440,'estado de mexico'),
    (2,'razon social 3','Adolfo','Lopez','Mateos', 'calle3', 'colonia3', 36,15840,'estado de mexico');

INSERT INTO
	email_cliente(correo,id_cliente)
VALUES
('venito@gmail.com',1)
('arceH@gmail.com',2)

INSERT INTO
    venta(id_venta,num_venta,total_venta,total_articulo,fecha_venta)
VALUES
    (1,'VENT-001',56.50,3,'2021-01-20'),
    (2,'VENT-002',71.50,3,'2021-01-20'),
    (3,'VENT-003',41,2,'2021-01-21'),
    (4,'VENT-004',41,2,'2021-01-21'),
    (5,'VENT-005',41,2,'2021-01-22'),
    (6,'VENT-006',41,2,'2021-01-22');


INSERT INTO
    conforma(codigo_barras,id_venta,cantidad_articulo)
VALUES
    (10001,1,2),
    (10002,1,1),
    (10001,2,2),
    (10003,2,1),
    (10001,3,2),
    (10001,4,2),
    (10001,5,2),
    (10001,6,2);



INSERT INTO
    genera(id_venta,id_cliente)
VALUES
    (1,1),
    (2,2),
    (3,1),
    (4,2),
    (5,1),
    (6,2);