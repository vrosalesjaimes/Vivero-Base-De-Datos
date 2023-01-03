-- Un trigger que se encargue de invertir el apellido paterno con el apellido materno de los empleados.
CREATE OR REPLACE FUNCTION invertirApellidos() RETURNS TRIGGER
AS
$$
DECLARE
    aPaterno VARCHAR(50);
    aMaterno VARCHAR(50);
BEGIN
	aPaterno := (SELECT ApellidoP FROM TG_TABLE_NAME);
	aMaterno := (SELECT ApellidoM FROM TG_TABLE_NAME);
	IF TG_OP = 'UPDATE' THEN
		UPDATE TG_TABLE_NAME SET ApellidoP=aMaterno, ApellidoM=aPaterno;
	END IF;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS invertirGerente ON Gerente;
CREATE TRIGGER invertirGerente
	AFTER UPDATE 
	ON Gerente
	FOR EACH ROW
	EXECUTE PROCEDURE invertirApellidos();


DROP TRIGGER IF EXISTS invertirCuidador ON Cuidador;
CREATE TRIGGER invertirCuidador
	AFTER UPDATE
	ON Cuidador
	FOR EACH ROW
	EXECUTE FUNCTION invertirApellidos();


DROP TRIGGER IF EXISTS invertirVendedor ON Vendedor;
CREATE TRIGGER invertirVendedor
	AFTER UPDATE 
	ON Vendedor
	FOR EACH ROW
	EXECUTE PROCEDURE invertirApellidos();


DROP TRIGGER IF EXISTS invertirCajero ON Cajero;
CREATE TRIGGER invertirCajero
	AFTER UPDATE 
	ON Cajero
	FOR EACH ROW
	EXECUTE PROCEDURE invertirApellidos();

	-- Un trigger que se encargue de evitar que se pueda modificar y borrar de la tabla plantas.
CREATE OR REPLACE FUNCTION evitarMod()RETURNS TRIGGER
AS
$$
BEGIN
	IF TG_OP = 'UPDATE' THEN
		RAISE EXCEPTION 'No permitido' USING HINT ='No es posible modificar la tabla plantas';
	END IF;
	IF TG_OP = 'DELETE' THEN
		RAISE EXCEPTION 'No permitido' USING HINT ='No es posible borrar en la tabla plantas';
	END IF;
	IF TG_OP = 'INSERT' THEN
		RAISE EXCEPTION 'No permitido' USING HINT ='No es posible insertar en la tabla plantas';
	END IF;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS modPlantaA ON PlantaAfricana;

CREATE TRIGGER modPlantaA
	AFTER UPDATE OR DELETE OR INSERT
	ON PlantaAfricana
	FOR EACH ROW
	EXECUTE PROCEDURE evitarMod();

DROP TRIGGER IF EXISTS modPlantaC ON PlantaCactus;
CREATE TRIGGER modPlantaC
	AFTER UPDATE OR DELETE OR INSERT
	ON PlantaCactus
	FOR EACH ROW
	EXECUTE PROCEDURE evitarMod();


INSERT INTO PlantaAfricana(nombretaxonomico,nombrecomun,tipoiluminacion,tiposustrato,frecriego,diagerminacion,mesgerminacion,aniogerminacion,precio,genero) VALUES ('Lecan Ach. 1','Rim Lichen','De sombra','Grava','Yearly',9,12,1989,780,'Haworthia');
UPDATE PlantaAfricana SET tipoIluminacion='De sombra' WHERE nombretaxonomico = 'Cercocarpus montanus Raf. var. montanus';
DELETE FROM PlantaAfricana WHERE nombretaxonomico = 'Cercocarpus montanus Raf. var. montanus';
SELECT * FROM PlantaAfricana WHERE nombretaxonomico = 'Cercocarpus montanus Raf. var. montanus';

