-- En la tabla clientes agregar un campo denominado edad y calcular la edad de cada cliente.
CREATE OR REPLACE PROCEDURE SP_CALCULAR_EDAD
IS
    v_edad CLIENTES.EDAD%TYPE;
    v_today DATE := SYSDATE;
BEGIN
    FOR cliente_row IN (SELECT * FROM CLIENTES)
    LOOP   
        v_edad := FLOOR(MONTHS_BETWEEN(v_today, cliente_row.FEC_NACI) / 12);
        
        UPDATE CLIENTES
        SET EDAD = v_edad
        WHERE CLIENTES.COD_CLIE = cliente_row.COD_CLIE;
    END LOOP;
    
    COMMIT;
END SP_CALCULAR_EDAD;
