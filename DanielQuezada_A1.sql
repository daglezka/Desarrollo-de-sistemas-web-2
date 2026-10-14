--Los siguientes Query son para crear las tablas con la estructura solicitada

CREATE TABLE Marcas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion NVARCHAR(200) NOT NULL
);

CREATE TABLE Categorias (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion NVARCHAR(200) NOT NULL
);

CREATE TABLE Productos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion NVARCHAR(MAX) NOT NULL,
    Precio DECIMAL(18,2) NOT NULL,
    Cantidad INT NOT NULL,
    IdCategoria INT NOT NULL,
    IdMarca INT NOT NULL,
    CONSTRAINT FK_Productos_Categorias FOREIGN KEY (IdCategoria) REFERENCES Categorias(Id),
    CONSTRAINT FK_Productos_Marcas FOREIGN KEY (IdMarca) REFERENCES Marcas(Id)
);


CREATE TABLE Carrito (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FolioVenta INT NOT NULL,
    TotalCompra DECIMAL(18,2) NOT NULL,
    Estatus INT NOT NULL,
    Fecha DATE NOT NULL
);

CREATE TABLE CarritoDetalle (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdCarrito INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    Subtotal DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_CarritoDetalle_Carrito FOREIGN KEY (IdCarrito) REFERENCES Carrito(Id),
    CONSTRAINT FK_CarritoDetalle_Productos FOREIGN KEY (IdProducto) REFERENCES Productos(Id)
);

--Prueba de base de datos

INSERT INTO Categorias (Descripcion) VALUES
('Electrónica'),
('Ropa'),
('Hogar'),
('Juguetes'),
('Deportes'),
('Salud'),
('Automotriz'),
('Libros'),
('Alimentos'),
('Muebles');

INSERT INTO Marcas (Descripcion) VALUES
('Sony'),
('Nike'),
('Samsung'),
('Lego'),
('Adidas'),
('Apple'),
('Chevrolet'),
('Penguin Books'),
('Nestlé'),
('IKEA');

INSERT INTO Productos (Descripcion, Precio, Cantidad, IdCategoria, IdMarca) VALUES
('Televisor 55 pulgadas', 12999.99, 15, 1, 1),
('Tenis deportivos', 1499.50, 30, 2, 2),
('Refrigerador 18 pies', 17999.00, 10, 3, 3),
('Set de bloques Lego', 799.99, 50, 4, 4),
('Balón de fútbol', 599.00, 25, 5, 5),
('iPhone 15', 22999.99, 8, 1, 6),
('Aceite para motor', 399.99, 20, 7, 7),
('Libro "El Principito"', 249.00, 40, 8, 8),
('Caja de chocolates', 199.50, 100, 9, 9),
('Escritorio de oficina', 3499.99, 12, 10, 10);