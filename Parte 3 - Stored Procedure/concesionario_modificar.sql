CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_concesionario_modificar`(
	-- Parametros a recibir
	in pId int,
	in pNombre varchar(45), 
    in pDireccion varchar(45),
    in pTelefono varchar(45))
BEGIN -- Inicio de procedimiento
	-- Se crean dos variables a devolver
	DECLARE cMensaje varchar(45) DEFAULT "";
    DECLARE nResultado int DEFAULT 0;
    -- Si el ID existe, se modifican los valores
	IF EXISTS(select id_concesionario from concesionario where id_concesionario=pId) THEN
		update concesionario set nombre = pNombre, direccion=pDireccion, telefono=pTelefono where id_concesionario=pId;
		set cMensaje = "Modificacion exitosa!";
        set nResultado = 0;
	-- Sino, se cargan mensajes de error
	ELSE
		
        set cMensaje = "Error, ID no existe en BD!";
        set nResultado = -1;
	END IF;
    -- Retorna los mensajes
    SELECT nResultado, cMensaje;
END