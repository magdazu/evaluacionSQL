CREATE SCHEMA evaluacion;

USE evaluacion;

CREATE TABLE Producto(
	producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(25),
    costoProducto DOUBLE
);

CREATE TABLE Proveedor(
	proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(25),
    contacto VARCHAR(25)
);

CREATE TABLE TipoProducto(
	tipoProducto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	categoria VARCHAR(25)
);

CREATE TABLE Venta(
	venta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cantidad INTEGER,
    costoTotal DOUBLE,
    fechaVenta DATE
);

CREATE TABLE ProductoProveedor(
	productoProveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    producto_id INTEGER,
    proveedor_id INTEGER
);

CREATE TABLE ProductoVenta(
	productoVenta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    producto_id INTEGER,
    venta_id INTEGER 
);

#creo una tabla relacional con la tabla Producto y la tabla Proveedor 
ALTER TABLE ProductoProveedor
ADD FOREIGN KEY (producto_id) REFERENCES Producto (producto_id);

ALTER TABLE ProductoProveedor
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id);

#creo una tabla relacional con la tabla Producto y tabla Venta para registrar las ventas de productos 
ALTER TABLE ProductoVenta
ADD FOREIGN KEY (producto_id) REFERENCES Producto (producto_id);

ALTER TABLE ProductoVenta
ADD FOREIGN KEY (venta_id) REFERENCES Venta (venta_id);

# solicito que la columna tipoProducto_id se agregue a la tabla Producto
ALTER TABLE Producto ADD tipoProducto_id INTEGER NOT NULL;

#solicito que la columna tipoProducto sea una foreign key para la tabla Producto
ALTER TABLE Producto
ADD FOREIGN KEY (tipoProducto_id) REFERENCES TipoProducto (tipoProducto_id);

#Cambio de nombre de columna por error de tipeo 
ALTER TABLE Venta RENAME COLUMN vanta_id TO venta_id;

#ingreso datos en tablas 
INSERT INTO Producto (nombre, costoProducto, tipoProducto_id)
VALUE ('Spaguetti', 800.0, 4);

INSERT INTO Producto (nombre, costoProducto, tipoProducto_id)
VALUE ('aceite maravilla', 2800.0, 1);

INSERT INTO Producto (nombre, costoProducto, tipoProducto_id)
VALUE ('sala de tomate', 700.0, 4);

INSERT INTO Producto (nombre, costoProducto, tipoProducto_id)
VALUE ('Galletas soda', 1000.0, 2);

INSERT INTO Producto (nombre, costoProducto, tipoProducto_id)
VALUE ('Sprite 1lt', 1800, 1);

INSERT INTO TipoProducto (categoria)
VALUE ("Bebestibles");

INSERT INTO TipoProducto (categoria)
VALUE ("Golosinas");

INSERT INTO TipoProducto (categoria)
VALUE ("conservas");

INSERT INTO TipoProducto (categoria)
VALUE ("pastas");

INSERT INTO Proveedor (nombre, contacto)
VALUE ('carozzi S.A.', 'carozzi@carozzi.com');

INSERT INTO Proveedor (nombre, contacto)
VALUE ('carozzi S.A.', 'carozzi@carozzi.com');

INSERT INTO Venta (cantidad, costoTotal, fechaVenta)
VALUE (7, 40000.0, "2023-03-3");

#Consulta de las tablas 

SELECT * FROM Producto;
 
SELECT * FROM Proveedor;

SELECT * FROM TipoProducto;

SELECT * FROM Venta; 

#solicito la union de la tabla Producto con la tabla TipoProduto
SELECT Producto.nombre, Producto.costoProducto, TipoProducto.categoria
FROM Producto JOIN TipoProducto ON Producto.tipoProducto_id = TipoProducto.tipoProducto_id
WHERE TipoProducto.tipoProducto_id = 2 
