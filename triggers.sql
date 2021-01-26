CREATE OR REPLACE FUNCTION fun_venta_articulo()
  RETURNS TRIGGER                                     --aquí regresa un trigger
  LANGUAGE PLPGSQL
  AS
$$
DECLARE
   stock_articulo integer;
BEGIN
	select stock
        into stock_articulo
        from producto 
        where producto.codigo_barras = NEW.codigo_barras;

        if stock_articulo-NEW.cantidad_articulo <= 0 then        
            raise exception 'Stock de este articulo es cero';
        elsif stock_articulo-NEW.cantidad_articulo<3 then
            raise info 'Stock de este articulo menor a 3';

            update producto
            set stock = stock_articulo-NEW.cantidad_articulo
            where producto.codigo_barras = NEW.codigo_barras;

        else
            update producto
            set stock = stock_articulo-NEW.cantidad_articulo
            where producto.codigo_barras = NEW.codigo_barras;

        end if;

        return NEW;
END;
$$
;

CREATE TRIGGER tr_venta_articulo
  BEFORE INSERT
  ON conforma
  FOR EACH ROW
  EXECUTE PROCEDURE fun_venta_articulo();





/*Cada que haya la venta de un artículo, deberá decrementarse el stock por
la cantidad vendida de ese artículo. Si el valor llega a cero, abortar la
transacción. Si hay menos de 3, emitir un mensaje.*/