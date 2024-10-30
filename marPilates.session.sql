Use  marpilatesdatabase;

-- Crear tabla de usuarios
CREATE TABLE usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    correo VARCHAR(255) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol ENUM('normal', 'super') DEFAULT 'normal',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla de servicios
CREATE TABLE servicios (
    idServicio INT AUTO_INCREMENT PRIMARY KEY,
    tipoServicio VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    numSesiones INT NOT NULL
);

-- Crear tabla de compras
CREATE TABLE compras (
    idCompra INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    idServicio INT NOT NULL,
    fechaCompra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario),
    CONSTRAINT fk_servicio FOREIGN KEY (idServicio) REFERENCES servicios(idServicio),
    INDEX (idUsuario),
    INDEX (idServicio)
);

--Triger para eliminar compras cuando se borra un usuario
CREATE TRIGGER borrar_compras_usuario
AFTER DELETE ON usuarios
FOR EACH ROW
BEGIN
    DELETE FROM compras WHERE idUsuario = OLD.idUsuario;
END;
--Trigger para establecer idServicio en null cuando se borra un servicio
CREATE TRIGGER set_null_servicio
AFTER DELETE ON servicios
FOR EACH ROW
BEGIN
    UPDATE compras SET idServicio = NULL WHERE idServicio = OLD.idServicio;
END;




drop TABLE if EXISTS usuarios;

drop table  if exists compras;

drop table if exists servicios;