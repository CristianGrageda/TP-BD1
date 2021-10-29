/*
	TP Base de Datos 1
	Grupo 24
*/
-- Creacion de la Base de Datos
CREATE SCHEMA IF NOT EXISTS automotriz;

-- Usar Base de Datos
USE automotriz;

-- -- Creacion de Tablas -- --

-- Modelo
CREATE TABLE modelo(
	id_modelo int primary key AUTO_INCREMENT,
    nombre varchar(45) not null
);

-- Concensionario
CREATE TABLE concesionario(
	id_concesionario int primary key AUTO_INCREMENT,
    nombre varchar(45) not null,
    direccion varchar(45) not null,
    activo boolean not null,
    telefono varchar(45)
);

-- Pedido
CREATE TABLE pedido(
	numero int primary key AUTO_INCREMENT,
    fecha_hora datetime not null,
    concesionario_id_concesionario int not null,
    activo boolean not null,
    foreign key (concesionario_id_concesionario) references concesionario(id_concesionario)
);

-- Tabla intermedia Modelo - Pedido
CREATE TABLE detalle_del_pedido(
	cantidad int not null,
    modelo_id_modelo int not null,
    pedido_numero int not null,
    foreign key (modelo_id_modelo) references modelo(id_modelo),
    foreign key (pedido_numero) references pedido(numero)
);

-- Automovil
CREATE TABLE automovil(
	numero_de_chasis varchar(45) primary key,
    patente varchar(45) not null,
    fecha_finalizacion datetime,
    modelo_id_modelo int not null,
    pedido_numero int not null,
    foreign key (modelo_id_modelo) references modelo(id_modelo),
    foreign key (pedido_numero) references pedido(numero)
);

-- Linea de Montaje
CREATE TABLE linea_de_montaje(
	idlinea_de_montaje int primary key AUTO_INCREMENT,
    modelo_id_modelo int not null,
    foreign key (modelo_id_modelo) references modelo(id_modelo)
);

-- Tarea
CREATE TABLE tarea(
	id_tarea int primary key AUTO_INCREMENT,
    nombre varchar(45) not null
);

-- Estacion
CREATE TABLE estacion(
	id_estacion int primary key AUTO_INCREMENT,
    orden int not null,
    tarea_id_tarea int not null,
    linea_de_montaje_idlinea_de_montaje int not null,
    foreign key (tarea_id_tarea) references tarea(id_tarea),
    foreign key (linea_de_montaje_idlinea_de_montaje) references linea_de_montaje(idlinea_de_montaje)
);

-- Tabla Intermedia Estacion - Automovil
CREATE TABLE estacion_CON_automovil(
	fecha_hora_ingreso datetime not null,
    fecha_hora_egreso datetime not null,
    estacion_id_estacion int not null,
    automovil_numero_de_chasis varchar(45) not null,
    foreign key (estacion_id_estacion) references estacion(id_estacion),
    foreign key (automovil_numero_de_chasis) references automovil(numero_de_chasis)
);

-- Insumo
CREATE TABLE insumo(
	codigo_insumo int primary key AUTO_INCREMENT,
    descripcion_insumo varchar(45) not null,
    precio_insumo float not null,
    activo boolean not null
);

-- Tabla Intermedia Tarea - Insumo
CREATE TABLE tarea_CON_insumo(
	cantidad float not null,
    insumo_codigo_insumo int not null,
    tarea_id_tarea int not null,
    foreign key (insumo_codigo_insumo) references insumo(codigo_insumo),
    foreign key (tarea_id_tarea) references tarea(id_tarea)
);

-- Proveedor
CREATE TABLE proveedor(
	id_proveedor int primary key AUTO_INCREMENT,
    nombre_proveedor varchar(45) not null,
    direccion_proveedor varchar(45) not null,
    activo boolean not null,
    telefono_proveedor varchar(45)
);

-- Compra
CREATE TABLE compra(
	numero_compra int primary key AUTO_INCREMENT,
    fecha_hora datetime not null,
    proveedor_id_proveedor int not null,
    foreign key (proveedor_id_proveedor) references proveedor(id_proveedor)
);

-- Tabla Intermedia Compra- Insumo
CREATE TABLE detalle_compra_insumo(
	precio float not null,
    cantidad int not null,
    compra_numero_compra int not null,
    insumo_codigo_insumo int not null,
    foreign key (compra_numero_compra) references compra(numero_compra),
	foreign key (insumo_codigo_insumo) references insumo(codigo_insumo)
);

-- Ver tablas de la Base de Datos
SHOW TABLES;