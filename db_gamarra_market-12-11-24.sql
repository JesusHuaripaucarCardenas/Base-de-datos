-- Crear la base de datos
CREATE DATABASE db_gamarra_market;

-- Usar la base de datos recién creada
USE db_gamarra_market;

-- Tabla CLIENTE
CREATE TABLE CLIENTE (
    id INT PRIMARY KEY,
    tipo_documento CHAR(3) NOT NULL,
    numero_documento CHAR(15) NOT NULL,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    email VARCHAR(80),
    celular CHAR(9),
    fecha_nacimiento DATE,
    activo BOOLEAN
);

-- Tabla VENDEDOR
CREATE TABLE VENDEDOR (
    id INT PRIMARY KEY,
    tipo_documento CHAR(3) NOT NULL,
    numero_documento CHAR(15) NOT NULL,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    salario DECIMAL(8,2),
    celular CHAR(9),
    email VARCHAR(80),
    activo BOOLEAN
);

-- Tabla VENTA
CREATE TABLE VENTA (
    id INT PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL,
    activo BOOLEAN,
    cliente_id INT,
    vendedor_id INT
);

-- Tabla PRENDA
CREATE TABLE PRENDA (
    id INT PRIMARY KEY,
    descripcion VARCHAR(90) NOT NULL,
    marca VARCHAR(60),
    cantidad INT,
    talla VARCHAR(10),
    precio DECIMAL(8,2),
    activo BOOLEAN
);

-- Tabla VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    id INT PRIMARY KEY,
    cantidad INT NOT NULL,
    venta_id INT,
    prenda_id INT
);


-- Relación entre CLIENTE y VENTA
ALTER TABLE VENTA
ADD CONSTRAINT fk_cliente_venta
FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id);

-- Relación entre VENDEDOR y VENTA
ALTER TABLE VENTA
ADD CONSTRAINT fk_vendedor_venta
FOREIGN KEY (vendedor_id) REFERENCES VENDEDOR(id);

-- Relación entre VENTA y VENTA_DETALLE
ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT fk_venta_venta_detalle
FOREIGN KEY (venta_id) REFERENCES VENTA(id);

-- Relación entre PRENDA y VENTA_DETALLE
ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT fk_prenda_venta_detalle
FOREIGN KEY (prenda_id) REFERENCES PRENDA(id);

-- Ver las tablas creadas
SHOW TABLES;


-- Eliminar una columna 
ALTER TABLE CLIENTE
DROP COLUMN nombres;


-- Eliminar la tabla CLIENTE
DROP TABLE CLIENTE;

-- Agregar datos a la tabla Cliente --
INSERT INTO CLIENTE (id, tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo)
VALUES
    (1, 'DNI', '77889955', 'Alberto', 'Solano Pariona', 'alberto.pariona@empresa.com', '998456103', '1970-02-10', 1),
    (2, 'CNE', '45781233', 'Alicia', 'Garcia Campos', '', '956478921', '1965-03-01', 1),
    (3, 'CNE', '45221365', 'Juana', 'Ávila Chuquipata', 'juana.avila@gmail.com', '923568741', '1986-06-04', 1),
    (4, 'DNI', '85412637', 'Alberto', 'Palacios', 'alberto.palacios@empresa.com', '999254611', '1990-04-03', 1),
    (5, 'CNE', '21345678', 'Claudia', 'Zavala', 'claudia.marquez@gmail.com', '993147852', '1980-02-22', 1),
    (6, 'DNI', '45761345', 'Manolo', 'Barrios Martínez', '', '985236147', '1985-03-05', 1),
    (7, 'CNE', '43513557', 'Rafael', 'Barrios Huayhua', '', '945236985', '1992-06-03', 1),
    (8, 'DNI', '42521365', 'Aladino', 'Jimenez Huayhua', '', '955321654', '2000-01-13', 1),
    (9, 'CNE', '45741536', 'Ismael', 'Huapaya Velez', 'mario.rodriguez@outlook.com', '952147589', '1987-09-11', 1),
    (10, 'CNE', '45789321', 'Pedro', 'Rodríguez Mayo', 'luis.guerra@yahoo.com', '988514725', '1995-02-12', 1),
    (11, 'DNI', '45211367', 'Candela Valenzuela', '', 'pedro.candela@gmail.com', '941285734', '1987-08-23', 1),
    (12, 'CNE', '41162537', 'Apolonia', 'Rojas Avila', 'candela.rojas@yahoo.com', '973251456', '1999-06-23', 1),
    (13, 'CNE', '43513556', 'Hilario Flores', 'Huapaya', 'octavio.marquez@outlook.com', '955214365', '1998-11-20', 1),
    (14, 'DNI', '75472186', 'Octavio', 'Marquez Osorio', 'octavio.marquez@outlook.com', '966523141', '2003-09-22', 1),
    (15, 'CNE', '55689347', 'Manolo', 'Vasquez Saravia', 'manolo.vasquez@outlook.es', '', '1995-12-10', 1),
    (16, 'DNI', '41553657', 'Genoveva', 'Ortiz Quispe', 'genoveva.ortiz@outlook.es', '968214365', '2003-04-12', 1),
    (17, 'DNI', '49952171', 'Oscar', 'Cruz Cabrera', 'oscar.cruz@outlook.es', '962371415', '2002-08-25', 1),
    (18, 'DNI', '43513557', 'Veronica', 'Romero Vargas', '', '983221345', '1994-08-25', 1),
    (19, 'CNE', '49952171', 'Eliseo', 'Prada Ortiz', '', '978214369', '2004-09-15', 1);


-- Agregar datos a la tabla VENDEDOR --
INSERT INTO VENDEDOR (id, tipo_documento, numero_documento, nombres, apellidos, salario, celular, email, activo)
VALUES
    (1, 'DNI', '85471236', 'Enrique', 'Pérez Manco', 1500.00, '96521873', 'enrique.perez@outlook.com', 1),
    (2, 'DNI', '47259136', 'Sofía', 'Ávila Solis', 1500.00, '', 'sofia.avila@gmail.com', 1),
    (3, 'CNE', '61542820', 'Marcela', 'Napaico Cama', 1500.00, '965874357', 'marcela.napaico@gmail.com', 1),
    (4, 'DNI', '742536140', 'Carmelo', 'Rodriguez Chauca', 1550.00, '', 'carmelo.rodriguez@yahoo.com', 1);

-- Agregar datos a la tabla VENDEDOR --
INSERT INTO PRENDA (id, descripcion, marca, cantidad, talla, precio, activo)
VALUES
    (1, 'Pantalon Jeans', 'Levis', 60, 28, 65.80, 1),
    (2, 'Camisa manga corta', 'Adams', 15, 14, 55.00, 1),
    (3, 'Polo sport', 'Australia', 100, 16, 42.50, 1),
    (4, 'Camisa manga larga', 'Newport', 85, 12, 41.50, 1),
    (5, 'Pijama para caballero', 'Adams', 100, 14, 50.00, 1),
    (6, 'Corbata', 'Maxwell', 85, '', 25.00, 1),
    (7, 'Pijama para dama', 'Adams', 100, 14, 50.00, 1),
    (8, 'Camisa Sport', 'Adams', 80, '', 55.00, 1),
    (9, 'Shorts Jeans', 'Pepe Jeans', 185, 28, 77.80, 1);
    
-- Agregar datos a la tabla VENTA --
INSERT INTO VENTA (id, fecha_hora, cliente_id, vendedor_id, activo)
VALUES
    (1, '2023-05-01 19:04:08', 4, 1, 1),
    (2, '2023-04-04 18:10:01', 3, 2, 1),
    (3, '2023-05-12 20:15:19', 5, 4, 1);

-- Agregar datos a la tabla VENTA DETALLE --
INSERT INTO VENTA_DETALLE (id, cantidad, venta_id, prenda_id)
VALUES
    (1, 1, 3, 1),
    (2, 1, 6, 4),
    (3, 2, 5, 7),
    (4, 2, 7, 8),
    (5, 2, 8, 2),
    (6, 3, 3, 5),
    (7, 3, 4, 4),
    (8, 4, 2, 6),
    (9, 4, 1, 7),
    (10, 4, 5, 1);

-- Actualizar el número de celular de Mario Rodríguez Mayo --
UPDATE CLIENTE
SET celular = '922881101'
WHERE nombres = 'Mario' AND apellidos = 'Rodríguez Mayo';

-- Actualizar el número de celular del cliente con DNI 53298147 --
UPDATE CLIENTE
SET celular = '977226604'
WHERE numero_documento = '53298147';

-- Eliminar lógicamente los clientes --
UPDATE CLIENTE
SET activo = 0
WHERE numero_documento IN ('11453265', '74142585', '49985471');

-- Actualizar los números de celular --
UPDATE CLIENTE
   SET celular = NULL
WHERE numero_documento IN ('87952514', '55869321', '74142585');

-- Actualizar el correo electrónico --
UPDATE CLIENTE
   SET email = 'oscar.quiroz@yahoo.es', activo = 1
WHERE nombres = 'Oscar César' AND apellidos = 'Quiroz Zavala';

-- Agregar nuevos clientes y un vendedor --

   -- Insertar clientes nuevos
   INSERT INTO CLIENTE (id, tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo)
   VALUES 
   (20, 'DNI', '88235463', 'Gustavo Tadeo', 'Quispe Solorzano', 'gustavo.quispe@gmail.com', '930114523', '2001-10-13', 1),
   (21, 'DNI', '15735955', 'Daniela', 'Solis Vargas', 'daniela.solis@outlook.com', NULL, '1993-11-09', 1),
   (22, 'DNI', '78455236', 'Milton Gregorio', 'Vasquez Arce', 'milton.gregorio@yahoo.com', '974815233', '1986-12-14', 1),
   (23, 'DNI', '47441791', 'Veronica', 'Ancajima Arana', 'veronica.ancajima@yahoo.com', '966014027', '2000-05-07', 1),
   (24, 'DNI', '64521389', 'Felicia', 'Martinez Mendo', 'felicia.martinez@outlook.com', '960147500', '1987-11-11', 1),
   (25, 'DNI', '51425956', 'Luhana', 'Ortiz Rodriguez', 'luhana.ortiz@outlook.com', '966014517', '1988-11-25', 1);

   -- Insertar vendedor nuevo (si es necesario agregar)
   INSERT INTO VENDEDOR (id, tipo_documento, numero_documento, nombres, apellidos, salario, celular, email, activo)
   VALUES 
   (5, 'DNI', '12345678', 'Jesús', 'Canales', 1600.00, '999887766', 'jesus.canales@gmail.com', 1);

-- Actualizar el precio de la prenda "Polo sport" --
UPDATE PRENDA
   SET precio = 45.00
WHERE descripcion = 'Polo sport' AND marca = 'Australia';
   
-- Cambiar el nombre de la prenda "Corbata" --
UPDATE PRENDA
   SET descripcion = 'Corbata Michi elegante'
WHERE descripcion = 'Corbata';
   
-- Eliminar físicamente --
DELETE FROM PRENDA
WHERE descripcion IN ('Camisa manga corta', 'Camisa Sport');
   
-- Eliminar físicamente la vendedora "Marcela Napaico Cama" --
DELETE FROM VENDEDOR
WHERE nombres = 'Marcela' AND apellidos = 'Napaico Cama';

-- Eliminar físicamente los clientes cuyos documentos son --
DELETE FROM CLIENTE
WHERE numero_documento IN ('47142536', '77889955');

-- Eliminar clientes nacidos en el año 1980 --
DELETE FROM CLIENTE
WHERE YEAR(fecha_nacimiento) = 1980;

-- Eliminar la base de datos
DROP DATABASE db_gamarra_market;