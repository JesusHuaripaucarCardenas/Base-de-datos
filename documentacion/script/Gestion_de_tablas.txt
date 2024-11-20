-- Crear las tablas
-- Table: respuesta
CREATE TABLE answer (
    identifier INT NOT NULL COMMENT 'Almacena los datos de las respuestas al momento de hacer una consulta',
    moderator VARCHAR(120) NOT NULL COMMENT 'Contiene los datos de los moderadores responsables de atender las consultas',
    record DATETIME NOT NULL COMMENT 'Contiene la respuesta de atención del asesor',
    moderator_identifier INT NOT NULL COMMENT 'Identificador único y numérico para cada moderador',
    date TIMESTAMP NOT NULL COMMENT 'Contiene la fecha y hora en que se registra la respuesta a la consulta',
    query VARCHAR(250) NOT NULL COMMENT 'Almacena los datos que se registran al momento de hacer una consulta',
    CONSTRAINT answer_pk PRIMARY KEY (identifier)
) COMMENT='Contiene los datos de las respuestas sobre la cual se realizan las consultas';

-- Table: consulta
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

-- Table: moderador
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

-- Table: usuario
CREATE TABLE user (
    identifier INT NOT NULL COMMENT 'Identificador único y numérico de cada usuario',
    name VARCHAR(70) NOT NULL COMMENT 'Contiene los nombres del solicitante',
    lastname VARCHAR(70) NOT NULL COMMENT 'Contiene los apellidos del solicitante',
    sex CHAR(1) NOT NULL COMMENT '(M) para Masculino | (F) para Femenino',
    cellphone CHAR(9) NOT NULL COMMENT 'Número de celular del solicitante',
    email VARCHAR(120) NOT NULL COMMENT 'Correo electrónico del solicitante',
    CONSTRAINT user_pk PRIMARY KEY (identifier)
) COMMENT='Datos personales de los usuarios';

-- Agregar la columna "status" a cada tabla
ALTER TABLE answer ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';
ALTER TABLE consult ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';
ALTER TABLE moderator ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';
ALTER TABLE user ADD COLUMN status BOOLEAN DEFAULT 1 COMMENT 'Estado lógico del registro: 1 activo, 0 inactivo';

-- Definir claves foráneas
ALTER TABLE consult 
ADD CONSTRAINT consulta_respuesta FOREIGN KEY (response_identifier)
    REFERENCES answer (identifier);

ALTER TABLE consult 
ADD CONSTRAINT consulta_usuarios FOREIGN KEY (users_identifier)
    REFERENCES user (identifier);

ALTER TABLE answer 
ADD CONSTRAINT respuesta_moderador FOREIGN KEY (moderator_identifier)
    REFERENCES moderator (identifier);

-- Ver todas las tablas
SHOW TABLES;

-- Ver la estructura de una tabla específica
DESCRIBE answer;

-- Eliminar una tabla
DROP TABLE answer;
