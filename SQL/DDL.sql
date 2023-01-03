--Creacion del esquema
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

-- Tablas relacionadas a Vivero y sus restricciones
CREATE TABLE Vivero(
	NumSucursal INT,
	Nombre VARCHAR(100),
	DiaApertura INT,
	MesApertura INT,
	AnioApertura INT,
	Calle VARCHAR(50),
	NumeroDireccion INT,
	Colonia VARCHAR(50),
	Municipio VARCHAR (50),
	Ciudad VARCHAR (50),
	CP CHAR(5),
	Horario VARCHAR(100) 
);

ALTER TABLE Vivero ADD CONSTRAINT PK_NumSucursal PRIMARY KEY (NumSucursal);

ALTER TABLE Vivero ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Vivero ALTER COLUMN DiaApertura SET NOT NULL;
ALTER TABLE Vivero ALTER COLUMN MesApertura SET NOT NULL;
ALTER TABLE Vivero ALTER COLUMN AnioApertura SET NOT NULL;
ALTER TABLE Vivero ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE Vivero ALTER COLUMN NumeroDireccion SET NOT NULL;
ALTER TABLE Vivero ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE Vivero ALTER COLUMN Municipio SET NOT NULL;
ALTER TABLE Vivero ALTER COLUMN Ciudad SET NOT NULL;
ALTER TABLE Vivero ALTER COLUMN CP SET NOT NULL;

ALTER TABLE Vivero ADD CONSTRAINT cCP_Vivero CHECK(CP SIMILAR TO '[0-9]{5}');
ALTER TABLE Vivero ADD CONSTRAINT cDiaN_Vivero CHECK(DiaApertura BETWEEN 1 AND 31);
ALTER TABLE Vivero ADD CONSTRAINT cMesN_Vivero CHECK(MesApertura BETWEEN 1 AND 12);
ALTER TABLE Vivero ADD CONSTRAINT cAnioN_Vivero CHECK(AnioApertura BETWEEN 1700 AND 2100);
ALTER TABLE Vivero ADD CONSTRAINT cHorario CHECK(Horario='08:00am-17:00pm' OR Horario='09:00am-18:00pm'); 

COMMENT ON TABLE Vivero IS 'Tabla que contiene los viveros de la empresa';
COMMENT ON COLUMN Vivero.NumSucursal IS 'Numero de sucursal del Vivero';
COMMENT ON COLUMN Vivero.Nombre IS 'Nombre del Vivero';
COMMENT ON COLUMN Vivero.DiaApertura IS 'Dia de apertura del Vivero';
COMMENT ON COLUMN Vivero.MesApertura IS 'Mes de apertura del Vivero';
COMMENT ON COLUMN Vivero.AnioApertura IS 'Año de apertura del Vivero';
COMMENT ON COLUMN Vivero.Calle IS 'Calle en la que se ubica el Vivero';
COMMENT ON COLUMN Vivero.NumeroDireccion IS 'Número de la direccion del Vivero';
COMMENT ON COLUMN Vivero.Colonia IS 'Colonia en la que se ubica Vivero';
COMMENT ON COLUMN Vivero.Municipio IS 'Municipio en el que se ubica el Vivero';
COMMENT ON COLUMN Vivero.Ciudad IS 'Ciudad en la que se ubica el Vivero';
COMMENT ON COLUMN Vivero.CP IS 'Codigo postal del Vivero';
COMMENT ON COLUMN Vivero.Horario IS 'Horario de atencion del Vivero';
COMMENT ON CONSTRAINT PK_NumSucursal ON Vivero IS 'La llave primaria de la tabla Vivero';
COMMENT ON CONSTRAINT cCP_Vivero ON Vivero IS 'Restriccion check el cual nos asegura que
cCP_Vivero sea una cadena de longitud 5 formada por numeros';
COMMENT ON CONSTRAINT cDiaN_Vivero ON Vivero IS 'Restriccion check el cual nos asegura que
cDiaN_Vivero sea un numero entre el 1 y el 31';
COMMENT ON CONSTRAINT cMesN_Vivero ON Vivero IS 'Restriccion check el cual nos asegura que
cMesN_Vivero sea un numero entre el 1 y el 12';
COMMENT ON CONSTRAINT cAnioN_Vivero ON Vivero IS 'Restriccion check el cual nos asegura que
cAnioN_Vivero sea un numero entre el 1700 y el 2100';
COMMENT ON CONSTRAINT cCP_Vivero ON Vivero IS 'Restriccion check el cual nos asegura que cCP_Vivero 
sea una cadena de longitud 5 formada por numeros';
COMMENT ON CONSTRAINT cHorario ON Vivero IS 'Restriccion check el cual nos asegura que
Horario sea uno valido: 08:00am-17:00pm o 09:00am-18:00pm';

CREATE TABLE TelefonoVivero(
	NumSucursal INT,
	Telefono CHAR(10)
);

ALTER TABLE TelefonoVivero ADD CONSTRAINT FK_NumSucursal FOREIGN KEY (NumSucursal) REFERENCES Vivero (NumSucursal)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE TelefonoVivero ADD CONSTRAINT PK_TelefonoVivero PRIMARY KEY(NumSucursal,Telefono);

ALTER TABLE TelefonoVivero ADD CONSTRAINT cTelVivero CHECK(Telefono SIMILAR TO '[0-9]*');

COMMENT ON TABLE TelefonoVivero IS 'Tabla que contiene los viveros de la empresa';
COMMENT ON COLUMN TelefonoVivero.NumSucursal IS 'Numero de sucursal del Vivero';
COMMENT ON COLUMN TelefonoVivero.Telefono IS 'Telefono del Vivero';
COMMENT ON CONSTRAINT PK_TelefonoVivero ON TelefonoVivero IS 'La llave primaria de la tabla TelefonoVivero';
COMMENT ON CONSTRAINT FK_NumSucursal ON TelefonoVivero IS 'La llave foranea de la tabla TelefonoVivero';
COMMENT ON CONSTRAINT cTelVivero ON TelefonoVivero IS 'Restriccion check el cual nos asegura que Telefono sea una cadena formada por numeros';

-- Entidad Gerente y tablas relacionadas
CREATE TABLE Gerente(
    RFCGerente CHAR(13),
	NumSucursal INT,
	Nombre VARCHAR(50),
	ApellidoP VARCHAR(50),
	ApellidoM VARCHAR(50),
	Calle VARCHAR(50),
	NumeroDireccion INT,
	Colonia VARCHAR(50),
	Municipio VARCHAR (50),
	CP CHAR(5),
	DiaNacimiento INT,
	MesNacimiento INT,
	AnioNacimiento INT ,
	Salario INT 
);

ALTER TABLE Gerente ADD CONSTRAINT PK_RFCGerente PRIMARY KEY (RFCGERENTE);
ALTER TABLE Gerente ADD CONSTRAINT FK_NumSucursal FOREIGN KEY (NumSucursal) REFERENCES Vivero(NumSucursal)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Gerente ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Gerente ALTER COLUMN ApellidoP SET NOT NULL;
ALTER TABLE Gerente ALTER COLUMN ApellidoM SET NOT NULL;
ALTER TABLE Gerente ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE Gerente ALTER COLUMN NumeroDireccion SET NOT NULL;
ALTER TABLE Gerente ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE Gerente ALTER COLUMN Municipio SET NOT NULL;
ALTER TABLE Gerente ALTER COLUMN CP SET NOT NULL;
ALTER TABLE Gerente ALTER COLUMN DiaNacimiento SET NOT NULL;
ALTER TABLE Gerente ALTER COLUMN MesNacimiento SET NOT NULL;
ALTER TABLE Gerente ALTER COLUMN AnioNacimiento SET NOT NULL;
ALTER TABLE Gerente ALTER COLUMN Salario SET NOT NULL;


ALTER TABLE Gerente ADD CONSTRAINT cRFCGerente CHECK(RFCGerente SIMILAR TO '[A-Z]{3,4}[0-9]{6}[0-9A-Z]{3}');
ALTER TABLE Gerente ADD CONSTRAINT cCP CHECK(CP SIMILAR TO '[0-9]{5}');
ALTER TABLE Gerente ADD CONSTRAINT cDiaN CHECK(DiaNacimiento BETWEEN 1 AND 31);
ALTER TABLE Gerente ADD CONSTRAINT cMesN CHECK(MesNacimiento BETWEEN 1 AND 12);
ALTER TABLE Gerente ADD CONSTRAINT cAnioN CHECK(AnioNacimiento BETWEEN 1900 AND 2100);
ALTER TABLE Gerente DROP CONSTRAINT cAnioN;
ALTER TABLE Gerente ADD CONSTRAINT cAnioN CHECK(AnioNacimiento BETWEEN 1950 AND 2022);

COMMENT ON TABLE Gerente IS 'Tabla que contiene los gerentes de los viveros';
COMMENT ON COLUMN Gerente.RFCGerente IS 'RFC del Gerente';
COMMENT ON COLUMN Gerente.NumSucursal IS 'Numero de sucursal del Vivero';
COMMENT ON COLUMN Gerente.Nombre IS 'Nombre del Gerente';
COMMENT ON COLUMN Gerente.ApellidoP IS 'Apellido paterno del Gerente';
COMMENT ON COLUMN Gerente.ApellidoM IS 'Apellido materno del Gerente';
COMMENT ON COLUMN Gerente.Calle IS 'Calle de la direccion del Gerente';
COMMENT ON COLUMN Gerente.NumeroDireccion IS 'Número de la direccion del Gerente';
COMMENT ON COLUMN Gerente.Colonia IS 'Colonia de la direccion del Gerente';
COMMENT ON COLUMN Gerente.Municipio IS 'Municipio de la direccion del Gerente';
COMMENT ON COLUMN Gerente.CP IS 'Colonia de la direccion del Gerente';
COMMENT ON COLUMN Gerente.DiaNacimiento IS 'Dia de nacimiento del Gerente';
COMMENT ON COLUMN Gerente.MesNacimiento IS 'Mes de nacimiento del Gerente';
COMMENT ON COLUMN Gerente.AnioNacimiento IS 'Año de nacimiento del Gerente';
COMMENT ON COLUMN Gerente.Salario IS 'Salario del Gerente';
COMMENT ON CONSTRAINT PK_RFCGerente ON Gerente IS 'La llave primaria de la tabla Gerente';
COMMENT ON CONSTRAINT FK_NumSucursal ON Gerente IS 'La llave foranea de la tabla Gerente';
COMMENT ON CONSTRAINT cRFCGerente ON Gerente IS 'Restriccion check el cual nos asegura que
cRFCGerente sea una cadena fromada por 3 o 4 letras mayusculas seguido de 6 numeros y que
finaliza con 3 caracteres que pueden ser numeros y/o letras mayusculas';
COMMENT ON CONSTRAINT cCP ON Gerente IS 'Restriccion check el cual nos asegura que
cCP sea una cadena de longitud 5 formada por numeros';
COMMENT ON CONSTRAINT cDiaN ON Gerente IS 'Restriccion check el cual nos asegura que
cDiaN sea un numero entre el 1 y el 31';
COMMENT ON CONSTRAINT cMesN ON Gerente IS 'Restriccion check el cual nos asegura que
cMesN sea un numero entre el 1 y el 12';
COMMENT ON CONSTRAINT cAnioN ON Gerente IS 'Restriccion check el cual nos asegura que
cAnioN sea un numero entre el 1950 y el 2022';


CREATE TABLE TelefonoGerente(
	RFCGerente CHAR(13),
	Telefono CHAR(10)
);

ALTER TABLE TelefonoGerente ADD CONSTRAINT PK_telGerente PRIMARY KEY (RFCGerente, Telefono);
ALTER TABLE TelefonoGerente ADD CONSTRAINT FK_RFCGerenteTel FOREIGN KEY (RFCGerente) REFERENCES Gerente (RFCGerente)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE TelefonoGerente ALTER COLUMN RFCGerente SET NOT NULL;

ALTER TABLE TelefonoGerente ADD CONSTRAINT cTelG CHECK(Telefono SIMILAR TO '[0-9]*');

COMMENT ON TABLE TelefonoGerente IS 'Tabla que contiene los telefonos de los gerentes';
COMMENT ON COLUMN TelefonoGerente.RFCGerente IS 'RFC del Gerente';
COMMENT ON COLUMN TelefonoGerente.Telefono IS 'Telefono del gerente';
COMMENT ON CONSTRAINT cTelG ON TelefonoGerente IS 'Restriccion check el cual nos asegura que
cTelG sea una cadena formada por numeros';
COMMENT ON CONSTRAINT PK_telGerente ON TelefonoGerente IS 'La llave primaria de la tabla TelefonoGerente';
COMMENT ON CONSTRAINT FK_RFCGerenteTel ON TelefonoGerente IS 'La llave foranea de la tabla TelefonoGerente';

CREATE TABLE CorreoGerente(
	RFCGerente CHAR(13),
	Correo VARCHAR(50)
);

ALTER TABLE CorreoGerente ADD CONSTRAINT PK_correoGerente PRIMARY KEY (RFCGerente, Correo);
ALTER TABLE CorreoGerente ADD CONSTRAINT FK_RFCGerenteCorreo FOREIGN KEY (RFCGerente) REFERENCES Gerente (RFCGerente)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE CorreoGerente ALTER COLUMN RFCGerente SET NOT NULL;

ALTER TABLE CorreoGerente ADD CONSTRAINT correoGerente CHECK(Correo SIMILAR TO '[aA0-zZ9]+@[A-Za-z0-9\-]*[.][A-Za-z.]+' escape '\');

COMMENT ON TABLE CorreoGerente IS 'Tabla que contiene los correos de los gerentes';
COMMENT ON COLUMN CorreoGerente.RFCGerente IS 'RFC del Gerente';
COMMENT ON COLUMN CorreoGerente.Correo IS 'Correo del gerente';
COMMENT ON CONSTRAINT correoGerente ON CorreoGerente IS 'Restriccion check el cual nos asegura que
correoGerente sea una cadena con formato de correo electronico';
COMMENT ON CONSTRAINT PK_correoGerente ON CorreoGerente IS 'La llave primaria de la tabla CorreoGerente';
COMMENT ON CONSTRAINT FK_RFCGerenteCorreo ON CorreoGerente IS 'La llave foranea de la tabla CorreoGerente';

CREATE TABLE Cuidador(
    RFCCuidador CHAR(13),
	NumSucursal INT,
	Nombre VARCHAR(50),
	ApellidoP VARCHAR(50),
	ApellidoM VARCHAR(50),
	Calle VARCHAR(50),
	NumeroDireccion INT,
	Colonia VARCHAR(50),
	Municipio VARCHAR (50),
	CP CHAR(5),
	DiaNacimiento INT,
	MesNacimiento INT,
	AnioNacimiento INT ,
	Salario INT 
);

ALTER TABLE Cuidador ADD CONSTRAINT PK_RFCCuidador PRIMARY KEY (RFCCuidador);
ALTER TABLE Cuidador ADD CONSTRAINT FK_NumSucursalCuidador FOREIGN KEY (NumSucursal) REFERENCES Vivero(NumSucursal)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Cuidador ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN ApellidoP SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN ApellidoM SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN NumeroDireccion SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN Municipio SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN CP SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN DiaNacimiento SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN MesNacimiento SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN AnioNacimiento SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN Salario SET NOT NULL;

ALTER TABLE Cuidador ADD CONSTRAINT correctoRFCCuidador CHECK(RFCCuidador SIMILAR TO '[A-Z]{3,4}[0-9]{6}[0-9A-Z]{3}');
ALTER TABLE Cuidador ADD CONSTRAINT cCPCuidador CHECK(CP SIMILAR TO '[0-9]{5}');
ALTER TABLE Cuidador ADD CONSTRAINT cDiaNCuidador CHECK(DiaNacimiento BETWEEN 1 AND 31);
ALTER TABLE Cuidador ADD CONSTRAINT cMesNCuidador CHECK(MesNacimiento BETWEEN 1 AND 12);
ALTER TABLE Cuidador ADD CONSTRAINT cAnioNCuidador CHECK(AnioNacimiento BETWEEN 1900 AND 2100);
ALTER TABLE Cuidador DROP CONSTRAINT cAnioNCuidador;
ALTER TABLE Cuidador ADD CONSTRAINT cAnioNCuidador CHECK(AnioNacimiento BETWEEN 1950 AND 2022);


COMMENT ON TABLE Cuidador IS 'Tabla que contiene los cuidadores de los viveros';
COMMENT ON COLUMN Cuidador.RFCCuidador IS 'RFC del Cuidador';
COMMENT ON COLUMN Cuidador.NumSucursal IS 'Numero de sucursal del Vivero';
COMMENT ON COLUMN Cuidador.Nombre IS 'Nombre del Cuidador';
COMMENT ON COLUMN Cuidador.ApellidoP IS 'Apellido paterno del Cuidador';
COMMENT ON COLUMN Cuidador.ApellidoM IS 'Apellido materno del Cuidador';
COMMENT ON COLUMN Cuidador.Calle IS 'Calle de la direccion del Cuidador';
COMMENT ON COLUMN Cuidador.NumeroDireccion IS 'Número de la direccion del Cuidador';
COMMENT ON COLUMN Cuidador.Colonia IS 'Colonia de la direccion del Cuidador';
COMMENT ON COLUMN Cuidador.Municipio IS 'Municipio de la direccion del Cuidador';
COMMENT ON COLUMN Cuidador.CP IS 'Colonia de la direccion del Cuidador';
COMMENT ON COLUMN Cuidador.DiaNacimiento IS 'Dia de nacimiento del Cuidador';
COMMENT ON COLUMN Cuidador.MesNacimiento IS 'Mes de nacimiento del Cuidador';
COMMENT ON COLUMN Cuidador.AnioNacimiento IS 'Año de nacimiento del Cuidador';
COMMENT ON COLUMN Cuidador.Salario IS 'Salario del Cuidador';
COMMENT ON CONSTRAINT PK_RFCCuidador ON Cuidador IS 'La llave primaria de la tabla Cuidador';
COMMENT ON CONSTRAINT FK_NumSucursalCuidador ON Cuidador IS 'La llave foranea de la tabla Cuidador';
COMMENT ON CONSTRAINT correctoRFCCuidador ON Cuidador IS 'Restriccion check el cual nos asegura que
correctoRFCCuidador sea una cadena fromada por 3 o 4 letras mayusculas seguido de 6 numeros y que
finaliza con 3 caracteres que pueden ser numeros y/o letras mayusculas';
COMMENT ON CONSTRAINT cCPCuidador ON Cuidador IS 'Restriccion check el cual nos asegura que
cCPCuidador sea una cadena de longitud 5 formada por numeros';
COMMENT ON CONSTRAINT cDiaNCuidador ON Cuidador IS 'Restriccion check el cual nos asegura que
cDiaNCuidador sea un numero entre el 1 y el 31';
COMMENT ON CONSTRAINT cMesNCuidador ON Cuidador IS 'Restriccion check el cual nos asegura que
cMesNCuidador sea un numero entre el 1 y el 12';
COMMENT ON CONSTRAINT cAnioNCuidador ON Cuidador IS 'Restriccion check el cual nos asegura que
cAnioNCuidador sea un numero entre el 1950 y el 2022';

CREATE TABLE TelefonoCuidador(
	RFCCuidador CHAR(13),
	Telefono CHAR(10)
);

ALTER TABLE TelefonoCuidador ALTER COLUMN RFCCuidador SET NOT NULL;
ALTER TABLE TelefonoCuidador ADD CONSTRAINT cTelCuidador CHECK(Telefono SIMILAR TO '[0-9]*');
ALTER TABLE TelefonoCuidador ADD CONSTRAINT FK_RFCCuidadorTel FOREIGN KEY (RFCCuidador) REFERENCES Cuidador (RFCCuidador)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE TelefonoCuidador ADD CONSTRAINT PK_CuidadorTel PRIMARY KEY (RFCCuidador, Telefono);

COMMENT ON TABLE TelefonoCuidador IS 'Tabla que contiene los telefonos de los cuidadores';
COMMENT ON COLUMN TelefonoCuidador.RFCCuidador IS 'RFC del Cuidador';
COMMENT ON COLUMN TelefonoCuidador.Telefono IS 'Telefono del Cuidador';
COMMENT ON CONSTRAINT cTelCuidador ON TelefonoCuidador IS 'Restriccion check el cual nos asegura que
cTelCuidador sea una cadena formada por numeros';
COMMENT ON CONSTRAINT PK_CuidadorTel ON TelefonoCuidador IS 'La llave primaria de la tabla TelefonoCuidador';
COMMENT ON CONSTRAINT FK_RFCCuidadorTel ON TelefonoCuidador IS 'La llave foranea de la tabla TelefonoCuidador';

CREATE TABLE CorreoCuidador(
	RFCCuidador CHAR(13),
	Correo VARCHAR(50)
);

ALTER TABLE CorreoCuidador ADD CONSTRAINT PK_CuidadorCorreo PRIMARY KEY (RFCCuidador, Correo);
ALTER TABLE CorreoCuidador ADD CONSTRAINT FK_RFCCuidadorCorreo FOREIGN KEY (RFCCuidador) REFERENCES Cuidador (RFCCuidador)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE CorreoCuidador ALTER COLUMN RFCCuidador SET NOT NULL;

ALTER TABLE CorreoCuidador ADD CONSTRAINT cCorreoCuidador CHECK(Correo SIMILAR TO '[aA0-zZ9]+@[A-Za-z0-9\-]*[.][A-Za-z.]+' escape '\');


COMMENT ON TABLE CorreoCuidador IS 'Tabla que contiene los correos de los cuidadores';
COMMENT ON COLUMN CorreoCuidador.RFCCuidador IS 'RFC del Cuidador';
COMMENT ON COLUMN CorreoCuidador.Correo IS 'Correo del Cuidador';
COMMENT ON CONSTRAINT cCorreoCuidador ON CorreoCuidador IS 'Restriccion check el cual nos asegura que
cCorreoCuidador sea una cadena con formato de correo electronico';
COMMENT ON CONSTRAINT PK_CuidadorCorreo ON CorreoCuidador IS 'La llave primaria de la tabla CorreoCuidador';
COMMENT ON CONSTRAINT FK_RFCCuidadorCorreo ON CorreoCuidador IS 'La llave foranea de la tabla CorreoCuidador';


-- Tablas relacionadas a Cuidador y sus restricciones
CREATE TABLE Cajero(
    RFCCajero CHAR(13),
	NumSucursal INT,
	Nombre VARCHAR(50),
	ApellidoP VARCHAR(50),
	ApellidoM VARCHAR(50),
	Calle VARCHAR(50),
	NumeroDireccion INT,
	Colonia VARCHAR(50),
	Municipio VARCHAR (50),
	CP CHAR(5),
	DiaNacimiento INT,
	MesNacimiento INT,
	AnioNacimiento INT,
	Salario INT
);

ALTER TABLE Cajero ADD CONSTRAINT PK_RFCCajero PRIMARY KEY (RFCCajero);
ALTER TABLE Cajero ADD CONSTRAINT FK_NumSucursalCajero FOREIGN KEY (NumSucursal) REFERENCES Vivero(NumSucursal)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Cajero ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Cajero ALTER COLUMN ApellidoP SET NOT NULL;
ALTER TABLE Cajero ALTER COLUMN ApellidoM SET NOT NULL;
ALTER TABLE Cajero ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE Cajero ALTER COLUMN NumeroDireccion SET NOT NULL;
ALTER TABLE Cajero ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE Cajero ALTER COLUMN Municipio SET NOT NULL;
ALTER TABLE Cajero ALTER COLUMN Salario SET NOT NULL;


ALTER TABLE Cajero ADD CONSTRAINT cRFC_Cajero CHECK(RFCCajero SIMILAR TO '[A-Z]{3,4}[0-9]{6}[0-9A-Z]{3}');
ALTER TABLE Cajero ADD CONSTRAINT cCP_Cajero CHECK(CP SIMILAR TO '[0-9]{5}');
ALTER TABLE Cajero ADD CONSTRAINT cDiaN_Cajero CHECK(DiaNacimiento BETWEEN 1 AND 31);
ALTER TABLE Cajero ADD CONSTRAINT cMesN_Cajero CHECK(MesNacimiento BETWEEN 1 AND 12);
ALTER TABLE Cajero ADD CONSTRAINT cAnioN_Cajero CHECK(AnioNacimiento BETWEEN 1900 AND 2100);
ALTER TABLE Cajero DROP CONSTRAINT cAnioN_Cajero;
ALTER TABLE Cajero ADD CONSTRAINT cAnioN_Cajero CHECK(AnioNacimiento BETWEEN 1950 AND 2022);


COMMENT ON TABLE Cajero IS 'Tabla que contiene los cajeros de los viveros';
COMMENT ON COLUMN Cajero.RFCCajero IS 'RFC del Cajero';
COMMENT ON COLUMN Cajero.NumSucursal IS 'Numero de sucursal del Vivero';
COMMENT ON COLUMN Cajero.Nombre IS 'Nombre del Cajero';
COMMENT ON COLUMN Cajero.ApellidoP IS 'Apellido paterno del Cajero';
COMMENT ON COLUMN Cajero.ApellidoM IS 'Apellido materno del Cajero';
COMMENT ON COLUMN Cajero.Calle IS 'Calle de la direccion del Cajero';
COMMENT ON COLUMN Cajero.NumeroDireccion IS 'Número de la direccion del Cajero';
COMMENT ON COLUMN Cajero.Colonia IS 'Colonia de la direccion del Cajero';
COMMENT ON COLUMN Cajero.Municipio IS 'Municipio de la direccion del Cajero';
COMMENT ON COLUMN Cajero.CP IS 'Colonia de la direccion del Cajero';
COMMENT ON COLUMN Cajero.DiaNacimiento IS 'Dia de nacimiento del Cajero';
COMMENT ON COLUMN Cajero.MesNacimiento IS 'Mes de nacimiento del Cajero';
COMMENT ON COLUMN Cajero.AnioNacimiento IS 'Año de nacimiento del Cajero';
COMMENT ON COLUMN Cajero.Salario IS 'Salario del Cajero';
COMMENT ON CONSTRAINT PK_RFCCajero ON Cajero IS 'La llave primaria de la tabla Cajero';
COMMENT ON CONSTRAINT FK_NumSucursalCajero ON Cajero IS 'La llave foranea de la tabla Cajero';
COMMENT ON CONSTRAINT cRFC_Cajero ON Cajero IS 'Restriccion check el cual nos asegura que
cRFC_Cajero sea una cadena fromada por 3 o 4 letras mayusculas seguido de 6 numeros y que
finaliza con 3 caracteres que pueden ser numeros y/o letras mayusculas';
COMMENT ON CONSTRAINT cCP_Cajero ON Cajero IS 'Restriccion check el cual nos asegura que
cCP_Cajero sea una cadena de longitud 5 formada por numeros';
COMMENT ON CONSTRAINT cDiaN_Cajero ON Cajero IS 'Restriccion check el cual nos asegura que
cDiaN_Cajero sea un numero entre el 1 y el 31';
COMMENT ON CONSTRAINT cMesN_Cajero ON Cajero IS 'Restriccion check el cual nos asegura que
cMesN_Cajero sea un numero entre el 1 y el 12';
COMMENT ON CONSTRAINT cAnioN_Cajero ON Cajero IS 'Restriccion check el cual nos asegura que
cAnioN_Cajero sea un numero entre el 1950 y el 2022';

CREATE TABLE TelefonoCajero(
	RFCCajero CHAR(13),
	Telefono CHAR(10)
);

ALTER TABLE TelefonoCajero ADD CONSTRAINT PK_TelCajero PRIMARY KEY (RFCCajero, Telefono);
ALTER TABLE TelefonoCajero ADD CONSTRAINT FK_RFCCajero FOREIGN KEY (RFCCajero) REFERENCES Cajero (RFCCajero)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE TelefonoCajero ADD CONSTRAINT cTelCajero CHECK(Telefono SIMILAR TO '[0-9]*');

COMMENT ON TABLE TelefonoCajero IS 'Tabla que contiene los telefonos de los cajeros';
COMMENT ON COLUMN TelefonoCajero.RFCCajero IS 'RFC del Cajero';
COMMENT ON COLUMN TelefonoCajero.Telefono IS 'Telefono del Cajero';
COMMENT ON CONSTRAINT cTelCajero ON TelefonoCajero IS 'Restriccion check el cual nos asegura que
cTelCajero sea una cadena formada por numeros';
COMMENT ON CONSTRAINT PK_TelCajero ON TelefonoCajero IS 'La llave primaria de la tabla TelefonoCajero';
COMMENT ON CONSTRAINT FK_RFCCajero ON TelefonoCajero IS 'La llave foranea de la tabla TelefonoCajero';

CREATE TABLE CorreoCajero(
	RFCCajero CHAR(13),
	Correo VARCHAR(50)
);

ALTER TABLE CorreoCajero ADD CONSTRAINT PK_CorCajero PRIMARY KEY (RFCCajero, Correo);
ALTER TABLE CorreoCajero ADD CONSTRAINT FK_RFCCajero FOREIGN KEY (RFCCajero) REFERENCES Cajero (RFCCajero)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE CorreoCajero ADD CONSTRAINT cCorreoCajero CHECK(Correo SIMILAR TO '[aA0-zZ9]+@[A-Za-z0-9\-]*[.][A-Za-z.]+' escape '\');
COMMENT ON TABLE CorreoCajero IS 'Tabla que contiene los correos de los cajeros';
COMMENT ON COLUMN CorreoCajero.RFCCajero IS 'RFC del Cajero';
COMMENT ON COLUMN CorreoCajero.Correo IS 'Correo del Cajero';
COMMENT ON CONSTRAINT cCorreoCajero ON CorreoCajero IS 'Restriccion check el cual nos asegura que
cCorreoCajero sea una cadena con formato de correo electronico';
COMMENT ON CONSTRAINT PK_CorCajero ON CorreoCajero IS 'La llave primaria de la tabla CorreoCajero';
COMMENT ON CONSTRAINT FK_RFCCajero ON CorreoCajero IS 'La llave foranea de la tabla CorreoCajero';

-- Tablas relacionadas a Vendedor y sus restricciones
CREATE TABLE Vendedor(
    RFCVendedor CHAR(13),
	NumSucursal INT,
	Nombre VARCHAR(50),
	ApellidoP VARCHAR(50),
	ApellidoM VARCHAR(50),
	Calle VARCHAR(50),
	NumeroDireccion INT,
	Colonia VARCHAR(50),
	Municipio VARCHAR (50),
	CP CHAR(5),
	DiaNacimiento INT,
	MesNacimiento INT,
	AnioNacimiento INT ,
	Salario INT 
);
ALTER TABLE Vendedor ADD CONSTRAINT PK_RFCVendedor PRIMARY KEY (RFCVendedor);
ALTER TABLE Vendedor ADD CONSTRAINT FK_NumSucursalVendedor FOREIGN KEY (NumSucursal) REFERENCES Vivero(NumSucursal)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Vendedor ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Vendedor ALTER COLUMN ApellidoP SET NOT NULL;
ALTER TABLE Vendedor ALTER COLUMN ApellidoM SET NOT NULL;
ALTER TABLE Vendedor ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE Vendedor ALTER COLUMN NumeroDireccion SET NOT NULL;
ALTER TABLE Vendedor ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE Vendedor ALTER COLUMN Municipio SET NOT NULL;
ALTER TABLE Vendedor ALTER COLUMN Salario SET NOT NULL;


ALTER TABLE Vendedor ADD CONSTRAINT cRFC_Vendedor CHECK(RFCVendedor SIMILAR TO '[A-Z]{3,4}[0-9]{6}[0-9A-Z]{3}');
ALTER TABLE Vendedor ADD CONSTRAINT cCP_Vendedor CHECK(CP SIMILAR TO '[0-9]{5}');
ALTER TABLE Vendedor ADD CONSTRAINT cDiaN_Vendedor CHECK(DiaNacimiento BETWEEN 1 AND 31);
ALTER TABLE Vendedor ADD CONSTRAINT cMesN_Vendedor CHECK(MesNacimiento BETWEEN 1 AND 12);
ALTER TABLE Vendedor ADD CONSTRAINT cAnioN_Vendedor CHECK(AnioNacimiento BETWEEN 1900 AND 2100);
ALTER TABLE Vendedor DROP CONSTRAINT cAnioN_Vendedor;
ALTER TABLE Vendedor ADD CONSTRAINT cAnioN_Vendedor CHECK(AnioNacimiento BETWEEN 1950 AND 2022);

COMMENT ON TABLE Vendedor IS 'Tabla que contiene los vendedores de los viveros';
COMMENT ON COLUMN Vendedor.RFCVendedor IS 'RFC del Vendedor';
COMMENT ON COLUMN Vendedor.NumSucursal IS 'Numero de sucursal del Vivero';
COMMENT ON COLUMN Vendedor.Nombre IS 'Nombre del Vendedor';
COMMENT ON COLUMN Vendedor.ApellidoP IS 'Apellido paterno del Vendedor';
COMMENT ON COLUMN Vendedor.ApellidoM IS 'Apellido materno del Vendedor';
COMMENT ON COLUMN Vendedor.Calle IS 'Calle de la direccion del Vendedor';
COMMENT ON COLUMN Vendedor.NumeroDireccion IS 'Número de la direccion del Vendedor';
COMMENT ON COLUMN Vendedor.Colonia IS 'Colonia de la direccion del Vendedor';
COMMENT ON COLUMN Vendedor.Municipio IS 'Municipio de la direccion del Vendedor';
COMMENT ON COLUMN Vendedor.CP IS 'Colonia de la direccion del Vendedor';
COMMENT ON COLUMN Vendedor.DiaNacimiento IS 'Dia de nacimiento del Vendedor';
COMMENT ON COLUMN Vendedor.MesNacimiento IS 'Mes de nacimiento del Vendedor';
COMMENT ON COLUMN Vendedor.AnioNacimiento IS 'Año de nacimiento del Vendedor';
COMMENT ON COLUMN Vendedor.Salario IS 'Salario del Vendedor';
COMMENT ON CONSTRAINT PK_RFCVendedor ON Vendedor IS 'La llave primaria de la tabla Vendedor';
COMMENT ON CONSTRAINT FK_NumSucursalVendedor ON Vendedor IS 'La llave foranea de la tabla Vendedor';
COMMENT ON CONSTRAINT cRFC_Vendedor ON Vendedor IS 'Restriccion check el cual nos asegura que
cRFC_Vendedor sea una cadena fromada por 3 o 4 letras mayusculas seguido de 6 numeros y que
finaliza con 3 caracteres que pueden ser numeros y/o letras mayusculas';
COMMENT ON CONSTRAINT cCP_Vendedor ON Vendedor IS 'Restriccion check el cual nos asegura que
cCP_Vendedor sea una cadena de longitud 5 formada por numeros';
COMMENT ON CONSTRAINT cDiaN_Vendedor ON Vendedor IS 'Restriccion check el cual nos asegura que
cDiaN_Vendedor sea un numero entre el 1 y el 31';
COMMENT ON CONSTRAINT cMesN_Vendedor ON Vendedor IS 'Restriccion check el cual nos asegura que
cMesN_Vendedor sea un numero entre el 1 y el 12';
COMMENT ON CONSTRAINT cAnioN_Vendedor ON Vendedor IS 'Restriccion check el cual nos asegura que
cAnioN_Vendedor sea un numero entre el 1950 y el 2022';



CREATE TABLE TelefonoVendedor(
	RFCVendedor CHAR(13),
	Telefono CHAR(10)
);

ALTER TABLE TelefonoVendedor ADD CONSTRAINT PK_TelVendedor PRIMARY KEY (RFCVendedor, Telefono);
ALTER TABLE TelefonoVendedor ADD CONSTRAINT FK_RFCVendedorTel FOREIGN KEY (RFCVendedor) REFERENCES Vendedor (RFCVendedor)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE TelefonoVendedor ADD CONSTRAINT cTelVendedor CHECK(Telefono SIMILAR TO '[0-9]*');

COMMENT ON TABLE TelefonoVendedor IS 'Tabla que contiene los telefonos de los vendedores';
COMMENT ON COLUMN TelefonoVendedor.RFCVendedor IS 'RFC del Vendedor';
COMMENT ON COLUMN TelefonoVendedor.Telefono IS 'Telefono del Vendedor';
COMMENT ON CONSTRAINT cTelVendedor ON TelefonoVendedor IS 'Restriccion check el cual nos asegura que
cTelVendedor sea una cadena formada por numeros';
COMMENT ON CONSTRAINT PK_TelVendedor ON TelefonoVendedor IS 'La llave primaria de la tabla TelefonoVendedor';
COMMENT ON CONSTRAINT FK_RFCVendedorTel ON TelefonoVendedor IS 'La llave foranea de la tabla TelefonoVendedor';

CREATE TABLE CorreoVendedor(
	RFCVendedor CHAR(13),
	Correo VARCHAR(50)
);
ALTER TABLE CorreoVendedor ADD CONSTRAINT PK_CorVendedor PRIMARY KEY (RFCVendedor, Correo);
ALTER TABLE CorreoVendedor ADD CONSTRAINT FK_RFCVendedorCor FOREIGN KEY (RFCVendedor) REFERENCES Vendedor (RFCVendedor)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE CorreoVendedor ADD CONSTRAINT cCorreoVendedor CHECK(Correo SIMILAR TO '[aA0-zZ9]+@[A-Za-z0-9\-]*[.][A-Za-z.]+' escape '\');


COMMENT ON TABLE CorreoVendedor IS 'Tabla que contiene los correos de los vendedores';
COMMENT ON COLUMN CorreoVendedor.RFCVendedor IS 'RFC del Vendedor';
COMMENT ON COLUMN CorreoVendedor.Correo IS 'Correo del Vendedor';
COMMENT ON CONSTRAINT cCorreoVendedor ON CorreoVendedor IS 'Restriccion check el cual nos asegura que
cCorreoVendedor sea una cadena con formato de correo electronico';
COMMENT ON CONSTRAINT PK_CorVendedor ON CorreoVendedor IS 'La llave primaria de la tabla CorreoVendedor';
COMMENT ON CONSTRAINT FK_RFCVendedorCor ON CorreoVendedor IS 'La llave foranea de la tabla CorreoVendedor';

-- Tablas relacionadas a Cliente y sus restricciones

CREATE TABLE Cliente(
	IdCliente INT,
	Nombre VARCHAR(50),
	ApellidoP VARCHAR(50),
	ApellidoM VARCHAR(50),
	Direccion TEXT,
	DiaNacimiento INT,
	MesNacimiento INT,
	AnioNacimiento INT
);
ALTER TABLE Cliente ADD CONSTRAINT PK_IdCliente PRIMARY KEY (IdCliente);

ALTER TABLE Cliente ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Cliente ALTER COLUMN ApellidoP SET NOT NULL;
ALTER TABLE Cliente ALTER COLUMN ApellidoM SET NOT NULL;
ALTER TABLE Cliente ALTER COLUMN Direccion SET NOT NULL;
ALTER TABLE Cliente ALTER COLUMN DiaNacimiento SET NOT NULL;
ALTER TABLE Cliente ALTER COLUMN MesNacimiento SET NOT NULL;
ALTER TABLE Cliente ALTER COLUMN AnioNacimiento SET NOT NULL;

ALTER TABLE Cliente ADD CONSTRAINT cDiaN_Cliente CHECK(DiaNacimiento BETWEEN 1 AND 31);
ALTER TABLE Cliente ADD CONSTRAINT cMesN_Cliente CHECK(MesNacimiento BETWEEN 1 AND 12);
ALTER TABLE Cliente ADD CONSTRAINT cAnioN_Cliente CHECK(AnioNacimiento BETWEEN 1700 AND 2100);
ALTER TABLE Cliente DROP CONSTRAINT cAnioN_Cliente;
ALTER TABLE Cliente ADD CONSTRAINT cAnioN_Cliente CHECK(AnioNacimiento BETWEEN 1950 AND 2022);

COMMENT ON TABLE Cliente IS 'Tabla que contiene los clientes';
COMMENT ON COLUMN Cliente.IdCliente IS 'Id del Cliente';
COMMENT ON COLUMN Cliente.Nombre IS 'Nombre del Cliente';
COMMENT ON COLUMN Cliente.ApellidoP IS 'Apellido paterno del Cliente';
COMMENT ON COLUMN Cliente.ApellidoM IS 'Apellido materno del Cliente';
COMMENT ON COLUMN Cliente.Direccion IS 'Direccion del Cliente';
COMMENT ON COLUMN Cliente.DiaNacimiento IS 'Dia de nacimiento del Cliente';
COMMENT ON COLUMN Cliente.MesNacimiento IS 'Mes de nacimiento del Cliente';
COMMENT ON COLUMN Cliente.AnioNacimiento IS 'Año de nacimiento del Cliente';
COMMENT ON CONSTRAINT PK_IdCliente ON Cliente IS 'La llave primaria de la tabla Cliente';
COMMENT ON CONSTRAINT cDiaN_Cliente ON Cliente IS 'Restriccion check el cual nos asegura que
cDiaN_Cliente sea un numero entre el 1 y el 31';
COMMENT ON CONSTRAINT cMesN_Cliente ON Cliente IS 'Restriccion check el cual nos asegura que
cMesN_Cliente sea un numero entre el 1 y el 12';
COMMENT ON CONSTRAINT cAnioN_Cliente ON Cliente IS 'Restriccion check el cual nos asegura que
cAnioN_Cliente sea un numero entre el 1950 y el 2022';


CREATE TABLE CorreoCliente(
	IdCliente INT,
	Correo VARCHAR(50)
);
ALTER TABLE CorreoCliente ADD CONSTRAINT PK_CorCliente PRIMARY KEY (IdCliente, Correo);
ALTER TABLE CorreoCliente ADD CONSTRAINT FK_IdCliente FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE CorreoCliente ADD CONSTRAINT cCorreoCliente CHECK(Correo SIMILAR TO '[aA0-zZ9]+@[A-Za-z0-9\-]*[.][A-Za-z.]+' escape '\');

COMMENT ON TABLE CorreoCliente IS 'Tabla que contiene los correos de los clientes';
COMMENT ON COLUMN CorreoCliente.IdCliente IS 'RFC del Cliente';
COMMENT ON COLUMN CorreoCliente.Correo IS 'Correo del Cliente';
COMMENT ON CONSTRAINT cCorreoCliente ON CorreoCliente IS 'Restriccion check el cual nos asegura que
cCorreoCliente sea una cadena con formato de correo electronico';
COMMENT ON CONSTRAINT PK_CorCliente ON CorreoCliente IS 'La llave primaria de la tabla CorreoCliente';
COMMENT ON CONSTRAINT FK_IdCliente ON CorreoCliente IS 'La llave foranea de la tabla CorreoCliente';

CREATE TABLE TelefonoCliente(
	IdCliente INT,
	Telefono VARCHAR(10)
);
ALTER TABLE TelefonoCliente ADD CONSTRAINT PK_telCliente PRIMARY KEY (IdCliente, Telefono);
ALTER TABLE TelefonoCliente ADD CONSTRAINT FK_IdCliente FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE TelefonoCliente ADD CONSTRAINT cTelCliente CHECK(Telefono SIMILAR TO '[0-9]*');

COMMENT ON TABLE TelefonoCliente IS 'Tabla que contiene los telefonos de los clientes';
COMMENT ON COLUMN TelefonoCliente.IdCliente IS 'RFC del Cliente';
COMMENT ON COLUMN TelefonoCliente.Telefono IS 'Telefono del Cliente';
COMMENT ON CONSTRAINT cTelCliente ON TelefonoCliente IS 'Restriccion check el cual nos asegura que
cTelCliente sea una cadena formada por numeros';
COMMENT ON CONSTRAINT PK_telCliente ON TelefonoCliente IS 'La llave primaria de la tabla TelefonoCliente';
COMMENT ON CONSTRAINT FK_IdCliente ON TelefonoCliente IS 'La llave foranea de la tabla TelefonoCliente';

-- Planta africana ---

CREATE TABLE PlantaAfricana(
	NombreTaxonomico VARCHAR(150),
	NombreComun VARCHAR(50),
	TipoIluminacion TEXT,
	TipoSustrato TEXT,
	FrecRiego TEXT,
	DiaGerminacion INT,
	MesGerminacion INT,
	AnioGerminacion INT,
	Precio INT,
	Genero TEXT
);
ALTER TABLE PlantaAfricana ADD CONSTRAINT PK_NombreTaxonomico PRIMARY KEY (NombreTaxonomico);

ALTER TABLE PlantaAfricana ALTER COLUMN NombreTaxonomico SET NOT NULL;
ALTER TABLE PlantaAfricana ALTER COLUMN NombreComun SET NOT NULL;
ALTER TABLE PlantaAfricana ALTER COLUMN TipoIluminacion SET NOT NULL;
ALTER TABLE PlantaAfricana ALTER COLUMN TipoSustrato SET NOT NULL;
ALTER TABLE PlantaAfricana ALTER COLUMN FrecRiego SET NOT NULL;
ALTER TABLE PlantaAfricana ALTER COLUMN DiaGerminacion SET NOT NULL;
ALTER TABLE PlantaAfricana ALTER COLUMN MesGerminacion SET NOT NULL;
ALTER TABLE PlantaAfricana ALTER COLUMN AnioGerminacion SET NOT NULL;
ALTER TABLE PlantaAfricana ALTER COLUMN Precio SET NOT NULL;
ALTER TABLE PlantaAfricana ALTER COLUMN Genero SET NOT NULL;

ALTER TABLE PlantaAfricana ADD CONSTRAINT cDiaG_PlantaA CHECK(DiaGerminacion BETWEEN 1 AND 31);
ALTER TABLE PlantaAfricana ADD CONSTRAINT cMesG_PlantaA CHECK(MesGerminacion BETWEEN 1 AND 12);
ALTER TABLE PlantaAfricana ADD CONSTRAINT cAnioG_PlantaA CHECK(AnioGerminacion BETWEEN 1700 AND 2100);
ALTER TABLE PlantaAfricana ADD CONSTRAINT cTipoIlumina_PlantaA CHECK(TipoIluminacion='De sol' OR TipoIluminacion='De sombra' OR TipoIluminacion='De resolana');

ALTER TABLE PlantaAfricana ADD CONSTRAINT cTipoSustrato_PlantaA CHECK(TipoSustrato='Agua' OR TipoSustrato='Turba' OR TipoSustrato='Arcilla' OR TipoSustrato='Arena' OR TipoSustrato='Corteza' OR TipoSustrato='Grava' OR TipoSustrato='Tierra volcanica');


COMMENT ON TABLE PlantaAfricana IS 'Tabla que contiene las plantas africanas';
COMMENT ON COLUMN PlantaAfricana.NombreTaxonomico IS 'Nombre taxonomico de la planta africana';
COMMENT ON COLUMN PlantaAfricana.NombreComun IS 'Nombre comun de la planta africana';
COMMENT ON COLUMN PlantaAfricana.TipoIluminacion IS 'Tipo de iluminacion de la planta africana';
COMMENT ON COLUMN PlantaAfricana.TipoSustrato IS 'Tipo de sustrato de la planta africana';
COMMENT ON COLUMN PlantaAfricana.FrecRiego IS 'Frecuencia de riego de la planta africana';
COMMENT ON COLUMN PlantaAfricana.DiaGerminacion IS 'Dia de germinacion de la planta africana';
COMMENT ON COLUMN PlantaAfricana.MesGerminacion IS 'Mes de germinacion de la planta africana';
COMMENT ON COLUMN PlantaAfricana.AnioGerminacion IS 'Año de germinacion de la planta africana';
COMMENT ON COLUMN PlantaAfricana.Precio IS 'Precio de la planta africana';
COMMENT ON COLUMN PlantaAfricana.Genero IS 'Genero de la planta africana';
COMMENT ON CONSTRAINT PK_NombreTaxonomico ON PlantaAfricana IS 'La llave primaria de la tabla PlantaAfricana';
COMMENT ON CONSTRAINT cTipoIlumina_PlantaA ON PlantaAfricana IS 'Restriccion check el cual nos asegura que
cTipoIlumina_PlantaA sea una cadena que diga "De sol", "De sombra" o "De resolana"';
COMMENT ON CONSTRAINT cDiaG_PlantaA ON PlantaAfricana IS 'Restriccion check el cual nos asegura que
cDiaG_PlantaA sea un numero entre el 1 y el 31';
COMMENT ON CONSTRAINT cMesG_PlantaA ON PlantaAfricana IS 'Restriccion check el cual nos asegura que
cMesG_PlantaA sea un numero entre el 1 y el 12';
COMMENT ON CONSTRAINT cAnioG_PlantaA ON PlantaAfricana IS 'Restriccion check el cual nos asegura que
cAnioG_PlantaA sea un numero entre el 1700 y el 2100';


COMMENT ON CONSTRAINT cTipoSustrato_PlantaA ON PlantaAfricana IS 'Restriccion check el cual nos asegura que Tipo Sustrato sea Agua, Turba, Arcilla, Arena, Corteza, Grava, Tierra volcanica';


CREATE TABLE EstarAfricana(
	NumSucursal INT,
	NombreTaxonomico VARCHAR(150)
);
ALTER TABLE EstarAfricana ADD CONSTRAINT FK_NombreTaxonomico FOREIGN KEY (NombreTaxonomico) REFERENCES PlantaAfricana (NombreTaxonomico)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE EstarAfricana ADD CONSTRAINT FK_NumSucursal FOREIGN KEY (NumSucursal) REFERENCES Vivero (NumSucursal)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE EstarAfricana ALTER COLUMN NumSucursal SET NOT NULL; 
ALTER TABLE EstarAfricana ALTER COLUMN NombreTaxonomico SET NOT NULL; 

COMMENT ON TABLE EstarAfricana IS 'Tabla que contiene las tuplas de las plantas africanas y el vivero en el que se encuentran';
COMMENT ON COLUMN EstarAfricana.NumSucursal IS 'Numero de sucursal del Vivero';
COMMENT ON COLUMN EstarAfricana.NombreTaxonomico IS 'Nombre taxonomico de la planta africana';
COMMENT ON CONSTRAINT FK_NumSucursal ON EstarAfricana IS 'La llave foranea de la tabla EstarAfricana';
COMMENT ON CONSTRAINT FK_NombreTaxonomico ON EstarAfricana IS 'La llave foranea de la tabla EstarAfricana';


CREATE TABLE CuidadoAfricano(
	NombreTaxonomico VARCHAR(150),
	Cuidado TEXT
);
ALTER TABLE CuidadoAfricano ADD CONSTRAINT PK_NombreTaxonomicoCA PRIMARY KEY (NombreTaxonomico); 
ALTER TABLE CuidadoAfricano DROP CONSTRAINT PK_NombreTaxonomicoCA;

ALTER TABLE CuidadoAfricano ADD CONSTRAINT PK_CuidadoAfricano PRIMARY KEY (NombreTaxonomico,Cuidado);
ALTER TABLE CuidadoAfricano ADD CONSTRAINT FK_NombreTaxonomicoCA FOREIGN KEY (NombreTaxonomico) REFERENCES PlantaAfricana
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE CuidadoAfricano ALTER COLUMN Cuidado SET NOT NULL;

COMMENT ON TABLE CuidadoAfricano IS 'Tabla que contiene los cuidados que requieren las plantas africanas';
COMMENT ON COLUMN CuidadoAfricano.Cuidado IS 'Cuidado de la planta africana';
COMMENT ON COLUMN CuidadoAfricano.NombreTaxonomico IS 'Nombre taxonomico de la planta africana';
COMMENT ON CONSTRAINT PK_CuidadoAfricano ON CuidadoAfricano IS 'La llave primaria de la tabla CuidadoAfricano';
COMMENT ON CONSTRAINT FK_NombreTaxonomicoCA ON CuidadoAfricano IS 'La llave foranea de la tabla CuidadoAfricano';

-- Planta Cactus --

CREATE TABLE PlantaCactus(
	NombreTaxonomico VARCHAR(150),
	NombreComun VARCHAR(50),
	TipoIluminacion TEXT,
	TipoSustrato TEXT,
	FrecRiego TEXT,
	DiaGerminacion INT,
	MesGerminacion INT,
	AnioGerminacion INT,
	Precio INT,
	Genero TEXT
);

ALTER TABLE PlantaCactus ADD CONSTRAINT PK_NombreTaxonomicoCactus PRIMARY KEY (NombreTaxonomico);

ALTER TABLE PlantaCactus ALTER COLUMN NombreTaxonomico SET NOT NULL;
ALTER TABLE PlantaCactus ALTER COLUMN NombreComun SET NOT NULL;
ALTER TABLE PlantaCactus ALTER COLUMN TipoIluminacion SET NOT NULL;
ALTER TABLE PlantaCactus ALTER COLUMN TipoSustrato SET NOT NULL;
ALTER TABLE PlantaCactus ALTER COLUMN FrecRiego SET NOT NULL;
ALTER TABLE PlantaCactus ALTER COLUMN DiaGerminacion SET NOT NULL;
ALTER TABLE PlantaCactus ALTER COLUMN MesGerminacion SET NOT NULL;
ALTER TABLE PlantaCactus ALTER COLUMN AnioGerminacion SET NOT NULL;
ALTER TABLE PlantaCactus ALTER COLUMN Precio SET NOT NULL;
ALTER TABLE PlantaCactus ALTER COLUMN Genero SET NOT NULL;

ALTER TABLE PlantaCactus ADD CONSTRAINT cDiaG_PlantaCactus CHECK(DiaGerminacion BETWEEN 1 AND 31);
ALTER TABLE PlantaCactus ADD CONSTRAINT cMesG_PlantaCactus CHECK(MesGerminacion BETWEEN 1 AND 12);
ALTER TABLE PlantaCactus ADD CONSTRAINT cAnioG_PlantaCactus CHECK(AnioGerminacion BETWEEN 1700 AND 2100);
ALTER TABLE PlantaCactus ADD CONSTRAINT cTipoIlumina_PlantaCactus CHECK(TipoIluminacion='De sol' OR TipoIluminacion='De sombra' OR TipoIluminacion='De resolana');

ALTER TABLE PlantaCactus ADD CONSTRAINT cTipoSustrato_PlantaCactus CHECK(TipoSustrato='Agua' OR TipoSustrato='Turba' OR TipoSustrato='Arcilla' OR TipoSustrato='Arena' OR TipoSustrato='Corteza' OR TipoSustrato='Grava' OR TipoSustrato='Tierra volcanica');


COMMENT ON TABLE PlantaCactus IS 'Tabla que contiene las plantas cactus';
COMMENT ON COLUMN PlantaCactus.NombreTaxonomico IS 'Nombre taxonomico de la planta cactus';
COMMENT ON COLUMN PlantaCactus.NombreComun IS 'Nombre comun de la planta cactus';
COMMENT ON COLUMN PlantaCactus.TipoIluminacion IS 'Tipo de iluminacion de la planta cactus';
COMMENT ON COLUMN PlantaCactus.TipoSustrato IS 'Tipo de sustrato de la planta cactus';
COMMENT ON COLUMN PlantaCactus.FrecRiego IS 'Frecuencia de riego de la planta cactus';
COMMENT ON COLUMN PlantaCactus.DiaGerminacion IS 'Dia de germinacion de la planta cactus';
COMMENT ON COLUMN PlantaCactus.MesGerminacion IS 'Mes de germinacion de la planta cactus';
COMMENT ON COLUMN PlantaCactus.AnioGerminacion IS 'Año de germinacion de la planta cactus';
COMMENT ON COLUMN PlantaCactus.Precio IS 'Precio de la planta cactus';
COMMENT ON COLUMN PlantaCactus.Genero IS 'Genero de la planta cactus';
COMMENT ON CONSTRAINT PK_NombreTaxonomicoCactus ON PlantaCactus IS 'La llave primaria de la tabla PlantaCactus';
COMMENT ON CONSTRAINT cTipoIlumina_PlantaCactus ON PlantaCactus IS 'Restriccion check el cual nos asegura que
cTipoIlumina_PlantaCactus sea una cadena que diga "De sol", "De sombra" o "De resolana"';
COMMENT ON CONSTRAINT cDiaG_PlantaCactus ON PlantaCactus IS 'Restriccion check el cual nos asegura que
cDiaG_PlantaCactus sea un numero entre el 1 y el 31';
COMMENT ON CONSTRAINT cMesG_PlantaCactus ON PlantaCactus IS 'Restriccion check el cual nos asegura que
cMesG_PlantaCactus sea un numero entre el 1 y el 12';
COMMENT ON CONSTRAINT cAnioG_PlantaCactus ON PlantaCactus IS 'Restriccion check el cual nos asegura que
cAnioG_PlantaCactus sea un numero entre el 1700 y el 2100';


COMMENT ON CONSTRAINT cTipoSustrato_PlantaCactus ON PlantaCactus IS 'Restriccion check el cual nos asegura que Tipo Sustrato sea Agua, Turba, Arcilla, Arena, Corteza, Grava, Tierra volcanica';

CREATE TABLE EstarCactus(
	NumSucursal INT,
	NombreTaxonomico VARCHAR(150)
);

ALTER TABLE EstarCactus ADD CONSTRAINT FK_NumSucursal FOREIGN KEY (NumSucursal) REFERENCES Vivero (NumSucursal)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE EstarCactus ADD CONSTRAINT FK_NombreTaxonomico FOREIGN KEY (NombreTaxonomico) REFERENCES PlantaCactus (NombreTaxonomico)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE EstarCactus ALTER COLUMN NumSucursal SET NOT NULL; 
ALTER TABLE EstarCactus ALTER COLUMN NombreTaxonomico SET NOT NULL; 

COMMENT ON TABLE EstarCactus IS 'Tabla que contiene las tuplas de las plantas cactus y el vivero en el que se encuentran';
COMMENT ON COLUMN EstarCactus.NumSucursal IS 'Numero de sucursal del Vivero';
COMMENT ON COLUMN EstarCactus.NombreTaxonomico IS 'Nombre taxonomico de la planta cactus';
COMMENT ON CONSTRAINT FK_NumSucursal ON EstarCactus IS 'La llave foranea de la tabla EstarCactus';
COMMENT ON CONSTRAINT FK_NombreTaxonomico ON EstarCactus IS 'La llave foranea de la tabla EstarCactus';


CREATE TABLE CuidadoCactus(
	NombreTaxonomico VARCHAR(150),
	Cuidado TEXT
);
ALTER TABLE CuidadoCactus ADD CONSTRAINT PK_NombreTaxonomicoCactusCuidado PRIMARY KEY (NombreTaxonomico);
ALTER TABLE CuidadoCactus DROP CONSTRAINT PK_NombreTaxonomicoCactusCuidado;
ALTER TABLE CuidadoCactus ADD CONSTRAINT PK_CuidadoCactus PRIMARY KEY (NombreTaxonomico,Cuidado);


ALTER TABLE CuidadoCactus ADD CONSTRAINT FK_NombreTaxonomicoCactus FOREIGN KEY (NombreTaxonomico) REFERENCES PlantaCactus (NombreTaxonomico)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE CuidadoCactus ALTER COLUMN Cuidado SET NOT NULL;

COMMENT ON TABLE CuidadoCactus IS 'Tabla que contiene los cuidados que requieren las plantas cactus';
COMMENT ON COLUMN CuidadoCactus.Cuidado IS 'Cuidado de la planta cactus';
COMMENT ON COLUMN CuidadoCactus.NombreTaxonomico IS 'Nombre taxonomico de la planta cactus';
COMMENT ON CONSTRAINT PK_CuidadoCactus ON CuidadoCactus IS 'La llave primaria de la tabla CuidadoCactus';
COMMENT ON CONSTRAINT FK_NombreTaxonomicoCactus ON CuidadoCactus IS 'La llave foranea de la tabla CuidadoCactus';

-- Tablas relacionados con productos y pedidos

CREATE TABLE PedidoLinea(
	IdPedido INT,
	IdCliente INT,
	NumSucursal INT,
	Monto INT,
	FormaPago TEXT,
	DiaPedido INT,
	MesPedido INT,
	AnioPedido INT,
	DireccionPedido TEXT,
	NumeroSeguimiento INT
);

ALTER TABLE PedidoLinea ADD CONSTRAINT PK_IDPedido PRIMARY KEY(IdPedido);
ALTER TABLE PedidoLinea ADD CONSTRAINT FK_IdCliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE PedidoLinea ADD CONSTRAINT FR_NumSucursal FOREIGN KEY (NumSucursal) REFERENCES Vivero (NumSucursal)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE PedidoLinea ALTER COLUMN IdPedido SET NOT NULL;
ALTER TABLE PedidoLinea ALTER COLUMN IdCliente SET NOT NULL;
ALTER TABLE PedidoLinea ALTER COLUMN NumSucursal SET NOT NULL;
ALTER TABLE PedidoLinea ALTER COLUMN Monto SET NOT NULL;
ALTER TABLE PedidoLinea ALTER COLUMN FormaPago SET NOT NULL;
ALTER TABLE PedidoLinea ALTER COLUMN DireccionPedido SET NOT NULL;
ALTER TABLE PedidoLinea ALTER COLUMN NumeroSeguimiento SET NOT NULL;

ALTER TABLE PedidoLinea ADD CONSTRAINT cDiaP_PedidoLinea CHECK(DiaPedido BETWEEN 1 AND 31);
ALTER TABLE PedidoLinea ADD CONSTRAINT cMesP_PedidoLinea CHECK(MesPedido BETWEEN 1 AND 12);
ALTER TABLE PedidoLinea ADD CONSTRAINT cAnioP_PedidoLinea CHECK(AnioPedido BETWEEN 1700 AND 2100);

COMMENT ON TABLE PedidoLinea IS 'Tabla que contiene los pedidos en linea de los viveros';
COMMENT ON COLUMN PedidoLinea.IdPedido IS 'Id del Pedido';
COMMENT ON COLUMN PedidoLinea.IdCliente IS 'Id del Cliente';
COMMENT ON COLUMN PedidoLinea.NumSucursal IS 'Numero de sucursal del Vivero';
COMMENT ON COLUMN PedidoLinea.Monto IS 'Monto del Pedido';
COMMENT ON COLUMN PedidoLinea.FormaPago IS 'Forma de pago del Pedido';
COMMENT ON COLUMN PedidoLinea.DiaPedido IS 'Dia en que se realizo el Pedido';
COMMENT ON COLUMN PedidoLinea.MesPedido IS 'Mes en que se realizo el Pedido';
COMMENT ON COLUMN PedidoLinea.AnioPedido IS 'Año en que se realizo el Pedido';
COMMENT ON COLUMN PedidoLinea.DireccionPedido IS 'Dirección a la que se envia el Pedido';
COMMENT ON COLUMN PedidoLinea.NumeroSeguimiento IS 'Numero de seguimiento del Pedido';

CREATE TABLE ProductoLinea(
	IdPedido INT,
	Producto TEXT
);

ALTER TABLE ProductoLinea ADD CONSTRAINT PK_Producto PRIMARY KEY (idPedido,Producto);
ALTER TABLE ProductoLinea ADD CONSTRAINT FK_IdPedido FOREIGN KEY (idPedido) REFERENCES PedidoLinea (IdPedido)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ProductoLinea ALTER COLUMN Producto SET NOT NULL;

COMMENT ON TABLE ProductoLinea IS 'Tabla que contiene los productos de un Pedido en linea';
COMMENT ON COLUMN ProductoLinea.IdPedido IS 'Id del Pedido';
COMMENT ON COLUMN ProductoLinea.Producto IS 'Producto del Pedido';
COMMENT ON CONSTRAINT PK_Producto ON ProductoLinea IS 'La llave primaria de la tabla ProductoVivero';
COMMENT ON CONSTRAINT FK_IdPedido ON ProductoLinea IS 'La llave foranea de la tabla ProductoVivero';

CREATE TABLE PedidoFisico(
	IdPedido INT,
	IdCliente INT,
	NumSucursal INT,
	RFCCajero CHAR(13),
	RFCVendedor CHAR(13),
	Monto INT,
	FormaPago TEXT,
	DiaPedido INT,
	MesPedido INT,
	AnioPedido INT
);

ALTER TABLE PedidoFisico ADD CONSTRAINT PK_IDPedidoFisico PRIMARY KEY(IdPedido);
ALTER TABLE PedidoFisico ADD CONSTRAINT FK_IdCliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE PedidoFisico ADD CONSTRAINT FR_NumSucursal FOREIGN KEY (NumSucursal) REFERENCES Vivero (NumSucursal)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE PedidoFisico ADD CONSTRAINT FR_RFCCajero FOREIGN KEY (RFCCajero) REFERENCES Cajero (RFCCajero)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE PedidoFisico ADD CONSTRAINT FR_RFCVendedor FOREIGN KEY (RFCVendedor) REFERENCES Vendedor (RFCVendedor)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE PedidoFisico ALTER COLUMN IdPedido SET NOT NULL;
ALTER TABLE PedidoFisico ALTER COLUMN IdCliente SET NOT NULL;
ALTER TABLE PedidoFisico ALTER COLUMN NumSucursal SET NOT NULL;
ALTER TABLE PedidoFisico ALTER COLUMN RFCCajero SET NOT NULL;
ALTER TABLE PedidoFisico ALTER COLUMN RFCVendedor SET NOT NULL;
ALTER TABLE PedidoFisico ALTER COLUMN Monto SET NOT NULL;
ALTER TABLE PedidoFisico ALTER COLUMN FormaPago SET NOT NULL;

ALTER TABLE PedidoFisico ADD CONSTRAINT cDiaP_PedidoVivero CHECK(DiaPedido BETWEEN 1 AND 31);
ALTER TABLE PedidoFisico ADD CONSTRAINT cMesP_PedidoVivero CHECK(MesPedido BETWEEN 1 AND 12);
ALTER TABLE PedidoFisico ADD CONSTRAINT cAnioP_PedidoVivero CHECK(AnioPedido BETWEEN 1700 AND 2100);

COMMENT ON TABLE PedidoFisico IS 'Tabla que contiene los pedidos fisicos de los viveros';
COMMENT ON COLUMN PedidoFisico.IdPedido IS 'Id del Pedido';
COMMENT ON COLUMN PedidoFisico.IdCliente IS 'Id del Cliente';
COMMENT ON COLUMN PedidoFisico.NumSucursal IS 'Numero de sucursal del Vivero';
COMMENT ON COLUMN PedidoFisico.RFCCajero IS 'RFC del Cajero que atiende el Pedido';
COMMENT ON COLUMN PedidoFisico.RFCVendedor IS 'RFC del Vendedor que atiende el Pedido';
COMMENT ON COLUMN PedidoFisico.Monto IS 'Monto del Pedido';
COMMENT ON COLUMN PedidoFisico.FormaPago IS 'Forma de pago del Pedido';
COMMENT ON COLUMN PedidoFisico.DiaPedido IS 'Dia en que se realizo el Pedido';
COMMENT ON COLUMN PedidoFisico.MesPedido IS 'Mes en que se realizo el Pedido';
COMMENT ON COLUMN PedidoFisico.AnioPedido IS 'Año en que se realizo el Pedido';


CREATE TABLE ProductoFisico(
	IdPedido INT,
	Producto TEXT
);

ALTER TABLE ProductoFisico ADD CONSTRAINT PK_ProductoFisico PRIMARY KEY (idPedido,Producto);
ALTER TABLE ProductoFisico ADD CONSTRAINT FK_IdPedido FOREIGN KEY (idPedido) REFERENCES PedidoFisico (IdPedido)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ProductoFisico ALTER COLUMN Producto SET NOT NULL;

COMMENT ON TABLE ProductoFisico IS 'Tabla que contiene los productos de un Pedido fisico';
COMMENT ON COLUMN ProductoFisico.IdPedido IS 'Id del Pedido';
COMMENT ON COLUMN ProductoFisico.Producto IS 'Producto del Pedido';
COMMENT ON CONSTRAINT PK_ProductoFisico ON ProductoFisico IS 'La llave primaria de la tabla ProductoFisico';
COMMENT ON CONSTRAINT FK_IdPedido ON ProductoFisico IS 'La llave foranea de la tabla ProductoFisico';