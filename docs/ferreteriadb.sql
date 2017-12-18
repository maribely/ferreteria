
CREATE TABLE Privilegio (
                id_privilegio INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                PRIMARY KEY (id_privilegio)
);


CREATE TABLE Usuario (
                id_usuario INT AUTO_INCREMENT NOT NULL,
                usuario VARCHAR(30) NOT NULL,
                contrasenia VARCHAR(50) NOT NULL,
                id_privilegio INT NOT NULL,
                PRIMARY KEY (id_usuario)
);


CREATE TABLE Proveedor (
                id_proveedor INT AUTO_INCREMENT NOT NULL,
                razon_social VARCHAR(100) NOT NULL,
                ruc VARCHAR(11) NOT NULL,
                direccion VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_proveedor)
);


CREATE TABLE Categoria (
                id_categoria INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                PRIMARY KEY (id_categoria)
);


CREATE TABLE Producto (
                id_producto INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(70) NOT NULL,
                precio_unitario DOUBLE NOT NULL,
                stock DOUBLE NOT NULL,
                descripcion VARCHAR(100) NOT NULL,
                id_proveedor INT NOT NULL,
                id_categoria INT NOT NULL,
                PRIMARY KEY (id_producto)
);


CREATE TABLE Cliente (
                id_cliente INT AUTO_INCREMENT NOT NULL,
                nombres VARCHAR(50) NOT NULL,
                apellidos VARCHAR(80) NOT NULL,
                dni VARCHAR(8) NOT NULL,
                sexo VARCHAR(1) NOT NULL,
                email VARCHAR(70) NOT NULL,
                ruc VARCHAR(11),
                telefono VARCHAR(13) NOT NULL,
                direccion VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_cliente)
);


CREATE TABLE Factura (
                id_factura INT AUTO_INCREMENT NOT NULL,
                fecha DATETIME NOT NULL,
                sub_total DOUBLE NOT NULL,
                igv DOUBLE NOT NULL,
                total DOUBLE NOT NULL,
                id_cliente INT NOT NULL,
                id_usuario INT NOT NULL,
                PRIMARY KEY (id_factura)
);


CREATE TABLE DetalleFactura (
                id INT AUTO_INCREMENT NOT NULL,
                cantidad DOUBLE NOT NULL,
                sub_total DOUBLE NOT NULL,
                id_factura INT NOT NULL,
                id_producto INT NOT NULL,
                PRIMARY KEY (id)
);


ALTER TABLE Usuario ADD CONSTRAINT privilegio_usuario_fk
FOREIGN KEY (id_privilegio)
REFERENCES Privilegio (id_privilegio)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Factura ADD CONSTRAINT usuario_factura_fk
FOREIGN KEY (id_usuario)
REFERENCES Usuario (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Producto ADD CONSTRAINT proveedor_producto_fk
FOREIGN KEY (id_proveedor)
REFERENCES Proveedor (id_proveedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Producto ADD CONSTRAINT categoria_producto_fk
FOREIGN KEY (id_categoria)
REFERENCES Categoria (id_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE DetalleFactura ADD CONSTRAINT producto_detallefactura_fk
FOREIGN KEY (id_producto)
REFERENCES Producto (id_producto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Factura ADD CONSTRAINT cliente_factura_fk
FOREIGN KEY (id_cliente)
REFERENCES Cliente (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE DetalleFactura ADD CONSTRAINT factura_detallefactura_fk
FOREIGN KEY (id_factura)
REFERENCES Factura (id_factura)
ON DELETE NO ACTION
ON UPDATE NO ACTION;