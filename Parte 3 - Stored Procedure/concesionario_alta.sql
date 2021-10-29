CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_concesionario_alta`(
	-- Parametros a recibir
	in pId int,
	in pNombre varchar(45), 
    in pDireccion varchar(45), 
    in pActivo boolean,
    in pTelefono varchar(45))
BEGIN -- Inicio de procedimiento
	-- Se crean dos variables a devolver
	DECLARE cMensaje varchar(45) DEFAULT "";
    DECLARE nResultado int DEFAULT 0;
    -- Si el ID ya existe, se cargan variables con mensajes de Error
	IF EXISTS(select id_concesionario from concesionario where id_concesionario=pId) THEN
		set cMensaje = "El concesionario ya existe en BD!";
        set nResultado = -1;
	-- Sino, se ingresan datos y cargan mensajes de Exito
	ELSE
		insert into concesionario(id_concesionario, nombre, direccion, activo, telefono) values (pId, pNombre, pDireccion, pActivo, pTelefono);
        set cMensaje = "Ingreso exitoso!";
        set nResultado = 0;
	END IF;
    -- Retorna los mensajes
    SELECT nResultado, cMensaje;
END