CREATE DATABASE Loja;
USE Loja;

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(255),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    data_adicao DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE DEFAULT CURRENT_DATE,
    status VARCHAR(50) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE ItensPedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

INSERT INTO Clientes (nome, email, telefone, endereco, cidade, estado) VALUES
('João Silva', 'joao@gmail.com', '9999-8888', 'Rua A, 123', 'São Paulo', 'SP'),
('Maria Souza', 'maria@gmail.com', '9888-7777', 'Rua B, 456', 'Rio de Janeiro', 'RJ'),
('Pedro Santos', 'pedro@gmail.com', '9777-6666', 'Rua C, 789', 'Belo Horizonte', 'MG');

INSERT INTO Produtos (nome, descricao, preco, estoque) VALUES
('Notebook', 'Notebook Dell i7', 3500.00, 10),
('Mouse', 'Mouse Óptico USB', 50.00, 50),
('Teclado', 'Teclado Mecânico Gamer', 250.00, 20);

INSERT INTO Pedidos (cliente_id, status, total) VALUES
(1, 'Pendente', 3550.00),
(2, 'Concluído', 250.00);

INSERT INTO ItensPedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(1, 2, 1, 50.00),
(2, 3, 1, 250.00);

CREATE VIEW DetalhesPedidos AS
SELECT 
    p.id AS PedidoID,
    c.nome AS Cliente,
    c.email AS Email,
    pr.nome AS Produto,
    ip.quantidade AS Quantidade,
    ip.preco_unitario AS PrecoUnitario,
    p.total AS TotalPedido,
    p.status AS StatusPedido
FROM 
    Pedidos p
JOIN 
    Clientes c ON p.cliente_id = c.id
JOIN 
    ItensPedido ip ON p.id = ip.pedido_id
JOIN 
    Produtos pr ON ip.produto_id = pr.id;

SELECT * FROM DetalhesPedidos;
