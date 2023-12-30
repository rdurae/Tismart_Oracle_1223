-- Crear una función que devuelva el monto de deuda total de una zona,
-- el parámetro a recibir es zona.
SET SERVEROUTPUT ON

DECLARE
    v_deuda_total NUMBER;
BEGIN
    v_deuda_total := CALCULAR_DEUDA_POR_ZONA(1633);
    DBMS_OUTPUT.PUT_LINE('Deuda Total por Zona: ' || v_deuda_total);
END;
