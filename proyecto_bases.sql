drop database if exists proyecto;

create database proyecto;

\c proyecto


CREATE TABLE proveedor(
id_proveedor SMALLINT PRIMARY KEY,
razon_social VARCHAR(100) NOT NULL,
nombre_pila VARCHAR(40) NOT NULL,
apellido_pat VARCHAR(40) NOT NULL,
apellido_mat VARCHAR(40),
calle VARCHAR(40) NOT NULL,
colonia VARCHAR(70) NOT NULL,
numero SMALLINT NOT NULL,
codigo_postal SMALLINT NOT NULL,
estado VARCHAR(30) NOT NULL
);


CREATE TABLE tel_proveedor(
num_telefono BIGINT PRIMARY KEY,
id_proveedor SMALLINT NOT NULL,
FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor)
);

CREATE TABLE producto(
codigo_barras BIGINT PRIMARY KEY,
nombre_producto VARCHAR(20) NOT NULL,
stock SMALLINT NOT NULL,
descripcion VARCHAR(50) NOT NULL,
marca VARCHAR(20) NOT NULL,
precio_venta INT NOT NULL,
es_impresion BOOLEAN NOT NULL,
es_recarga BOOLEAN NOT NULL,
es_regalo BOOLEAN NOT NULL,
es_articulo BOOLEAN NOT NULL
);

CREATE TABLE suministra(
id_proveedor SMALLINT NOT NULL,
codigo_barras BIGINT NOT NULL,
precio_compra FLOAT(8) NOT NULL,
fecha_compra DATE NOT NULL,
PRIMARY KEY (id_proveedor, codigo_barras),
FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor),
FOREIGN KEY (codigo_barras) REFERENCES producto (codigo_barras)
);

CREATE TABLE cliente(
id_cliente BIGINT PRIMARY KEY,
razon_social VARCHAR(100) NOT NULL,
nombre_pila VARCHAR(40) NOT NULL,
apellido_pat VARCHAR(40) NOT NULL,
apellido_mat VARCHAR(40),
calle VARCHAR(40) NOT NULL,
colonia VARCHAR(40) NOT NULL,
numero SMALLINT NOT NULL,
codigo_postal INT NOT NULL,
estado VARCHAR(40) NOT NULL
);

CREATE TABLE email_cliente(
correo VARCHAR(60) PRIMARY KEY,
id_cliente BIGINT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE venta(
id_venta BIGINT PRIMARY KEY,
num_venta BIGINT NOT NULL,
total_venta BIGINT NOT NULL,
total_articulo INT NOT NULL,
fecha_venta DATE NOT NULL
);

CREATE TABLE conforma(
codigo_barras BIGINT NOT NULL,
id_venta BIGINT NOT NULL,
cantidad_articulo SMALLINT NOT NULL,
PRIMARY KEY (codigo_barras, id_venta),
FOREIGN KEY (codigo_barras) REFERENCES producto (codigo_barras),
FOREIGN KEY (id_venta) REFERENCES venta (id_venta)
);


CREATE TABLE genera(
id_venta BIGINT NOT NULL,
id_cliente BIGINT NOT NULL,
PRIMARY KEY (id_venta, id_cliente),
FOREIGN KEY (id_venta) REFERENCES venta (id_venta),
FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)

);

--\i 'C:/Users/ULISES/Desktop/Proyecto_Bases_Datos/triggers.sql'

--\i 'C:/Users/Windows/Downloads/Nueva carpeta (2)/proyecto bases/inserta.sql'

--\i 'C:/Users/ULISES/Desktop/Proyecto_Bases_Datos/funciones.sql'

--\i 'C:/Users/ULISES/Desktop/Proyecto_Bases_Datos/vista.sql'

--\i 'C:/Users/ULISES/Desktop/Proyecto_Bases_Datos/indice.sql'
