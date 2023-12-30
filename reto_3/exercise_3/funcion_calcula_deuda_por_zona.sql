-- Crear una función que devuelva el monto de deuda total de una zona,
-- el parámetro a recibir es zona.

CREATE OR REPLACE FUNCTION CALCULAR_DEUDA_POR_ZONA(
    p_cod_zona IN PEDIDOS.COD_ZONA%TYPE   
) RETURN NUMBER
IS
    v_deuda_total NUMBER := 0;
BEGIN
    SELECT SUM(TO_NUMBER(REPLACE(SAL_DEUD_ANTE, '.', ',')))
    INTO v_deuda_total
    FROM PEDIDOS
    WHERE COD_ZONA = p_cod_zona;    

    RETURN v_deuda_total;
END CALCULAR_DEUDA_POR_ZONA;