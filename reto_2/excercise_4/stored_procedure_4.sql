-- •	Crear un procedimiento almacenado que reciba como parámetros la zona, 
-- sección y devuelva como el total de monto solicitado de los pedidos 
-- rechazados

CREATE OR REPLACE PROCEDURE SP_OBTENER_TOTAL_VENTAS_RECHAZADAS (
    p_zona IN PEDIDOS.COD_ZONA%TYPE,
    p_seccion IN PEDIDOS.COD_SECC%TYPE,    
    p_total_rechazado OUT NUMBER
)
IS
BEGIN
    SELECT SUM(TO_NUMBER(REPLACE(VAL_MONT_SOLI, '.', ','))) INTO p_total_rechazado 
    FROM PEDIDOS 
    WHERE 
        VAL_ESTA_PEDI = 'RECHAZADO' AND
        COD_ZONA = p_zona AND 
        COD_SECC = p_seccion;
    DBMS_OUTPUT.PUT_LINE('Monto Total Rechazado (S/.): ' || p_total_rechazado);
END SP_OBTENER_TOTAL_VENTAS_RECHAZADAS;