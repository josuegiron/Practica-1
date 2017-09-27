
/* Script del esquema de la base de datos */

create database practica1;
use practica1;

create table region(
	num_region INTEGER(10) PRIMARY KEY,
	nom_region CHAR(100),
	area FLOAT(10)
);

create table departamento(
	num_departamento INTEGER(10) PRIMARY KEY,
	nom_departamento CHAR(100),
	area FLOAT(10),
	num_region INTEGER(10),
	FOREIGN KEY(num_region) REFERENCES region(num_region)
);

create table municipio(
	num_municipio INTEGER(10) PRIMARY KEY,
	nom_municipio CHAR(100),
	num_departamento INTEGER(10),
	FOREIGN KEY(num_departamento) REFERENCES departamento(num_departamento)
);

create table usuario(
	num_usuario INTEGER(10) PRIMARY KEY,
	nombre CHAR(100),
	apellido CHAR(100),
	fecha_nac DATE,
	direccion VARCHAR(500),
	credito FLOAT(10),
	num_municipio INTEGER(10),
	FOREIGN KEY(num_municipio) REFERENCES municipio(num_municipio)
);                  

create table compra(
	num_compra INTEGER(10) PRIMARY KEY,
	num_usuario INTEGER(10),
	fecha_compra DATE,
	FOREIGN KEY(num_usuario) REFERENCES usuario(num_usuario)
);     

create table categoria(
	num_categoria INTEGER(10) PRIMARY KEY,
	nom_categoria CHAR(100),
	num_categoria_superior INTEGER(10),
	FOREIGN KEY(num_categoria_superior) REFERENCES categoria(num_categoria)
);

create table producto(
	codigo_producto INTEGER(10) PRIMARY KEY,
	nom_producto CHAR(100),
	precio FLOAT(10),
	descripcion VARCHAR(500),
	num_categoria INTEGER(10),
	FOREIGN KEY(num_categoria) REFERENCES categoria(num_categoria)
);

create table detalle_compra(
	num_detalle_compra INTEGER(10) PRIMARY KEY,
	num_compra INTEGER(10),
	codigo_producto INTEGER(10),
	cantidad INTEGER(10),
	FOREIGN KEY(num_compra) REFERENCES compra(num_compra),
	FOREIGN KEY(codigo_producto) REFERENCES producto(codigo_producto)
);

/* Script de sentencias DML para inserción de registros */

insert into region values(1, 'Centro', 250.6);
insert into region values(2, 'Norte', 150.6);
insert into region values(3, 'Sur', 220.6);
insert into region values(4, 'Occidente', 50.6);
insert into region values(5, 'Oriente', 200.6);

insert into departamento values(1, 'Chimaltenango', 25.6 , 1);
insert into departamento values(2, 'Guatemala', 25.6 , 1);
insert into departamento values(3, 'Peten', 25.6 , 2);
insert into departamento values(4, 'Alta Verapaz', 25.6 , 2);
insert into departamento values(5, 'Escuintla', 25.6 , 3);
insert into departamento values(6, 'Suchitepequez', 25.6 , 3);
insert into departamento values(7, 'Quetzaltenango', 25.6 , 4);
insert into departamento values(8, 'San Marcos', 25.6 , 4);
insert into departamento values(9, 'Zacapa', 25.6 , 5);

insert into municipio values(1, 'Chimaltenango', 1);
insert into municipio values(2, 'Guatemala', 2);
insert into municipio values(3, 'San Bebito', 3);
insert into municipio values(4, 'Coban', 4);
insert into municipio values(5, 'Escuintla', 5);
insert into municipio values(6, 'Patulul', 6);
insert into municipio values(7, 'Xela', 7);
insert into municipio values(8, 'Malacatan', 8);
insert into municipio values(9, 'Zacapa', 9);

insert into usuario values(1000, 'Josue', 'Giron', '09-12-1993', 'Colonia el Esfuerzo Zona 5', 100.90, 1);
insert into usuario values(2000, 'Juan', 'Gonzales', '02-11-1992','Avenida 2, calle rosas', 200, 2);
insert into usuario values(3000, 'Bebito', 'Escobar', '19-02-1990','Zona 4, calle primero de Julio', 30.4, 3);
insert into usuario values(4000, 'Mercedes', 'Fernandez', '29-11-1993','Zona 20, avenida 3', 50, 4);
insert into usuario values(5000, 'Maria', 'Salazar', '06-07-1999','Colonia El cedro', 49, 5);
insert into usuario values(6000, 'Pedro', 'Martinez', '08-12-1983','4 avenida, zona 3', 449, 6);
insert into usuario values(7000, 'Estuardo', 'Pascal', '09-09-1994','6 calle, zona 1', 439, 7);
insert into usuario values(8000, 'Mario', 'Dominguez', '04-07-1978','Canton 4', 149, 8);
insert into usuario values(9000, 'Marcos', 'Macgregor', '01-03-1950','5 avenida y cuarta calle, zona 19', 4449, 9);

insert into categoria values(1, 'Alimentos', 0);
insert into categoria values(2, 'Herramientas', 0);
insert into categoria values(3, 'Cocina', 0);
insert into categoria values(4, 'Perecederos', 1);
insert into categoria values(5, 'No Perecederos', 1);
insert into categoria values(6, 'Carpinteria', 2);
insert into categoria values(7, 'Jardineria', 2);
insert into categoria values(8, 'Electricas', 6);
insert into categoria values(9, 'Manuales', 6);

insert into producto values(1, 'Martillo', 20.8, 'Herramienta...', 9);
insert into producto values(2, 'Destornillador plano', 10, 'Herramienta...', 9);
insert into producto values(3, 'Destornillador Cruz', 10, 'Herramienta...', 9);
insert into producto values(4, 'Lija', 1.2, 'Herramienta...',9);
insert into producto values(5, 'Barreno', 500, 'Herramienta...',8);
insert into producto values(6, 'Sierra', 300, 'Herramienta...',8);
insert into producto values(7, 'Serrucho', 150, 'Herramienta...',9);
insert into producto values(8, 'Taladro', 700, 'Herramienta...',8);
insert into producto values(9, 'Tijera', 25, 'Herramienta...',7);

insert into compra values(1, 1000, '19-02-2017');
insert into compra values(2, 2000, '09-11-2017');
insert into compra values(3, 2000, '04-12-2017');
insert into compra values(4, 3000, '05-12-2017');
insert into compra values(5, 1000, '05-12-2017');
insert into compra values(6, 4000, '03-12-2017');
insert into compra values(7, 6000, '05-12-2017');
insert into compra values(8, 9000, '06-12-2017');
insert into compra values(9, 9000, '04-12-2017');

insert into detalle_compra values(1, 1, 1, 3);
insert into detalle_compra values(2, 1, 6, 2);
insert into detalle_compra values(3, 2, 8, 1);
insert into detalle_compra values(4, 3, 1, 2);
insert into detalle_compra values(5, 1, 3, 2);
insert into detalle_compra values(6, 4, 2, 2);
insert into detalle_compra values(7, 6, 4, 2);
insert into detalle_compra values(8, 9, 1, 2);
insert into detalle_compra values(9, 9, 5, 2);


