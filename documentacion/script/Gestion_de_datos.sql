-- 1. Crear la tabla 'answer' que almacena los datos de las respuestas sobre la cual se realizan las consultas
CREATE TABLE answer (
    identifier INT NOT NULL COMMENT 'Almacena los datos de las respuestas al momento de hacer una consulta',
    moderator VARCHAR(120) NOT NULL COMMENT 'Contiene los datos de los moderadores responsables de atender las consultas',
    record DATETIME NOT NULL COMMENT 'Contiene la respuesta de atención del asesor',
    moderator_identifier INT NOT NULL COMMENT 'Identificador único y numérico para cada moderador',
    date TIMESTAMP NOT NULL COMMENT 'Contiene la fecha y hora en que se registra la respuesta a la consulta',
    query VARCHAR(250) NOT NULL COMMENT 'Almacena los datos que se registran al momento de hacer una consulta',
    CONSTRAINT answer_pk PRIMARY KEY (identifier)  -- Definimos la clave primaria en 'identifier'
) COMMENT='Contiene los datos de las respuestas sobre la cual se realizan las consultas';

-- 2. Crear la tabla 'consult' que almacena los datos de las consultas realizadas
CREATE TABLE consult (
    identifier INT NOT NULL COMMENT 'Identificador único y numérico para cada consulta',
    user VARCHAR(120) NOT NULL COMMENT 'Datos personales de los usuarios',
    query_content VARCHAR(250) NOT NULL COMMENT 'Dirigida sobre el ODS 9 o aplicativo',
    date TIMESTAMP NOT NULL COMMENT 'Contiene la fecha y hora en que se registra la consulta',
    record DATETIME NOT NULL COMMENT 'Contiene las consultas de atención del asesor',
    users_identifier INT NOT NULL COMMENT 'Identificador único y numérico de cada usuario',
    response_identifier INT NOT NULL COMMENT 'Contiene los datos de las respuestas sobre la cual se realizan las consultas',
    CONSTRAINT consult_pk PRIMARY KEY (identifier)  -- Definimos la clave primaria en 'identifier'
) COMMENT='Almacena los datos que se registran al momento de hacer una consulta';

-- 3. Crear la tabla 'moderator' que contiene los datos de los moderadores responsables de atender las consultas
CREATE TABLE moderator (
    identifier INT NOT NULL COMMENT 'Identificador único y numérico para cada moderador',
    area CHAR(1) NOT NULL COMMENT 'Página web o aplicativo',
    name VARCHAR(70) NOT NULL COMMENT 'Nombre del moderador',
    lastname VARCHAR(70) NOT NULL COMMENT 'Apellido del moderador',
    email VARCHAR(120) NOT NULL COMMENT 'Contiene el correo del moderador',
    query_type CHAR(1) NOT NULL COMMENT 'Dirigida respecto al ODS 9 o aplicativo',
    record DATETIME NOT NULL COMMENT 'Fecha en que se registra los datos del moderador',
    CONSTRAINT moderator_pk PRIMARY KEY (identifier)  -- Definimos la clave primaria en 'identifier'
) COMMENT='Contiene los datos de los moderadores responsables de atender las consultas';

-- 4. Crear la tabla 'user' que contiene los datos personales de los usuarios
CREATE TABLE user (
    identifier INT NOT NULL COMMENT 'Identificador único y numérico de cada usuario',
    name VARCHAR(70) NOT NULL COMMENT 'Contiene los nombres del solicitante',
    lastname VARCHAR(70) NOT NULL COMMENT 'Contiene los apellidos del solicitante',
    sex CHAR(1) NOT NULL COMMENT '(M) para Masculino | (F) para Femenino',
    cellphone CHAR(9) NOT NULL COMMENT 'Número de celular del solicitante',
    email VARCHAR(120) NOT NULL COMMENT 'Correo electrónico del solicitante',
    CONSTRAINT user_pk PRIMARY KEY (identifier)  -- Definimos la clave primaria en 'identifier'
) COMMENT='Datos personales de los usuarios';

-- 5. Agregar la columna 'status' a todas las tablas para indicar el estado lógico de los registros
-- 'status' será un campo lógico donde 1 representa activo y 0 inactivo
ALTER TABLE answer ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';
ALTER TABLE consult ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';
ALTER TABLE moderator ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';
ALTER TABLE user ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';

-- 6. Definir las claves foráneas para establecer las relaciones entre las tablas
-- La tabla 'consult' debe estar vinculada con 'answer' a través de 'response_identifier'
ALTER TABLE consult 
ADD CONSTRAINT consulta_respuesta FOREIGN KEY (response_identifier)
    REFERENCES answer (identifier);

-- La tabla 'consult' debe estar vinculada con 'user' a través de 'users_identifier'
ALTER TABLE consult 
ADD CONSTRAINT consulta_usuarios FOREIGN KEY (users_identifier)
    REFERENCES user (identifier);

-- La tabla 'answer' debe estar vinculada con 'moderator' a través de 'moderator_identifier'
ALTER TABLE answer 
ADD CONSTRAINT respuesta_moderador FOREIGN KEY (moderator_identifier)
    REFERENCES moderator (identifier);

-- 7. Mostrar todas las tablas existentes en la base de datos
SHOW TABLES;

-- 8. Ver la estructura de la tabla 'answer' para obtener detalles de sus columnas
DESCRIBE answer;

-- 9. Eliminar la tabla 'answer' si ya no se necesita
DROP TABLE answer;

-- 10. Insertar datos en la tabla 'user' para agregar varios usuarios
INSERT INTO user (identifier, name, lastname, sex, cellphone, email) 
VALUES 
(1, 'Luis', 'Ramos', 'M', '987654321', 'luis.ramos@gmail.com'),
(2, 'Carla', 'Torres', 'F', '912345678', 'carla.torres@gmail.com'),
(3, 'Pedro', 'Gómez', 'M', '934567890', 'pedro.gomez@gmail.com'),
(4, 'Sofia', 'Mendoza', 'F', '945678123', 'sofia.mendoza@gmail.com'),
(5, 'David', 'Ruiz', 'M', '956789012', 'david.ruiz@gmail.com');

-- 11. Actualizar el correo electrónico de un usuario específico
-- Cambiar el correo de Luis Ramos (identifier = 1) a 'luis.updated@gmail.com'
UPDATE user 
SET email = 'luis.updated@gmail.com' 
WHERE identifier = 1;

-- 12. Eliminar un usuario específico de la tabla 'user'
-- Eliminar el usuario con identifier = 1 (Luis Ramos)
DELETE FROM user 
WHERE identifier = 1;
