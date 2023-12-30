-- Usando inner join crear una vista que genere los clientes que no tienen pedido facturado
-- y otro listado de los pedidos cuyo cliente no existe en la tabla clientes

CREATE VIEW CLIENTES_PEDIDOS_NO_FACTURADOS AS
    SELECT 
        CLIENTES.COD_CLIE AS CODIGO_CLIENTE,
        VAL_NOM1 AS PRIMER_NOMBRE,
        VAL_APE1 AS PRIMER_APELLIDO,
        VAL_ESTA_PEDI AS ESTADO_PEDIDO,
        PEDIDOS.VAL_MONT_ESTI AS MONTO_ESTIMADO
    FROM PEDIDOS
    INNER JOIN CLIENTES ON CLIENTES.COD_CLIE = PEDIDOS.COD_CLIE
    WHERE VAL_ESTA_PEDI <> 'FACTURADO';