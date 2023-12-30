-- Generar una sentencia que reemplace la letra ñ por la letra n en el apellido de clientes

DECLARE
    CURSOR cursor_clientes IS
        SELECT COD_CLIE, VAL_APE1, VAL_APE2
        FROM CLIENTES
        WHERE VAL_APE1 LIKE '%Ñ%' OR VAL_APE2 LIKE '%Ñ%';

    v_codclie CLIENTES.COD_CLIE%TYPE;
    v_ape1 CLIENTES.VAL_APE1%TYPE;
    v_ape2 CLIENTES.VAL_APE2%TYPE;
BEGIN
    FOR cliente_reg IN cursor_clientes LOOP
        v_codclie := cliente_reg.COD_CLIE;
        v_ape1 := REPLACE(cliente_reg.VAL_APE1, 'Ñ', 'N');
        v_ape2 := REPLACE(cliente_reg.VAL_APE2, 'Ñ', 'N');

        -- actualizar la tabla
        UPDATE CLIENTES
        SET VAL_APE1 = v_ape1, VAL_APE2 = v_ape2
        WHERE COD_CLIE = v_codclie;

        -- mostrar registros afectados
        DBMS_OUTPUT.PUT_LINE('Cliente Actualizado: ' || v_codclie || ', Apellido Paterno: ' || v_ape1 || ', Apellido Materno: ' || v_ape2);
    END LOOP;

   -- COMMIT; -- Comentado para evitar cambio en duro en la sesion
END;