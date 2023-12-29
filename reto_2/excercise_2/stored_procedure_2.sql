-- Usando Procedimientos Almacenados insertar en el campo nombre corto el primer nombre y primer apellido de los clientes

CREATE OR REPLACE PROCEDURE sp_actualizar_nombrecorto
IS
    v_nombre_corto CLIENTES.NOMBRE_CORTO%TYPE;
BEGIN
    FOR cliente_row IN (SELECT * FROM CLIENTES)
    LOOP   
        v_nombre_corto := cliente_row.VAL_NOM1 || ' ' || cliente_row.VAL_APE1;
        
        UPDATE CLIENTES
        SET NOMBRE_CORTO = v_nombre_corto
        WHERE CLIENTES.COD_CLIE = cliente_row.COD_CLIE;
    END LOOP;
    
    COMMIT;
END sp_actualizar_nombrecorto;

