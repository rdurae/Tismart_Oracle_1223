-- Usando inner join crear una vista que genere los clientes que no tienen pedido facturado
-- y otro listado de los pedidos cuyo cliente no existe en la tabla clientes
CREATE VIEW CLIENTES_NO_REGISTRADOS AS
    SELECT DISTINCT COD_CLIE
    FROM PEDIDOS P
    WHERE NOT EXISTS (
        SELECT 1
        FROM CLIENTES C
        WHERE C.COD_CLIE = P.COD_CLIE
    );