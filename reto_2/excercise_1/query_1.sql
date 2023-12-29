-- En la tabla de clientes agregar un campo nombre corto
SET SERVEROUTPUT ON;

ALTER TABLE CLIENTES
ADD (NOMBRE_CORTO VARCHAR(200));

DECLARE
    V_NOMBRE_TABLA VARCHAR(30) := 'CLIENTES';
BEGIN
    FOR columna IN (SELECT column_name FROM all_tab_columns WHERE table_name = V_NOMBRE_TABLA)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Column Name: ' || columna.column_name);
    END LOOP;
END;