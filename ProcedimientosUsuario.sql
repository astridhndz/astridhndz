-- Procedimientos almacenados.

-- Procedimiento almacenado para insertar usuarios

DELIMITER $$
CREATE PROCEDURE sp_insertarUsuario(  IN _nombre_usuario char(10),
									  IN _password char(9),
                                      IN _id_estado int,
                                      IN _Fecha_Creacion date,
                                      IN _Fecha_Baja date,
                                      IN _Id_Empleados int
									)
BEGIN
		INSERT INTO usuario(nombre_usuario, password, id_estado, Fecha_Creacion, Fecha_Baja, Id_Empleados)
        VALUES (_nombre_usuario, _password, _id_estado, _Fecha_Creacion, _Fecha_Baja, _Id_Empleados);
END;
$$

-- Invocar un procedimiento almacenado para insertar un Usuario
Call sp_insertarUsuario("mvherrera",12345, 2, "2010/05/10", "2030/08/12", 10);

-- Crear un procedimiento almacenado para mostrar todos los usuarios

DELIMITER $$
CREATE PROCEDURE sp_mostrarUsuarios()
BEGIN 
	SELECT *
    FROM usuario;
END;
$$

-- Invocacion del procedimiento almacenado para mostrar todos los usuarios
Call sp_mostrarUsuarios();

-- Crear un procedimiento almacenado para actualizar usuario
DELIMITER $$
CREATE PROCEDURE sp_actualizarUsuario(IN _id_usuario int, 
									   IN _nombre_usuario char(10),
									   IN _password char(9),
                                       IN _id_estado int,
                                       IN _Fecha_Creacion date,
                                       IN _Fecha_Baja date,
                                       IN _Id_Empleados int
									  )
                                    
BEGIN
	UPDATE usuario
		SET	nombre_usuario = _nombre_usuario,
			password = _password,
            id_estado = _id_estado,
			Fecha_Creacion = _Fecha_Creacion,
            Fecha_Baja = _Fecha_Baja,
            Id_Empleados = _Id_Empleados
	WHERE id_usuario = _id_usuario;		
END;
$$
-- Invocacion del procedimiento almacenado actualizar Usuario
Call sp_actualizarUsuario(4,"anMolina",654321, 2, "2010/05/12", "2030/07/11", 11);

-- Crear procedimiento almacenado para eliminar un Usuario
DELIMITER $$
CREATE PROCEDURE sp_eliminarUsuario(IN _id_usuario int)
BEGIN
	DELETE
    FROM usuario
    WHERE id_usuario = _id_usuario;
END;
$$
-- Eliminar Empleado
call sp_eliminarUsuario(3);

-- Crear procedimiento almacenado para filtrar empleados
DELIMITER $$
CREATE PROCEDURE sp_mostrarUsuario(IN _id_usuario int)
BEGIN
	SELECT *
    FROM usuario
    WHERE id_usuario = _id_usuario;
END;	
$$

-- Invocar el procedimiento almacenado para filtrar los Usuarios
Call sp_mostrarUsuario(4);