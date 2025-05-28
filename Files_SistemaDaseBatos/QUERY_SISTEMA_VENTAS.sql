--PASO 1: Crear la base de datos
CREATE DATABASE SistemaVentas;
GO

USE SistemaVentas;
GO

-- PASO 2: Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Telefono NVARCHAR(15),
    Direccion NVARCHAR(255)
);

-- Tabla de Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    ProveedorID INT
);

-- Tabla de Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Contacto NVARCHAR(100),
    Telefono NVARCHAR(15)
);

-- Tabla de Empleados
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Cargo NVARCHAR(50),
    Telefono NVARCHAR(15),
	Saldo DECIMAL(10,2) NOT NULL
);

-- Tabla de Pedidos
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT NOT NULL,
    EmpleadoID INT NOT NULL,
    FechaPedido DATE NOT NULL,
    Estado NVARCHAR(50) DEFAULT 'Pendiente',
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Tabla de Detalles del Pedido
CREATE TABLE DetallesPedido (
    DetalleID INT PRIMARY KEY IDENTITY(1,1),
    PedidoID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);


-- PASO 3: Verificar la creación de las tablas

SELECT * FROM [SistemaVentas].[dbo].[DetallesPedido]
SELECT * FROM  [SistemaVentas].[dbo].[Pedidos]
SELECT * FROM  [SistemaVentas].[dbo].[Clientes]
SELECT * FROM  [SistemaVentas].[dbo].[Empleados]
SELECT * FROM  [SistemaVentas].[dbo].[Productos]
SELECT * FROM  [SistemaVentas].[dbo].[Proveedores]