
CREATE TABLE usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    correo VARCHAR(255) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE superAdmin (
    idAdmin INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL -- Debes usar un mecanismo de encriptación para este campo
);
CREATE TABLE servicios (
    idServicio INT AUTO_INCREMENT PRIMARY KEY,
    tipoServicio VARCHAR(100) NOT NULL,  -- Pilates, Reformer, etc.
    precio DECIMAL(10,2) NOT NULL,       -- Precio del servicio
    numSesiones INT NOT NULL             -- Número de sesiones incluidas
);
CREATE TABLE compras (
    idCompra INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT,
    idServicio INT,
    fechaCompra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario),
    FOREIGN KEY (idServicio) REFERENCES servicios(idServicio)
);
Create table Paquetes(
    id int(11) AUTO_INCREMENT primary key,
    nombre varchar(50) not null,
    sesiones int(11) not null,
    precio decimal(10,2) not null
);

