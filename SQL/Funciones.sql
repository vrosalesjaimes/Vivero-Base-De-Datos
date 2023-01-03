-- Una función que reciba el identificador de empleado y regrese la edad del mismo.
CREATE OR REPLACE FUNCTION obtenEdad(CHAR)
RETURNS INT
AS $$
DECLARE
    Edad INT;
    Empleado INT;
BEGIN
    empleado := (SELECT AnioNacimiento 
                 FROM Gerente 
                 WHERE RFCGerente=$1
                 UNION 
                 SELECT AnioNacimiento 
                 FROM Cuidador 
                 WHERE RFCCuidador=$1
                 UNION
                 SELECT AnioNacimiento 
                 FROM Vendedor 
                 WHERE RFCVendedor=$1
                 UNION
                 SELECT AnioNacimiento 
                 FROM Cajero 
                 WHERE RFCCajero=$1
                 );
    --AnioActual
    Edad :=(SELECT EXTRACT(YEAR FROM (SELECT current_date)))-empleado;
    RETURN Edad;
END;
$$
LANGUAGE plpgsql;

-- Ejemplos de obtenEdad
--SELECT obtenEdad('YTWU242338TCK');
--SELECT obtenEdad('EHUP692613U7O');
--SELECT obtenEdad('OKTU569726J08');
--SELECT obtenEdad('IRLU890069LVX');

-- Una función que reciba idVivero y regrese las ganancias de ese Vivero.
-- Calcula la suma del monto de los pedido fisicos y en linea del vivero
CREATE OR REPLACE FUNCTION obtenGanancias(INT)
RETURNS INT
AS $$
DECLARE
    Sucursal INT;
    MontoPedidoLinea INT;
    MontoPedidoFisico INT;
    Total INT;
BEGIN
    Sucursal := $1;
    Total := 0;
    MontoPedidoLinea := (SELECT SUM(Monto) FROM (SELECT Monto 
                                            FROM PedidoLinea 
                                            WHERE NumSucursal=Sucursal) 
                                            AS PLinea);
    MontoPedidoFisico := (SELECT SUM(Monto) FROM (SELECT Monto 
                                            FROM PedidoFisico 
                                            WHERE NumSucursal=Sucursal) 
                                            AS PFisico);
    Total := Total+MontoPedidoLinea+MontoPedidoFisico;
    RETURN Total;
END;
$$
LANGUAGE plpgsql;

-- Ejemplos de obtenGanancias
--SELECT obtenGanancias(45);
--SELECT obtenGanancias(1);
--SELECT obtenGanancias(10);
--SELECT obtenGanancias(12);