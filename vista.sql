--vista que contiene los datos necesarios de una factura
CREATE OR REPLACE VIEW factura as
    SELECT c.nombre_pila,c.apellido_pat,p.nombre_producto,
	   co.cantidad_articulo,v.id_venta,v.total_venta,v.fecha_venta
    FROM cliente c, genera g,venta v,conforma co, producto p
    WHERE p.codigo_barras = co.codigo_barras and
          co.id_venta = v.id_venta and
          v.id_venta = g.id_venta and
          g.id_cliente = c.id_cliente;


