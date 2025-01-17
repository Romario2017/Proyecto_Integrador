CREATE DATABASE IF NOT EXISTS `PI_DOGTOR`;
USE `PI_DOGTOR`;

/* ACCESO DE USUARIO */

CREATE TABLE TB_VISIBILIDAD (
	CODIGO_VISIBILIDAD INT NOT NULL AUTO_INCREMENT,
    NOMBRE_VISIBILIDAD VARCHAR(50) NOT NULL,
    PRIMARY KEY(CODIGO_VISIBILIDAD)
);

CREATE TABLE TB_DISTRITO (
	CODIGO_DISTRITO INT NOT NULL AUTO_INCREMENT,
    NOMBRE_DISTRITO VARCHAR(100) NOT NULL,
    PRIMARY KEY (CODIGO_DISTRITO)
);

CREATE TABLE TB_USUARIO (
	CODIGO_USUARIO INT NOT NULL AUTO_INCREMENT,
    EMAIL_USUARIO VARCHAR(255) NOT NULL UNIQUE,
    CONTRASENA_USUARIO VARCHAR(255) NOT NULL,
    NOMBRE_USUARIO VARCHAR(50) NOT NULL,
    APELLIDO_USUARIO VARCHAR(50) NOT NULL,
    FECHA_NACIMIENTO_USUARIO DATE NOT NULL,
    GENERO_USUARIO VARCHAR(50) DEFAULT NULL,
    DNI_USUARIO VARCHAR(8) DEFAULT NULL,
    DIRECCION_USUARIO VARCHAR(255) DEFAULT NULL,
    REFERENCIA_USUARIO VARCHAR(100) DEFAULT NULL,
    TELEFONO_USUARIO VARCHAR(15) DEFAULT NULL,
    TOKEN_USUARIO VARCHAR(255) DEFAULT NULL,
	CODIGO_DISTRITO INT NOT NULL,
    CODIGO_VISIBILIDAD INT NOT NULL,
    PRIMARY KEY (CODIGO_USUARIO),
    CONSTRAINT `TB_USUARIO_FK_TB_DISTRITO` FOREIGN KEY (CODIGO_DISTRITO) REFERENCES TB_DISTRITO (CODIGO_DISTRITO),
    CONSTRAINT `TB_USUARIO_FK_TB_VISIBILIDAD` FOREIGN KEY (CODIGO_VISIBILIDAD) REFERENCES TB_VISIBILIDAD (CODIGO_VISIBILIDAD)
);

CREATE TABLE TB_ROL_USUARIO (
	CODIGO_ROL_USUARIO INT NOT NULL AUTO_INCREMENT,
    NOMBRE_ROL_USUARIO VARCHAR(50) NOT NULL,
    PRIMARY KEY (CODIGO_ROL_USUARIO)
);

CREATE TABLE TB_DETALLE_USUARIO_ROL (
	CODIGO_USUARIO INT NOT NULL,
    CODIGO_ROL_USUARIO INT NOT NULL,
    PRIMARY KEY (CODIGO_USUARIO, CODIGO_ROL_USUARIO),
    CONSTRAINT `TB_DETALLE_USUARIO_ROL_FK_TB_USUARIO` FOREIGN KEY (CODIGO_USUARIO) REFERENCES TB_USUARIO (CODIGO_USUARIO),
    CONSTRAINT `TB_DETALLE_USUARIO_ROL_FK_TB_ROL_USUARIO` FOREIGN KEY (CODIGO_ROL_USUARIO) REFERENCES TB_ROL_USUARIO (CODIGO_ROL_USUARIO)
);

CREATE TABLE TB_ENLACE (
	CODIGO_ENLACE INT AUTO_INCREMENT NOT NULL,
    DESCRIPCION_ENLACE VARCHAR(50) NOT NULL,
    RUTA_ENLACE VARCHAR(255) NOT NULL,
    ICONO_ENLACE VARCHAR(50) NOT NULL,
    PRIMARY KEY (CODIGO_ENLACE)
);

CREATE TABLE TB_DETALLE_ROL_ENLACE (
	CODIGO_ROL_USUARIO INT NOT NULL,
    CODIGO_ENLACE INT NOT NULL,
    PRIMARY KEY (CODIGO_ROL_USUARIO, CODIGO_ENLACE),
    CONSTRAINT `TB_DETALLE_ROL_ENLACE_FK_TB_ROL` FOREIGN KEY (CODIGO_ROL_USUARIO) REFERENCES TB_ROL_USUARIO (CODIGO_ROL_USUARIO),
    CONSTRAINT `TB_DETALLE_ROL_ENLACE_FK_TB_ENLACE` FOREIGN KEY (CODIGO_ENLACE) REFERENCES TB_ENLACE (CODIGO_ENLACE)
);

/* NUEVA MASCOTA */

CREATE TABLE TB_ESPECIE_MASCOTA (
	CODIGO_ESPECIE_MASCOTA INT AUTO_INCREMENT NOT NULL,
    NOMBRE_ESPECIE_MASCOTA VARCHAR(100),
    PRIMARY KEY (CODIGO_ESPECIE_MASCOTA)
);

CREATE TABLE TB_RAZA_MASCOTA (
	CODIGO_RAZA_MASCOTA INT AUTO_INCREMENT NOT NULL,
    NOMBRE_RAZA_MASCOTA VARCHAR(100),
    CODIGO_ESPECIE_MASCOTA INT NOT NULL,
    PRIMARY KEY (CODIGO_RAZA_MASCOTA),
    CONSTRAINT `TB_RAZA_MASCOTA_FK_TB_ESPECIE_MASCOTA` FOREIGN KEY (CODIGO_ESPECIE_MASCOTA) REFERENCES TB_ESPECIE_MASCOTA (CODIGO_ESPECIE_MASCOTA)
);

CREATE TABLE TB_SEXO_MASCOTA (
	CODIGO_SEXO_MASCOTA INT AUTO_INCREMENT NOT NULL,
    NOMBRE_SEXO_MASCOTA VARCHAR(100),
    PRIMARY KEY (CODIGO_SEXO_MASCOTA)
);

CREATE TABLE TB_COLOR_MASCOTA (
	CODIGO_COLOR_MASCOTA INT AUTO_INCREMENT NOT NULL,
    NOMBRE_COLOR_MASCOTA VARCHAR(100),
    PRIMARY KEY (CODIGO_COLOR_MASCOTA)
);

CREATE TABLE TB_MASCOTA (
	CODIGO_MASCOTA INT AUTO_INCREMENT NOT NULL,
    CODIGO_PROPIETARIO INT NOT NULL,
    NOMBRE_MASCOTA VARCHAR(100),
    FOTO_MASCOTA LONGBLOB DEFAULT NULL,
    CODIGO_RAZA_MASCOTA INT NOT NULL,
    CODIGO_SEXO_MASCOTA INT NOT NULL,
    CODIGO_ESPECIE_MASCOTA INT NOT NULL,
    CODIGO_COLOR_MASCOTA INT NOT NULL,
    FECHA_NACIMIENTO_MASCOTA DATE DEFAULT NULL,
    CODIGO_IDENTIFICACION_MASCOTA VARCHAR(50) DEFAULT NULL,
    CODIGO_CARTILLA_SANITARIA VARCHAR(50) DEFAULT NULL,
    CODIGO_VISIBILIDAD INT NOT NULL,
    PRIMARY KEY (CODIGO_MASCOTA),
    CONSTRAINT `TB_MASCOTA_FK_TB_USUARIO` FOREIGN KEY (CODIGO_PROPIETARIO) REFERENCES TB_USUARIO (CODIGO_USUARIO),
    CONSTRAINT `TB_MASCOTA_FK_TB_RAZA_MASCOTA` FOREIGN KEY (CODIGO_RAZA_MASCOTA) REFERENCES TB_RAZA_MASCOTA (CODIGO_RAZA_MASCOTA),
    CONSTRAINT `TB_MASCOTA_FK_TB_SEXO_MASCOTA` FOREIGN KEY (CODIGO_SEXO_MASCOTA) REFERENCES TB_SEXO_MASCOTA (CODIGO_SEXO_MASCOTA),
    CONSTRAINT `TB_MASCOTA_FK_TB_ESPECIE_MASCOTA` FOREIGN KEY (CODIGO_ESPECIE_MASCOTA) REFERENCES TB_ESPECIE_MASCOTA (CODIGO_ESPECIE_MASCOTA),
    CONSTRAINT `TB_MASCOTA_FK_TB_COLOR_MASCOTA` FOREIGN KEY (CODIGO_COLOR_MASCOTA) REFERENCES TB_COLOR_MASCOTA (CODIGO_COLOR_MASCOTA),
    CONSTRAINT `TB_MASCOTA_FK_TB_VISIBILIDAD` FOREIGN KEY (CODIGO_VISIBILIDAD) REFERENCES TB_VISIBILIDAD (CODIGO_VISIBILIDAD)
);

/* SERVICIOS */

CREATE TABLE TB_ESPECIALIDAD (
	CODIGO_ESPECIALIDAD INT AUTO_INCREMENT NOT NULL,
    NOMBRE_ESPECIALIDAD VARCHAR(50) NOT NULL,
    PRIMARY KEY(CODIGO_ESPECIALIDAD)
);

CREATE TABLE TB_DIA_SEMANA (
	CODIGO_DIA_SEMANA INT AUTO_INCREMENT NOT NULL,
    NOMBRE_DIA_SEMANA VARCHAR(50) NOT NULL,
    PRIMARY KEY(CODIGO_DIA_SEMANA)
);

CREATE TABLE TB_TIPO_SERVICIO (
	CODIGO_TIPO_SERVICIO INT NOT NULL AUTO_INCREMENT,
    NOMBRE_TIPO_SERVICIO VARCHAR(255) NOT NULL,
    PRIMARY KEY (CODIGO_TIPO_SERVICIO)
);

CREATE TABLE TB_SERVICIO (
	CODIGO_SERVICIO INT NOT NULL AUTO_INCREMENT,
    CODIGO_TIPO_SERVICIO INT NOT NULL,
    CODIGO_ESPECIALIDAD INT NOT NULL,
    CODIGO_ESPECIALISTA INT NOT NULL,
    CODIGO_DIA_SEMANA INT NOT NULL,
	INICIO_TURNO_SERVICIO TIME NOT NULL, /* EN FUNCIÓN A LA FECHA ELEGIDA, SACAMOS EL DÍA Y HACEMOS SELECT DE HORAS EN ESE DÍA*/
    FIN_TURNO_SERVICIO TIME NOT NULL,
    NOMBRE_SERVICIO VARCHAR(100) NOT NULL,
    DESCRIPCION_SERVICIO TEXT NOT NULL,
    PRECIO_SERVICIO DOUBLE NOT NULL,
    LIMITE_DIARIO_SERVICIO INT NOT NULL,
    PRIMARY KEY(CODIGO_SERVICIO),
    CONSTRAINT `TB_HORARIO_FK_TB_TIPO_SERVICIO` FOREIGN KEY (CODIGO_TIPO_SERVICIO) REFERENCES TB_TIPO_SERVICIO(CODIGO_TIPO_SERVICIO),
    CONSTRAINT `TB_HORARIO_FK_TB_ESPECIALIDAD` FOREIGN KEY (CODIGO_ESPECIALIDAD) REFERENCES TB_ESPECIALIDAD(CODIGO_ESPECIALIDAD),
    CONSTRAINT `TB_HORARIO_FK_TB_USUARIO_ESPECIALISTA` FOREIGN KEY (CODIGO_ESPECIALISTA) REFERENCES TB_USUARIO(CODIGO_USUARIO),
    CONSTRAINT `TB_HORARIO_FK_TB_DIA_SEMANA` FOREIGN KEY (CODIGO_DIA_SEMANA) REFERENCES TB_DIA_SEMANA(CODIGO_DIA_SEMANA)
);

CREATE TABLE TB_ESTADO_CITA (
	CODIGO_ESTADO_CITA INT AUTO_INCREMENT NOT NULL,
    NOMBRE_ESTADO_CITA VARCHAR(50) NOT NULL,
    PRIMARY KEY (CODIGO_ESTADO_CITA)
);

CREATE TABLE TB_CITA (
	CODIGO_CITA INT AUTO_INCREMENT NOT NULL,
    FECHA_SOLICITUD_CITA DATE NOT NULL, /* Cuándo se genera la cita */ 
    FECHA_PROGRAMADA_CITA DATE NOT NULL, /* Día, mes, año */
    CODIGO_SERVICIO INT NOT NULL, /* Será en rango horario asociado a servicio por orden de llegada */
    CODIGO_PROPIETARIO INT NOT NULL,
    CODIGO_MASCOTA INT NOT NULL,
	CODIGO_ESTADO_CITA INT NOT NULL,
    MOTIVO_CITA TEXT NOT NULL,
    CONSTRAINT `TB_CITA_FK_TB_SERVICIO` FOREIGN KEY (CODIGO_SERVICIO) REFERENCES TB_SERVICIO (CODIGO_SERVICIO),
    CONSTRAINT `TB_CITA_FK_TB_USUARIO_PROPIETARIO` FOREIGN KEY (CODIGO_PROPIETARIO) REFERENCES TB_USUARIO (CODIGO_USUARIO),
	CONSTRAINT `TB_CITA_FK_TB_MASCOTA` FOREIGN KEY (CODIGO_MASCOTA) REFERENCES TB_MASCOTA (CODIGO_MASCOTA),
	CONSTRAINT `TB_CITA_FK_TB_ESTADO_CITA` FOREIGN KEY (CODIGO_ESTADO_CITA) REFERENCES TB_ESTADO_CITA (CODIGO_ESTADO_CITA),
	PRIMARY KEY (CODIGO_CITA)
);

CREATE TABLE TB_HISTORIAL_CLINICO (
	CODIGO_HISTORIAL_CLINICO INT AUTO_INCREMENT NOT NULL,
    CODIGO_MASCOTA INT NOT NULL,
	CODIGO_ESPECIALISTA INT NOT NULL, /* TB_USUARIO */
    FECHA_CREACION_HISTORIAL_CLINICO DATE NOT NULL,
    PRIMARY KEY (CODIGO_HISTORIAL_CLINICO),
    CONSTRAINT `TB_HISTORIAL_CLINICO_FK_TB_MASCOTA` FOREIGN KEY (CODIGO_MASCOTA) REFERENCES TB_MASCOTA (CODIGO_MASCOTA),
    CONSTRAINT `TB_HISTORIAL_CLINICO_FK_TB_ESPECIALISTA` FOREIGN KEY (CODIGO_ESPECIALISTA) REFERENCES TB_USUARIO (CODIGO_USUARIO)
);

CREATE TABLE TB_DETALLE_CITA_HISTORIAL_CLINICO (
	CODIGO_CITA INT NOT NULL,
    CODIGO_HISTORIAL_CLINICO INT NOT NULL,
    FECHA_DETALLE_CITA_HISTORIAL_CLINICO DATE NOT NULL,
	MOTIVO_DETALLE_CITA_HISTORIAL_CLINICO TEXT NOT NULL,
    PRIMARY KEY (CODIGO_CITA, CODIGO_HISTORIAL_CLINICO),
    CONSTRAINT `TB_DETALLE_CITA_HISTORIA_CLINICO_FK_TB_CITA` FOREIGN KEY (CODIGO_CITA) REFERENCES TB_CITA (CODIGO_CITA),
    CONSTRAINT `TB_DETALLE_CITA_HISTORIA_CLINICO_FK_TB_HISTORIAL_CLINICO` FOREIGN KEY (CODIGO_HISTORIAL_CLINICO) REFERENCES TB_HISTORIAL_CLINICO (CODIGO_HISTORIAL_CLINICO)
);

/* PRODUCTOS */

CREATE TABLE TB_MARCA (
	CODIGO_MARCA INT NOT NULL AUTO_INCREMENT,
    NOMBRE_MARCA VARCHAR(255) NOT NULL,
    PRIMARY KEY (CODIGO_MARCA)
);

CREATE TABLE TB_PROVEEDOR (
	CODIGO_PROVEEDOR INT NOT NULL AUTO_INCREMENT,
    NOMBRE_PROVEEDOR VARCHAR(255) NOT NULL,
    PRIMARY KEY (CODIGO_PROVEEDOR)
);

CREATE TABLE TB_CATEGORIA_PRODUCTO (
	CODIGO_CATEGORIA_PRODUCTO INT NOT NULL AUTO_INCREMENT,
    NOMBRE_CATEGORIA_PRODUCTO VARCHAR(255) NOT NULL,
    PRIMARY KEY (CODIGO_CATEGORIA_PRODUCTO)
);

CREATE TABLE TB_PRODUCTO (
	CODIGO_PRODUCTO INT NOT NULL AUTO_INCREMENT,
    NOMBRE_PRODUCTO VARCHAR(255) NOT NULL,
    DESCRIPCION_SIMPLE_PRODUCTO TEXT NOT NULL,
    DESCRIPCION_HTML_PRODUCTO TEXT DEFAULT NULL,
    PRECIO_PRODUCTO DOUBLE NOT NULL,
    STOCK_PRODUCTO INT NOT NULL, /* UNIDADES EN EXISTENCIA */
    PEDIDO_PRODUCTO INT NOT NULL, /* UNIDADES EN PEDIDO - CONTROL DE STOCK VS PEDIDOS*/
    SERIE_PRODUCTO VARCHAR(50) NOT NULL,
    FOTO1_PRODUCTO LONGBLOB DEFAULT NULL,
    FOTO2_PRODUCTO LONGBLOB DEFAULT NULL,
    FOTO3_PRODUCTO LONGBLOB DEFAULT NULL,
    CODIGO_MARCA INT NOT NULL,
    CODIGO_CATEGORIA_PRODUCTO INT NOT NULL,
    CODIGO_PROVEEDOR INT NOT NULL,
    PRIMARY KEY (CODIGO_PRODUCTO),
    CONSTRAINT `TB_PRODUCTO_FK_TB_MARCA` FOREIGN KEY (CODIGO_MARCA) REFERENCES TB_MARCA (CODIGO_MARCA),
    CONSTRAINT `TB_PRODUCTO_FK_TB_CATEGORIA_PRODUCTO` FOREIGN KEY (CODIGO_CATEGORIA_PRODUCTO) REFERENCES TB_CATEGORIA_PRODUCTO (CODIGO_CATEGORIA_PRODUCTO),
    CONSTRAINT `TB_PRODUCTO_FK_TB_PROVEEDOR` FOREIGN KEY (CODIGO_PROVEEDOR) REFERENCES TB_PROVEEDOR (CODIGO_PROVEEDOR)
);

CREATE TABLE TB_ESTADO_PEDIDO (
	CODIGO_ESTADO_PEDIDO INT AUTO_INCREMENT NOT NULL,
    NOMBRE_ESTADO_PEDIDO VARCHAR(50) NOT NULL,
    PRIMARY KEY (CODIGO_ESTADO_PEDIDO)
);

CREATE TABLE TB_PEDIDO (
	CODIGO_PEDIDO INT NOT NULL AUTO_INCREMENT,
    CODIGO_CLIENTE INT NOT NULL, /* TB_USUARIO*/
    FECHA_SOLICITUD_PEDIDO DATE NOT NULL,
    FECHA_ENTREGA_PEDIDO DATE NOT NULL,
    /*HORA_ENTREGA_PEDIDO TIME NOT NULL,*/ /* EVALUAR POSIBLE INTEGRACIÓN DE RANGO HORARIO DE ENTREGA */
    MONTO_PEDIDO DOUBLE NOT NULL,
    CODIGO_REPARTIDOR INT NOT NULL, /* TB_USUARIO*/
    CODIGO_ESTADO_PEDIDO INT NOT NULL,
    PRIMARY KEY (CODIGO_PEDIDO),
    CONSTRAINT `TB_PEDIDO_FK_TB_USUARIO_CLIENTE` FOREIGN KEY (CODIGO_CLIENTE) REFERENCES TB_USUARIO (CODIGO_USUARIO),
    CONSTRAINT `TB_PEDIDO_FK_TB_USUARIO_REPARTIDOR` FOREIGN KEY (CODIGO_REPARTIDOR) REFERENCES TB_USUARIO (CODIGO_USUARIO),
    CONSTRAINT `TB_PEDIDO_FK_TB_ESTADO_PEDIDO` FOREIGN KEY (CODIGO_ESTADO_PEDIDO) REFERENCES TB_ESTADO_PEDIDO (CODIGO_ESTADO_PEDIDO)
);

/*
CREATE TABLE TB_DETALLE_PEDIDO_PRODUCTO (
	CODIGO_PEDIDO INT NOT NULL,
    CODIGO_PRODUCTO INT NOT NULL,
    CANTIDAD_DETALLE INT NOT NULL,
    PRECIO_DETALLE DOUBLE NOT NULL,
    PRIMARY KEY (CODIGO_PEDIDO, CODIGO_PRODUCTO),
    CONSTRAINT `TB_DETALLE_PEDIDO_PRODUCTO_FK_TB_PEDIDO` FOREIGN KEY (CODIGO_PEDIDO) REFERENCES TB_PEDIDO (CODIGO_PEDIDO),
    CONSTRAINT `TB_DETALLE_PEDIDO_PRODUCTO_FK_TB_PRODUCTO` FOREIGN KEY (CODIGO_PRODUCTO) REFERENCES TB_PRODUCTO (CODIGO_PRODUCTO)
);
*/

/* BOLETA */

CREATE TABLE TB_TIPO_BOLETA (
	CODIGO_TIPO_BOLETA INT NOT NULL AUTO_INCREMENT,
    NOMBRE_TIPO_BOLETA VARCHAR(50), /* BOLETA DE PRODUCTO O BOLETA DE SERVICIO */
    PRIMARY KEY (CODIGO_TIPO_BOLETA)
);

CREATE TABLE TB_BOLETA (
	CODIGO_BOLETA INT NOT NULL AUTO_INCREMENT,
    FECHA_BOLETA DATE NOT NULL,
    CODIGO_CLIENTE INT NOT NULL,
    CODIGO_VENDEDOR INT NOT NULL,
    CODIGO_TIPO_BOLETA INT NOT NULL,
    CODIGO_PEDIDO INT DEFAULT NULL,
    CODIGO_CITA INT DEFAULT NULL,
    PRIMARY KEY (CODIGO_BOLETA),
    CONSTRAINT `TB_BOLETA_FK_TB_USUARIO_CLIENTE` FOREIGN KEY (CODIGO_CLIENTE) REFERENCES TB_USUARIO (CODIGO_USUARIO),
    CONSTRAINT `TB_BOLETA_FK_TB_USUARIO_VENDEDOR` FOREIGN KEY (CODIGO_VENDEDOR) REFERENCES TB_USUARIO (CODIGO_USUARIO),
    CONSTRAINT `TB_BOLETA_FK_TB_TIPO_BOLETA` FOREIGN KEY (CODIGO_TIPO_BOLETA) REFERENCES TB_TIPO_BOLETA (CODIGO_TIPO_BOLETA),
    CONSTRAINT `TB_BOLETA_FK_TB_PEDIDO` FOREIGN KEY (CODIGO_PEDIDO) REFERENCES TB_PEDIDO (CODIGO_PEDIDO),
    CONSTRAINT `TB_BOLETA_FK_TB_CITA` FOREIGN KEY (CODIGO_CITA) REFERENCES TB_CITA (CODIGO_CITA)
);

CREATE TABLE TB_DETALLE_BOLETA_PRODUCTO (
    CODIGO_BOLETA INT NOT NULL,
    CODIGO_PRODUCTO INT NOT NULL,
    CANTIDAD_PRODUCTO INT NOT NULL,
    PRECIO_PRODUCTO DOUBLE NOT NULL,
    PRIMARY KEY(CODIGO_BOLETA, CODIGO_PRODUCTO),
    CONSTRAINT `TB_DETALLE_BOLETA_PRODUCTO_FK_TB_BOLETA` FOREIGN KEY (CODIGO_BOLETA) REFERENCES TB_BOLETA(CODIGO_BOLETA),
    CONSTRAINT `TB_DETALLE_BOLETA_PRODUCTO_FK_TB_PRODUCTO` FOREIGN KEY (CODIGO_PRODUCTO) REFERENCES TB_PRODUCTO(CODIGO_PRODUCTO)
);

CREATE TABLE TB_DETALLE_BOLETA_SERVICIO (
    CODIGO_BOLETA INT NOT NULL,
    CODIGO_SERVICIO INT NOT NULL,
    CANTIDAD_SERVICIO INT NOT NULL,
    PRECIO_SERVICIO DOUBLE NOT NULL,
    PRIMARY KEY (CODIGO_BOLETA, CODIGO_SERVICIO),
    CONSTRAINT `TB_DETALLE_BOLETA_SERVICIO_FK_TB_BOLETA` FOREIGN KEY (CODIGO_BOLETA) REFERENCES TB_BOLETA(CODIGO_BOLETA),
    CONSTRAINT `TB_DETALLE_BOLETA_SERVICIO_FK_TB_PRODUCTO` FOREIGN KEY (CODIGO_SERVICIO) REFERENCES TB_SERVICIO(CODIGO_SERVICIO)
);