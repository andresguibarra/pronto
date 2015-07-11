DROP TABLE PRODUCTO
DROP TABLE CATEGORIA

CREATE TABLE CATEGORIA(
	ID int NOT NULL IDENTITY(1,1),
	Nombre varchar(50) NOT NULL,
	PRIMARY KEY(ID)
)

CREATE TABLE PRODUCTO(
	ID int NOT NULL IDENTITY(1,1),
	cod_barras Numeric(38) NOT NULL,
	Nombre varchar(100) NOT NULL,
	Categoria int NOT NULL,
	Precio_costo Numeric(12,2) NOT NULL,
	Precio_Venta Numeric(12,2) NOT NULL,
	Ganancia Numeric(12,2) NOT NULL,
	Stock int NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY (Categoria) REFERENCES Categoria(ID)
)