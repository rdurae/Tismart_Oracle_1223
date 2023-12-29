-- •	Crear un procedimiento almacenado que reciba como parámetros la zona, 
-- sección y devuelva como el total de monto solicitado de los pedidos 
-- rechazados

DECLARE
  p_input_zona PEDIDOS.COD_ZONA%TYPE := 1629;
  p_input_seccion VARCHAR2(26) := 'O';
  p_output_total_rechazado NUMBER;
BEGIN
    -- Call the stored procedure with inputs
    SP_OBTENER_TOTAL_VENTAS_RECHAZADAS(
        P_ZONA => p_input_zona,
        P_SECCION => p_input_seccion,
        P_TOTAL_RECHAZADO => p_output_total_rechazado
    );
END;
