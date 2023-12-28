-- 5.	Crear una consulta SELECT que muestre el número de pedidos por zona de alto valor y 
-- el número de pedidos por zona de bajo valor. Los pedidos de alto valor son aquellos cuyo 
-- valor estimado es mayor a 250 y pedidos de Bajo Valor son aquellos que tienen un valor menor a 250.
SELECT
    COD_ZONA AS ZONA,
    CONCAT('S/.', TO_CHAR(TOTAL_PEDIDOS_VAL_MONT_SOLI)) AS "MONTO SOLICITADO POR ZONA",
    TOTAL_PEDIDOS AS "TOTAL DE PEDIDOS ENTRE MARCAS POR ZONA",
    CASE
        WHEN TOTAL_PEDIDOS_VAL_MONT_SOLI > 250 THEN 'ALTO VALOR'
        ELSE 'BAJO VALOR'
    END AS "CATEGORÍA DE PEDIDO"
FROM 
(
    SELECT 
        COD_ZONA,
        TO_NUMBER(REPLACE(VAL_MONT_SOLI, '.', ',')) AS TOTAL_PEDIDOS_VAL_MONT_SOLI,
        VAL_UNID_LBEL + VAL_UNID_CYZO + VAL_UNID_ESIK AS TOTAL_PEDIDOS      
    FROM PEDIDOS
)
WHERE TOTAL_PEDIDOS > 0
ORDER BY COD_ZONA ASC


      


