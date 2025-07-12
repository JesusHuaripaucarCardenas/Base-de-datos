ver las columnas de la tala
```sql
EXEC sp_columns 'Personas';
```

agregar una columna nueva
```sql
ALTER TABLE Personas
ADD estado char(1) default 1;
```

agregar una restriccion unica
```sql
ALTER TABLE Personas
ADD CONSTRAINT UQ_Personas_NumeroDocumento
UNIQUE (NumeroDocumento);
```

agregar un check de solo numeros
```sql
ALTER TABLE Personas
ADD CONSTRAINT CHK_Personas_NumeroDocumento_Numerico
CHECK (NumeroDocumento NOT LIKE '%[^0-9]%');
```

agregar un check de solo letras
```sql
ALTER TABLE Personas
ADD CONSTRAINT CHK_Personas_NumeroDocumento_SoloLetras
CHECK (NumeroDocumento NOT LIKE '%[^A-Za-z]%');
```

listar datos de solo pais
```sql
select * from Personas
where pais like 'venezuela';
```

actualizar registro
```sql
update Personas
set  Nombre = 'etesech'
where pais = 'venezuela';
```

eliminar registro
```sql
delete from Personas
where NumeroDocumento = '51546085';
```

listar de mayor a menor
```sql
SELECT *
FROM Personas
ORDER BY Id DESC;
```

listar de menor a mayor
```sql
SELECT *
FROM Personas
ORDER BY Id ASC;
```

lsitar los 10 primeros 
```sql
SELECT TOP 10 *
FROM Personas
ORDER BY Id ASC;
```

listar de 20 a 30
```sql
SELECT *
FROM Personas
ORDER BY Id
OFFSET 19 ROWS
FETCH NEXT 11 ROWS ONLY;
```
