INSERT INTO privilegio (nombre) VALUES ('Administrador')
INSERT INTO privilegio (nombre) VALUES ('Gerente')
INSERT INTO privilegio (nombre) VALUES ('Usuario')
SELECT * FROM privilegio

INSERT INTO usuario (usuario, contrasenia, id_privilegio) VALUES ('admin', '12345',1)
SELECT * FROM usuario

SELECT * FROM cliente;
INSERT INTO cliente (nombres,apellidos,dni,sexo,email,ruc,telefono,direccion) VALUES ('Ragnar', 'Alfaro','45604646','M','ragnar@gmail.com','102324354','935032696','Haquira');
INSERT INTO cliente (nombres,apellidos,dni,sexo,email,ruc,telefono,direccion) VALUES ('Hikaru', 'Cheng lee','45604646','M','hikaru@gmail.com','104524354','935452696','Tokio');
SELECT  * FROM cliente WHERE  UPPER(nombres) LIKE UPPER('%ag%');
SELECT * FROM cliente WHERE id_cliente = 2;
UPDATE cliente SET nombres='', apellidos='',dni='', sexo='', email='', ruc='', telefono='',direccion='' WHERE id_cliente=1;
UPDATE cliente SET nombres='Matias Ragnar', apellidos='Alfaro Vilca' WHERE id_cliente=1;
DELETE FROM cliente WHERE id_cliente = 2;