CREATE DATABASE Base_data_guia;
USE Base_data_guia;


-- Table: answer
CREATE TABLE answer (
    identifier INT NOT NULL COMMENT 'Almacena los datos de las respuestas al momento de hacer una consulta',
    moderator VARCHAR(120) NOT NULL COMMENT 'Contiene los datos de los moderadores responsables de atender las consultas',
    record DATETIME NOT NULL COMMENT 'Contiene la respuesta de atención del asesor',
    moderator_identifier INT NOT NULL COMMENT 'Identificador único y numérico para cada moderador',
    date TIMESTAMP NOT NULL COMMENT 'Contiene la fecha y hora en que se registra la respuesta a la consulta',
    query VARCHAR(250) NOT NULL COMMENT 'Almacena los datos que se registran al momento de hacer una consulta',
    CONSTRAINT answer_pk PRIMARY KEY (identifier)
) COMMENT='Contiene los datos de las respuestas sobre la cual se realizan las consultas';
ALTER TABLE answer ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';


-- Table: consult
CREATE TABLE consult (
    identifier INT NOT NULL COMMENT 'Identificador único y numérico para cada consulta',
    user VARCHAR(120) NOT NULL COMMENT 'Datos personales de los usuarios',
    query_content VARCHAR(250) NOT NULL COMMENT 'Dirigida sobre el ODS 9 o aplicativo',
    date TIMESTAMP NOT NULL COMMENT 'Contiene la fecha y hora en que se registra la consulta',
    record DATETIME NOT NULL COMMENT 'Contiene las consultas de atención del asesor',
    users_identifier INT NOT NULL COMMENT 'Identificador único y numérico de cada usuario',
    response_identifier INT NOT NULL COMMENT 'Contiene los datos de las respuestas sobre la cual se realizan las consultas',
    CONSTRAINT consult_pk PRIMARY KEY (identifier)
) COMMENT='Almacena los datos que se registran al momento de hacer una consulta';
ALTER TABLE consult ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';


-- Table: moderator
CREATE TABLE moderator (
    identifier INT NOT NULL COMMENT 'Identificador único y numérico para cada moderador',
    area CHAR(1) NOT NULL COMMENT 'Página web o aplicativo',
    name VARCHAR(70) NOT NULL COMMENT 'Nombre del moderador',
    lastname VARCHAR(70) NOT NULL COMMENT 'Apellido del moderador',
    email VARCHAR(120) NOT NULL COMMENT 'Contiene el correo del moderador',
    query_type CHAR(1) NOT NULL COMMENT 'Dirigida respecto al ODS 9 o aplicativo',
    record DATETIME NOT NULL COMMENT 'Fecha en que se registra los datos del moderador',
    CONSTRAINT moderator_pk PRIMARY KEY (identifier)
) COMMENT='Contiene los datos de los moderadores responsables de atender las consultas';
ALTER TABLE moderator ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';

-- Table: user
CREATE TABLE user (
    identifier INT NOT NULL COMMENT 'Identificador único y numérico de cada usuario',
    name VARCHAR(70) NOT NULL COMMENT 'Contiene los nombres del solicitante',
    lastname VARCHAR(70) NOT NULL COMMENT 'Contiene los apellidos del solicitante',
    sex CHAR(1) NOT NULL COMMENT '(M) para Masculino | (F) para Femenino',
    cellphone CHAR(9) NOT NULL COMMENT 'Número de celular del solicitante',
    email VARCHAR(120) NOT NULL COMMENT 'Correo electrónico del solicitante',
    CONSTRAINT user_pk PRIMARY KEY (identifier)
) COMMENT='Datos personales de los usuarios';
ALTER TABLE user ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';

-- Claves foráneas
-- Reference: consulta_respuesta (table: consult)
ALTER TABLE consult 
ADD CONSTRAINT consulta_respuesta FOREIGN KEY (response_identifier)
    REFERENCES answer (identifier);

-- Reference: consulta_usuarios (table: consult)
ALTER TABLE consult 
ADD CONSTRAINT consulta_usuarios FOREIGN KEY (users_identifier)
    REFERENCES user (identifier);

-- Reference: respuesta_moderador (table: answer)
ALTER TABLE answer 
ADD CONSTRAINT respuesta_moderador FOREIGN KEY (moderator_identifier)
    REFERENCES moderator (identifier);


-- Inserciones en la tabla user
INSERT INTO user (identifier, name, lastname, sex, cellphone, email) 
VALUES 
(1, 'Luis', 'Ramos', 'M', '987654321', 'luis.ramos@gmail.com'),
(2, 'Carla', 'Torres', 'F', '912345678', 'carla.torres@gmail.com'),
(3, 'Pedro', 'Gómez', 'M', '934567890', 'pedro.gomez@gmail.com'),
(4, 'Sofia', 'Mendoza', 'F', '945678123', 'sofia.mendoza@gmail.com'),
(5, 'David', 'Ruiz', 'M', '956789012', 'david.ruiz@gmail.com');

-- Inserciones en la tabla moderator
INSERT INTO moderator (identifier, area, name, lastname, email, query_type, record) 
VALUES 
(1, 'W', 'Laura', 'García', 'laura.garcia@gmail.com', 'A', '2024-10-20 10:15:00'),
(2, 'A', 'Mario', 'Díaz', 'mario.diaz@gmail.com', 'O', '2024-10-20 11:00:00'),
(3, 'W', 'Lucía', 'Hernández', 'lucia.hernandez@gmail.com', 'A', '2024-10-20 12:30:00'),
(4, 'A', 'Roberto', 'Sánchez', 'roberto.sanchez@gmail.com', 'O', '2024-10-20 13:45:00'),
(5, 'W', 'Sandra', 'Morales', 'sandra.morales@gmail.com', 'A', '2024-10-20 14:50:00');

-- Inserciones en la tabla answer
INSERT INTO answer (identifier, moderator, record, moderator_identifier, date, query) 
VALUES 
(1, 'Laura García', '2024-10-20 11:30:00', 1, '2024-10-20 11:30:00', 'Respuesta sobre las metas del ODS 9'),
(2, 'Mario Díaz', '2024-10-20 12:10:00', 2, '2024-10-20 12:10:00', 'Respuesta sobre avances tecnológicos ODS'),
(3, 'Lucía Hernández', '2024-10-20 13:00:00', 3, '2024-10-20 13:00:00', 'Consulta sobre infraestructuras resilientes'),
(4, 'Roberto Sánchez', '2024-10-20 14:00:00', 4, '2024-10-20 14:00:00', 'Consulta sobre aplicaciones web en ODS 9'),
(5, 'Sandra Morales', '2024-10-20 15:00:00', 5, '2024-10-20 15:00:00', 'Respuesta sobre tecnologías innovadoras en ODS');

-- Inserciones en la tabla consult
INSERT INTO consult (identifier, user, query_content, date, record, users_identifier, response_identifier) 
VALUES 
(1, 'Luis Ramos', 'Consulta sobre innovación en ODS 9', '2024-10-20 10:30:00', '2024-10-20 11:00:00', 1, 1),
(2, 'Carla Torres', 'Pregunta sobre sostenibilidad en infraestructuras', '2024-10-20 11:15:00', '2024-10-20 12:00:00', 2, 2),
(3, 'Pedro Gómez', 'Consulta sobre objetivos de desarrollo sostenible', '2024-10-20 12:20:00', '2024-10-20 13:00:00', 3, 3),
(4, 'Sofia Mendoza', 'Pregunta sobre metas del ODS 9', '2024-10-20 13:40:00', '2024-10-20 14:10:00', 4, 4),
(5, 'David Ruiz', 'Consulta sobre innovación en aplicaciones tecnológicas', '2024-10-20 14:50:00', '2024-10-20 15:30:00', 5, 5);


-- Listado de todos los usuarios
SELECT * FROM user;
SELECT * FROM consult;
-- Listado de usuarios activos (eliminación lógica)
SELECT * FROM moderator WHERE status = 1;
SELECT * FROM consult WHERE status = 1;
SELECT * FROM answer WHERE status = 1;
SELECT * FROM user WHERE status = 1;



-- Actualización de un usuario
UPDATE user 
SET email = 'luis.updated@gmail.com' 
WHERE identifier = 1;

-- Eliminación física de una consulta a usuario
DELETE FROM consult WHERE users_identifier = 3;
DELETE FROM user WHERE identifier = 3;

-- Eliminación lógica del usuario con identifier = 3
UPDATE user SET status = 0 WHERE identifier = 3;
