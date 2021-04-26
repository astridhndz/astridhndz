-- Procedimientos almacenados.

-- Procedimiento almacenado para insertar Empleados

DELIMITER $$
CREATE PROCEDURE sp_insertarEmpleado( IN _Primer_Nombre varchar(15),
									  IN _Segundo_Nombre varchar(15),
                                      IN _Primer_Apellido varchar(15),
                                      IN _Segundo_Apellido varchar(15),
                                      IN _Direccion varchar(45),
                                      IN _Telefono_Celular char(9),
                                      IN _Id_Cargo int,
                                      IN _Id_Estado int
									)
BEGIN
		INSERT INTO empleado(Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Direccion, Telefono_Celular, Id_Cargo, Id_estado)
        VALUES (_Primer_Nombre, _Segundo_Nombre, _Primer_Apellido, _Segundo_Apellido, _Direccion, _Telefono_Celular, _Id_Cargo, _Id_Estado);
END;
$$

-- Invocar un procedimiento almacenado
Call sp_insertarEmpleado("Cindy","Consuelo", "Caballero", "Baca", "Barrio Santa Lucia", "9423-4532", 2, 2);

DELIMITER $$
CREATE PROCEDURE sp_mostrarEmpleados()
BEGIN 
	SELECT *
    FROM empleado;
END;
$$

-- Invocar un metodo para mostrar todos los empleados;
Call sp_mostrarEmpleados();

-- Crear un procedimiento almacenado para actualizar empleado
DELIMITER $$
CREATE PROCEDURE sp_actualizarEmpleado(IN _Id_Empleado int, 
									  IN _Primer_Nombre varchar(15),
									  IN _Segundo_Nombre varchar(15),
                                      IN _Primer_Apellido varchar(15),
                                      IN _Segundo_Apellido varchar(15),
                                      IN _Direccion varchar(45),
                                      IN _Telefono_Celular char(9),
                                      IN _Id_Cargo int,
                                      IN _Id_Estado int
									)
                                    
BEGIN
	UPDATE empleado
		SET	Primer_Nombre = _Primer_Nombre,
			Segundo_Nombre = _Segundo_Nombre,
            Primer_Apellido = _Primer_Apellido,
			Segundo_Apellido = _Segundo_Apellido,
            Direccion = _Direccion,
            Telefono_Celular = _Telefono_Celular,
            Id_Cargo = _Id_Cargo,
            Id_Estado = _Id_Estado
	WHERE Id_Empleado = _Id_Empleado;		
END;
$$

-- Invocar el procedimiento para actualizar una base de datos
Call sp_actualizarEmpleado(1,"Alexa", "Hortencia", "Jimenez", "Gutierrez", "Barrio La esperanza", "9987-6578", 2, 2);

-- Crear procedimiento almacenado para eliminar un empleado
DELIMITER $$
CREATE PROCEDURE sp_eliminarEmpleado(IN _Id_Empleado int)
BEGIN
	DELETE
    FROM empleado
    WHERE Id_Empleado = _Id_Empleado;
END;
$$
-- Invocar procedimiento almacenado para eliminar un empleado
Call sp_eliminarEmpleado(6);
-- Crear procedimiento almacenado para filtrar empleados

DELIMITER $$
CREATE PROCEDURE sp_mostrarEmpleado(IN _Id_Empleado int)
BEGIN
	SELECT *
    FROM empleado
    WHERE Id_Empleado = _Id_Empleado;
END;	
$$

-- Invocar procedimiento almacenado para eliminar un empleado
Call sp_mostrarEmpleado(7);