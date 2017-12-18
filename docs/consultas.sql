INSERT INTO privilegio (nombre) VALUES ('Administrador')
INSERT INTO privilegio (nombre) VALUES ('Gerente')
INSERT INTO privilegio (nombre) VALUES ('Usuario')
SELECT * FROM privilegio

INSERT INTO usuario (usuario, contrasenia, id_privilegio) VALUES ('admin', '12345',1)
SELECT * FROM usuario
