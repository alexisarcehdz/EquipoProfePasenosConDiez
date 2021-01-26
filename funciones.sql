--función que devuelve la utilidad
create or replace function func_utilidad(cod_barras int)
returns FLOAT
language plpgsql
as
$$
declare
   precio_comp FLOAT;
   precio_vent FLOAT;
   utilidadf FLOAT;
begin
   select precio_compra 
   into precio_comp
   from suministra
   where codigo_barras=cod_barras;

   select precio_venta 
   into precio_vent
   from producto
   where codigo_barras=cod_barras;

   utilidadf=precio_vent-precio_comp;
   
   return utilidadf;
end;
$$;


--funciones que devuelve los articulos vendidos en una fecha o periodo
create function func_articulos(fecha12 date)
returns int
language plpgsql
as
$$
declare
   articulosf integer;
begin
   select sum(total_articulo) 
   into articulosf
   from venta
   where fecha_venta = fecha12;
   
   return articulosf;
end;
$$;

create function func_articulos(fecha1 date, fecha2 date)
returns int
language plpgsql
as
$$
declare
   articulosf integer;
begin
   select sum(total_articulo) 
   into articulosf
   from venta
   where fecha_venta between fecha1 and fecha2;
   
   return articulosf;
end;
$$;


--funcion que enlista los productos con un stock menor a tres
create or replace function producto_bajo () 
	returns table (
		nombre_productos varchar,
		en_existencia smallint
	) 
	language plpgsql
as $$
begin
	return query 
		select
			nombre_producto,stock
		from
			producto
		where
			stock<3;
end;$$;

