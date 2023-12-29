-- •	En la tabla clientes agregar un campo denominado edad y calcular la edad de cada cliente.

ALTER TABLE CLIENTES
ADD (EDAD INT);

DECLARE
    V_NOMBRE_TABLA VARCHAR(30) := 'CLIENTES';
BEGIN
    FOR col IN (SELECT column_name FROM all_tab_columns WHERE table_name = V_NOMBRE_TABLA)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Columna: ' || col.column_name);
    END LOOP;
END;