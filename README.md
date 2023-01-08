# El gran Vivero : Base de datos
La cadena mexicana de viveros “El Gran Vivero” ha crecido de gran manera durante los  últimos años. Esta cadena comenzó con un vivero, al ser un negocio familiar el registro de las compras y plantas a la venta se registran de manera manual en un cuaderno, al igual que el registro de las ganancias.

Actualmente se cuenta con 15 viveros en el territorio nacional, por lo cual el manejo de las operaciones en cuadernos se ha vuelto complicado.

Viendo la situación, el director ejecutivo de “El Gran Vivero” decidió contratar a los alumnos de la Facultad de Ciencias, para que les ayuden a encontrar una solución la cual permita la administración de los datos de una manera sencilla, centralizada y consistente.

Para darle una solución a este problema es necesario tomar en cuenta los siguientes aspectos:

 - Se deberán almacenar los datos básicos de los viveros: nombre del vivero, dirección, teléfono(s), fecha de apertura y todos los otros datos que se consideren relevantes.
 - Se deberán almacenar los datos básicos de los empleados: nombre completo, dirección, correo(s) electrónico(s), teléfono(s), fecha de nacimiento, salario y todos los otros datos que se consideren relevantes, además de su información básica interesa saber el rol que tienen en el vivero, los cuales son: gerente de vivero, cuidadores de plantas de cada vivero, los encargados de mostrar las plantas a los clientes y los cajeros de cada vivero.
 - No olvides que un empleado solo puede trabajar en un vivero y solo puede tener un rol dentro de éste.
 - Los viveros se dividen en dos áreas principalmente
   - **Platas africanas**: Haworthia y Gasteria
   - **Cactus**: Astrophytum y Ariocarpus
- En el caso de las plantas, las características que se desean almacenar en cada una son: precio, cantidad de plantas por invernadero, nombre, género, cuidados básicos, tipo de sustrato, si es de sol, sombra o resolana, fecha de germinación, cada cuánto se riega.
- Para las ventas físicas que se realizan, se requiere un informe detallado de cada una que incluya: vivero en donde se adquirió, empleado que efectuó el cobro, el empleado que ayudó al cliente con su compra, número de productos adquiridos, el desglose de los productos adquiridos, precio a pagar por desglose de productos y total.
- Se debe de registrar la forma en la que se realizó el pago de la venta, el pago puede ser cualquiera de las siguientes combinaciones: efectivo, tarjeta de crédito o débito.
-  Adicional a esto, el director ejecutivo de “El Gran Vivero” desea implementar las ventas en línea, por lo cual será necesario tener un registro de los clientes del vivero.
- Se deberán almacenar los datos básicos de los clientes: nombre completo, dirección, correo(s) electrónico(s), teléfono(s), fecha de nacimiento y todos los otros datos que se consideren relevantes.
- Se deberán almacenar los datos de las ventas electrónicas: nombre del cliente, dirección de envío, fecha del pedido, número de productos adquiridos, el desglose de los productos adquiridos, precio a pagar por desglose de productos, total, el n ́umero de seguimiento del paquete y la forma de pago.
Se deberá entregar una base de datos funcional para que “El Gran Vivero” pueda operar al final del semestre 2023-1. Por lo que se debe trabajar en lo solicitado por la cadena. Cada semana “El Gran Vivero” solicitará ciertas partes y es nuestra obligación cumplir en tiempo y forma para trabajos futuros.

# Desarrollo
Este proyecto fue desarrollado por 

 - Galeana Vidaurri Rodrigo
 - Garcia Arce Marco Antonio
 - Pérez Romero Natalia Abigail
 - Rosales Jaimes Victor
 - Rojas Jarillo Mauricio

Durante el proyecto desarrollamos

 1. Modelo Entidad-Relación
 2. Modelo Relacional
 3. Creación de base de datos
 4. Mantenimiento de llaves foráneas
 5. Poblamiento de Base de datos haciendo uso de [Mockaroo](https://www.mockaroo.com/)
 6. Creación de consultas
 7. Creación de triggers y disparadores

Todo lo anterior se hizo usando [PostgreSQL](https://www.postgresql.org/). Para más detalles se pueden consultar los reportes en la carpeta [Docs](https://github.com/vrosalesjaimes/Vivero-Base-De-Datos/tree/main/Docs).
