-- Crear la tabla
CREATE TABLE customer (
    id INT IDENTITY(1,1) PRIMARY KEY,
    dni CHAR(8) NOT NULL,
    cellphone CHAR(9) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    state CHAR(1) NOT NULL
);


CREATE TABLE product (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(5,3) NOT NULL,
    state CHAR(1) NOT NULL
);
