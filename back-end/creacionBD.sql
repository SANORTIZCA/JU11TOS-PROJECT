CREATE TABLE tipo_empleado (
  tipo_empleado serial PRIMARY KEY,
  descripcion varchar(50) NOT NULL
);

INSERT INTO tipo_empleado (descripcion) VALUES ('Administrador');
INSERT INTO tipo_empleado (descripcion) VALUES ('Gerente');
INSERT INTO tipo_empleado (descripcion) VALUES ('AsistentePuntoVenta');

CREATE TABLE empleado (
  id_empleado serial PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  apellido varchar(50) NOT NULL,
  cedula varchar(50) NOT NULL,
  fecha_nacimiento date NOT NULL,
  direccion varchar(50),
  correo_electronico varchar(255) not NULL,
  telefono varchar(20) NOT NULL,
  contraseña varchar(255) NOT NULL,
  tipo_empleado integer REFERENCES tipo_empleado (tipo_empleado)
);

INSERT INTO empleado (nombre, apellido, cedula, fecha_nacimiento, direccion, correo_electronico, telefono, contraseña, tipo_empleado) 
VALUES ('Andres Felipe', 'Ortega', '1002678595', '1999-01-01', 'Cra 24 # 12-50', 'andresFe@gmail.com','3216549877', '123456hola', 1);
INSERT INTO empleado (nombre, apellido, cedula, fecha_nacimiento, direccion, correo_electronico, telefono, contraseña, tipo_empleado) 
VALUES ('Santiago', 'Ortiz', '1234567890', '2000-05-05', 'Cra 25 # 12-50', 'santiagoOr@gmail.com','3185269899', 'admin1', 2);
INSERT INTO empleado (nombre, apellido, cedula, fecha_nacimiento, direccion, correo_electronico, telefono, contraseña, tipo_empleado) 
VALUES ('Camilo', 'Garcia', '3216549877', '2001-09-09', 'Cra 26 # 12-50', 'camiloGa@gmail.com','3169874569', 'admin2', 2);
INSERT INTO empleado (nombre, apellido, cedula, fecha_nacimiento, direccion, correo_electronico, telefono, contraseña, tipo_empleado) 
VALUES ('David', 'Ramirez', '9876543211', '1998-10-10', 'Cra 27 # 12-50', 'davidRa@gmail.com','3123123122', 'siabueno', 3);
INSERT INTO empleado (nombre, apellido, cedula, fecha_nacimiento, direccion, correo_electronico, telefono, contraseña, tipo_empleado) 
VALUES ('Daniel', 'Castro', '2581473699', '1995-12-12', 'Cra 28 # 12-50', 'danielCa@gmail.com' ,'3113113111', 'tecuidas', 3);

CREATE TABLE evento (
  id_evento serial PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  fecha date NOT NULL,
  hora time NOT NULL,
  descripcion varchar(100) NOT NULL
);

INSERT INTO Evento (nombre, fecha, hora, descripcion)
VALUES ('OnceCaldas vs Pereira', '2023-08-10', '15:00:00', 'Partido');
INSERT INTO Evento (nombre, fecha, hora, descripcion)
VALUES ('OnceCaldas vs Medellin', '2023-09-11', '16:00:00', 'Partido');
INSERT INTO Evento (nombre, fecha, hora, descripcion)
VALUES ('OnceCaldas vs Millonarios', '2023-10-13', '17:00:00', 'Partido');

CREATE TABLE empleado_evento (
  id_empleado_evento serial PRIMARY KEY,
  id_empleado integer NOT NULL REFERENCES empleado (id_empleado) CHECK (id_empleado IN (2, 3)),
  id_evento integer NOT NULL REFERENCES evento (id_evento),
  descripcion varchar(50) NOT NULL
);

INSERT INTO empleado_evento (id_empleado, id_evento, descripcion)
VALUES (2, 1, 'Modificado');
INSERT INTO empleado_evento (id_empleado, id_evento, descripcion)
VALUES (3, 2, 'No modificado');
INSERT INTO empleado_evento (id_empleado, id_evento, descripcion)
VALUES (2, 3, 'Modificado');
INSERT INTO empleado_evento (id_empleado, id_evento, descripcion)
VALUES (3, 3, 'No modificado');

CREATE TABLE tipo_localidad (
  tipo_localidad serial PRIMARY KEY,
  descripcion varchar(20) NOT NULL
);

INSERT INTO tipo_localidad (descripcion) VALUES ('Norte');
INSERT INTO tipo_localidad (descripcion) VALUES ('Sur');
INSERT INTO tipo_localidad (descripcion) VALUES ('Occidental');
INSERT INTO tipo_localidad (descripcion) VALUES ('Oriental');

CREATE TABLE abono (
  id_abono serial PRIMARY KEY,
  temporada varchar(25) NOT NULL,
  fecha_vencimiento date NOT NULL,
  asiento varchar(50) NOT NULL,
  precio float NOT NULL,
  tipo_localidad integer NOT NULL REFERENCES tipo_localidad (tipo_localidad)
);

INSERT INTO abono (temporada, fecha_vencimiento, asiento, precio, tipo_localidad)
VALUES ('Temporada 2023-2S', '2024-01-01', 'Fila 1 Asiento 1', 1000, 1);
INSERT INTO abono (temporada, fecha_vencimiento, asiento, precio, tipo_localidad)
VALUES ('Temporada 2023-2S', '2024-01-02', 'Fila 2 Asiento 2', 2000, 2);
INSERT INTO abono (temporada, fecha_vencimiento, asiento, precio, tipo_localidad)
VALUES ('Temporada 2023-2S', '2024-01-03', 'Fila 3 Asiento 3', 3000, 3);
INSERT INTO abono (temporada, fecha_vencimiento, asiento, precio, tipo_localidad)
VALUES ('Temporada 2023-2S', '2024-01-04', 'Fila 4 Asiento 4', 4000, 4);
INSERT INTO abono (temporada, fecha_vencimiento, asiento, precio, tipo_localidad)
VALUES ('Temporada 2023-2S', '2024-01-05', 'Fila 5 Asiento 5', 5000, 1);

CREATE TABLE evento_abono (
  id_evento_abono serial PRIMARY KEY,
  id_evento integer NOT NULL REFERENCES evento (id_evento),
  id_abono integer NOT NULL REFERENCES abono (id_abono),
  descripcion varchar(25) NOT NULL
);

INSERT INTO evento_abono (id_evento, id_abono, descripcion)
VALUES (1, 1, 'Si');
INSERT INTO evento_abono (id_evento, id_abono, descripcion)
VALUES (1, 2, 'No');
INSERT INTO evento_abono (id_evento, id_abono, descripcion)
VALUES (2, 3, 'Si');
INSERT INTO evento_abono (id_evento, id_abono, descripcion)
VALUES (3, 1, 'No');

CREATE TABLE empleado_abono (
  empleado_abono serial PRIMARY KEY,
  id_empleado integer NOT NULL REFERENCES empleado (id_empleado),
  id_abono integer NOT NULL REFERENCES abono (id_abono),
  descripcion varchar(25) NOT NULL
);

INSERT INTO empleado_abono (id_empleado, id_abono, descripcion)
VALUES (2, 1, 'Modifica');
INSERT INTO empleado_abono (id_empleado, id_abono, descripcion)
VALUES (1, 1, 'Revisa');
INSERT INTO empleado_abono (id_empleado, id_abono, descripcion)
VALUES (3, 3, 'Asiste/Ayuda');
INSERT INTO empleado_abono (id_empleado, id_abono, descripcion)
VALUES (2, 1, 'Administra');

CREATE TABLE tipo_pago (
  tipo_pago serial PRIMARY KEY,
  descripcion varchar(20) NOT NULL
);

INSERT INTO tipo_pago (descripcion) VALUES ('Tarjeta');
INSERT INTO tipo_pago (descripcion) VALUES ('Efectivo');
INSERT INTO tipo_pago (descripcion) VALUES ('Pago Virtual');

CREATE TABLE recibo_pago (
  id_recibo_pago serial PRIMARY KEY,
  id_abono integer NOT NULL REFERENCES abono (id_abono),
  tipo_pago integer NOT NULL REFERENCES tipo_pago (tipo_pago),
  fecha_pago date NOT NULL,
  descripcion varchar(25) NOT NULL
);

INSERT INTO recibo_pago (id_abono, tipo_pago, fecha_pago, descripcion)
VALUES (1, 1, '2023-01-01', 'Pago de abono');
INSERT INTO recibo_pago (id_abono, tipo_pago, fecha_pago, descripcion)
VALUES (2, 2, '2023-02-02', 'Pago de abono');
INSERT INTO recibo_pago (id_abono, tipo_pago, fecha_pago, descripcion)
VALUES (3, 3, '2023-02-02', 'Pago de abono');

CREATE TABLE tipo_usuario (
  tipo_usuario serial PRIMARY KEY,
  descripcion varchar(20) NOT NULL
);

INSERT INTO tipo_usuario (descripcion) VALUES ('Normal');
INSERT INTO tipo_usuario (descripcion) VALUES ('Estudiante');
INSERT INTO tipo_usuario (descripcion) VALUES ('Hincha Fiel');
INSERT INTO tipo_usuario (descripcion) VALUES ('Adulto Mayor');

CREATE TABLE usuario (
  id_usuario serial PRIMARY KEY,
  id_abono integer NOT NULL REFERENCES abono (id_abono),
  tipo_usuario integer NOT NULL REFERENCES tipo_usuario (tipo_usuario),
  nombre varchar(50) NOT NULL,
  apellido varchar(50) NOT NULL,
  cedula varchar(50) NOT NULL,
  fecha_nacimiento date NOT NULL,
  direccion varchar(50) NOT NULL,
  correo_electronico varchar(255) NOT NULL,
  telefono varchar(30) NOT NULL,
  contraseña varchar(255) NOT NULL,
  descuento numeric NOT NULL,
  institucion_educativa varchar(50)
);

INSERT INTO usuario (id_abono, tipo_usuario, nombre, apellido, cedula, fecha_nacimiento , direccion , correo_electronico , telefono, contraseña, descuento) 
VALUES (5, 1, 'Camilo', 'Ramirez', '3216549897', '2001-09-09','Cra 38 # 12-50', 'camiloGa@gmail.com', '3169874569', 'yo', 1);
INSERT INTO usuario (id_abono, tipo_usuario, nombre, apellido, cedula, fecha_nacimiento , direccion , correo_electronico , telefono, contraseña, descuento, institucion_educativa) 
VALUES (3, 2, 'David', 'Aristizabal', '8876543211', '1998-10-10','Cra 29 # 12-50', 'davidGa@gmail.com', '3172123122', 'tu', 10, 'Instituo Técnologico');
INSERT INTO usuario (id_abono, tipo_usuario, nombre, apellido, cedula, fecha_nacimiento , direccion , correo_electronico , telefono, contraseña, descuento, institucion_educativa) 
VALUES (2, 3, 'Felipe', 'Hernandez', '2281473699', '1995-12-12','Cra 23 # 12-50', 'felipeGe@gmail.com', '3193113111', 'el', 15, 'Universidad Luisa Amigo');
INSERT INTO usuario (id_abono, tipo_usuario, nombre, apellido, cedula, fecha_nacimiento , direccion , correo_electronico , telefono, contraseña, descuento) 
VALUES (1, 4, 'Sofia', 'Agudelo', '2581563699', '1950-12-12','Cra 31 # 12-50', 'sofiaGo@gmail.com', '3183113111', 'nosotros2', 50);
