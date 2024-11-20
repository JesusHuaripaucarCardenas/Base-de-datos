# Creacion de una Base de datos en MySQL

1. [ ¿Que es mysql workbench?  ](#¿Que es mysql workbench?)
2. [Base de Datos](#Base de Datos)

	 - [Crear Base de Datos](#Crear Base de Datos)
  	 - [Usar Base de Datos](#Usar Base de Datos)
  	 - [Crear tablas](#Crear tablas)
	 - [Relaciones entre las tablas](#Relaciones entre las tablas)
  	 - [Insertar datos a la tabla](#Insertar datos a la tabla)
  	 - [Ver base de datos creada](#Ver base de datos creada)
	 - [Ver tablas creadas](#Ver tablas creadas)
  	 - [Ver la tabla con los datos](#Ver la tabla con los datos)
  	 - [Actualizar datos de una tabla](#Actualizar datos de una tabla)
  	 - [Eliminar datos de una tabla](#Eliminar datos de una tabla)
  	 - [Eliminar relaciones entre tablas](#Eliminar relaciones entre tablas)
  	 - [Eliminar base de datos](#Eliminar base de datos)

## ¿Que es mysql workbench?

	1. MySQL Workbench es una herramienta visual para administrar bases de datos MySQL.
	2. Permite modelar, diseñar y crear esquemas de bases de datos.
	3. Facilita la escritura y ejecución de consultas SQL.
	4. Ofrece opciones para migrar, respaldar y administrar servidores MySQL.

## Base de Datos

	1. Almacenar datos de forma organizada
	2. Facilitar el acceso y análisis

	### Crear Base de Datos

	1. Para crear una base de datos, asegúrate de que no exista una base de datos con el mismo nombre.
	2. Utiliza el comando CREATE DATABASE para crearla.
	3. Asegúrate de elegir un nombre único para la base de datos.
	4. No te olvides de agregar un punto y coma al final del comando.
	
	`CREATE DATABASE nombre_base_datos;`	

	### Usar Base de Datos

	1. Antes de trabajar con las tablas de una base de datos, debes seleccionar la base de datos a usar.
	2. Usamos USE nombre_base_datos; para indicar cuál base de datos se utilizará.
	3. Si no seleccionas una base de datos, los comandos posteriores podrían no ejecutarse correctamente.

	`USE nombre_base_datos;`

	### Crear tablas

	1. Al crear tablas, es importante definir adecuadamente los tipos de datos para cada columna.
	2. Se pueden definir restricciones como PRIMARY KEY, NOT NULL, UNIQUE, etc.
	3. Si una tabla existe con el mismo nombre, se generará un error.	
	4. Define claramente los nombres de las columnas y sus tipos de datos según lo que almacenarás.
	5. Usa PRIMARY KEY para asegurarte de que cada registro sea único.
	6. Si hay relaciones entre tablas, considera usar FOREIGN KEY.

	`CREATE TABLE tabla1 (
   	 	id INT AUTO_INCREMENT PRIMARY KEY,
    	 	nombre VARCHAR(100),
    	 	edad INT
	 );`

	`CREATE TABLE tabla2 (
    		id INT AUTO_INCREMENT PRIMARY KEY,
    		descripcion VARCHAR(255),
   		id_tabla1 INT,
   		FOREIGN KEY (id_tabla1) REFERENCES tabla1(id)
	);`

	### Relaciones entre las tablas

	1. Se utilizan claves foráneas (FOREIGN KEY) para definir relaciones entre tablas.
	2. Las relaciones deben coincidir con las claves primarias de las tablas relacionadas.
	3. Asegúrate de definir correctamente las relaciones para evitar problemas de integridad referencial.
	4. Asegúrate de que la tabla referenciada ya exista.

	`CREATE TABLE tabla3 (
    		id INT AUTO_INCREMENT PRIMARY KEY,
    		otra_columna VARCHAR(100),
    		id_tabla1 INT,
   	 	id_tabla2 INT,
    		FOREIGN KEY (id_tabla1) REFERENCES tabla1(id),
    		FOREIGN KEY (id_tabla2) REFERENCES tabla2(id)
	);`

	### Insertar datos a la tabla

	1. Usa INSERT INTO para insertar los datos en la tabla.	
	2. Asegúrate de que los datos que estás insertando coincidan con los tipos de datos de las columnas.
	
	`INSERT INTO tabla1 (nombre, edad) VALUES ('Juan', 25);`
	`INSERT INTO tabla2 (descripcion, id_tabla1) VALUES ('Descripción ejemplo', 1);`


	### Ver base de datos creada	

	1. Para ver las bases de datos disponibles en el servidor, usa el comando SHOW DATABASES;.
	2. Muestra todas las bases de datos disponibles en el servidor creadas.

	`SHOW DATABASES;`

	### Ver tablas creadas
	1. Usa SHOW TABLES; para ver todas las tablas que contiene o hayas colocado a tu base de datos.
	2. Este comando solo mostrará las tablas de la base de datos activa.
	3. Si no seleccionaste una base de datos, mostrará un error.

	`SHOW TABLES;`


	### Ver la tabla con los datos

	1. Usa SELECT para ver los datos dentro de una tabla.
	2. Puedes especificar columnas específicas o usar * para ver todas las columnas.
	3. Este comando muestra todos los registros de la tabla seleccionada.

	### Actualizar datos de una tabla

	1. Utiliza el comando UPDATE para modificar registros existentes.
	2. Asegúrate de usar una condición adecuada con WHERE para no actualizar todos los registros de la tabla.
	3. Los cambios son permanentes y no pueden deshacerse a menos que se tenga un respaldo.
	
	`UPDATE tabla1 SET nombre = 'Carlos', edad = 30 WHERE id = 1;`

	
	### Eliminar datos de una tabla

	1. Usa DELETE FROM para eliminar registros de una tabla.
	2. Es importante especificar la condición WHERE para evitar eliminar todos los registros.
	3. La eliminación es irreversible.
	
	`DELETE FROM tabla1 WHERE id = 1;`

	### Eliminar relaciones entre tablas

	1. Identifica correctamente el nombre de la llave foránea que deseas eliminar.
	2. Si necesitas eliminar una relación de clave foránea, usa ALTER TABLE con DROP FOREIGN KEY.
	3. Asegúrate de no tener registros que dependan de esa relación antes de eliminarla.

	`ALTER TABLE tabla2 DROP FOREIGN KEY fk_tabla1;`	

	### Eliminar base de datos  
	1. Utiliza DROP DATABASE para eliminar una base de datos.
	2. Advertencia: Este comando es irreversible. Al ejecutarlo, se borrarán todos los datos y tablas de la base de datos.
	3. Asegúrate de tener un respaldo si es necesario.

	`DROP DATABASE nombre_base_datos;`


