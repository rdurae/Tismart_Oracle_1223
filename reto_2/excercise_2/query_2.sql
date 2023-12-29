-- Usando Procedimientos Almacenados insertar en el campo nombre corto el primer nombre y primer apellido de los clientes

SELECT * FROM CLIENTES
FETCH FIRST 20 ROWS ONLY;