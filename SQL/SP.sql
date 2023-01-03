-- Un SP el cual se encarga de registrar un cliente, en este SP, debes introducir la información del cliente y se debe encargar de insertar en la tabla correspondiente, es importante que no permitan la inserción de números o símbolos cuando sean campos relacionados a nombres.
CREATE OR REPLACE PROCEDURE insertaCliente(id int, nom VARCHAR(50), aP VARCHAR(50), aM VARCHAR(50), Dir TEXT, DiaN int, MesN int, AnioN int)
AS $$
BEGIN
    IF nom IS NOT NULL AND (nom SIMILAR TO '[a-zA-Z]+') THEN
        IF aP IS NOT NULL AND (aP SIMILAR TO '[a-zA-Z]+') THEN
            IF aM IS NOT NULL AND (aM SIMILAR TO '[a-zA-Z]+') THEN
                INSERT INTO Cliente(idcliente,nombre,apellidop,apellidom,direccion,dianacimiento,mesnacimiento,anionacimiento) VALUES (id, nom , aP, aM, Dir, DiaN, MesN, AnioN);
            ELSE
                RAISE EXCEPTION 'Caracteres no permitidos' USING HINT ='Verifica que el apellido materno no contenga números o símbolos';
            END IF;
        ELSE
            RAISE EXCEPTION 'Caracteres no permitidos' USING HINT ='Verifica que el apellido paterno no contenga números o símbolos';
        END IF;
    ELSE
        RAISE EXCEPTION 'Caracteres no permitidos' USING HINT ='Verifica que el nombre no contenga números o símbolos';
       
    END IF;
END;
$$
LANGUAGE plpgsql;

--Un SP el cual se encarga de eliminar un cliente, en este SP debes introducir el identificador del cliente y cuando elimines ese cliente se debe eliminar todas sus referencias.

CREATE OR REPLACE PROCEDURE eliminarCliente(id int)
AS $$
BEGIN
DELETE FROM CorreoCliente WHERE IdCliente=id;
DELETE FROM TelefonoCliente WHERE IdCliente=id;
DELETE FROM PedidoLinea WHERE IdCliente=id;
DELETE FROM PedidoFisico WHERE IdCliente=id;
DELETE FROM Cliente WHERE IdCliente=id;
END;
$$
LANGUAGE plpgsql;


CALL eliminarCliente(11000);
CALL eliminarCliente(11001);
CALL eliminarCliente(11002);

CALL insertaCliente(11000,'Chiquia','Lack','Berka','9 Erie Plaza',30,4,2015);
CALL insertaCliente(11001,'Chiquia4','Lack','Berka','9 Erie Plaza',30,4,2015);
CALL insertaCliente(11002,'Chiquia','Lack4','Berka','9 Erie Plaza',30,4,2015);

SELECT * FROM Cliente WHERE IdCliente=11000;
SELECT * FROM Cliente WHERE IdCliente=11001;
SELECT * FROM Cliente WHERE IdCliente=11002;

