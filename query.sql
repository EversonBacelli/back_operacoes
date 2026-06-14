use everson_my;

DROP table CATEGORIA;
CREATE TABLE CATEGORIA (
    id_categoria INT AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_categoria)
);

DROP TABLE PRODUTO;
CREATE TABLE PRODUTO (
    id_produto varchar(5),
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    id_categoria INT,
    PRIMARY KEY (id_produto),
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

DROP TABLE CLIENTE;
CREATE TABLE CLIENTE (
    id_cliente varchar(50),
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    status VARCHAR(20),
    limite_credito DECIMAL(10,2),
    PRIMARY KEY (id_cliente)
);

DROP TABLE PEDIDO;
CREATE TABLE PEDIDO (
    num_pedido INT AUTO_INCREMENT,
    data_elaboracao DATE NOT NULL,
    id_cliente varchar(50),
    PRIMARY KEY (num_pedido),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

Drop table ITEM_PEDIDO;
CREATE TABLE ITEM_PEDIDO (
    num_pedido INT,
    id_produto varchar(5),
    quantidade INT NOT NULL,
    PRIMARY KEY (num_pedido, id_produto),
    FOREIGN KEY (num_pedido) REFERENCES PEDIDO(num_pedido),
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
);


INSERT INTO CLIENTE (id_cliente, nome, endereco, telefone, status, limite_credito) VALUES 
('6a2c8e5508122023e78fe6f4', 'Carlos Eduardo Silva', 'Rua das Flores, 123 - São Paulo/SP', '(11) 98765-4321', 'Ouro', 5000.00),
('6a2c8e5508122023e78fe6f5', 'Ana Beatriz Rodrigues', 'Av. Paulista, 1500 - São Paulo/SP', '(11) 97654-3210', 'Prata', 3000.00),
('6a2c8e5508122023e78fe6f6', 'Marcos Vinícius Costa', 'Rua Bahia, 45 - Santos/SP', '(13) 96543-2109', 'Bronze', 1500.00),
('6a2c8e5508122023e78fe6f7', 'Juliana Mendes Almeida', 'Alameda Lorena, 890 - São Paulo/SP', '(11) 95432-1098', 'Latão', 500.00),
('6a2c8e5508122023e78fe6f8', 'Lucas Henrique Ferreira', 'Rua Amazonas, 321 - São Caetano/SP', '(11) 94321-0987', 'Ouro', 6500.00),
('6a2c8e5508122023e78fe6f9', 'Mariana Souza Santos', 'Av. Kennedy, 750 - São Bernardo/SP', '(11) 93210-9876', 'Bronze', 1200.00),
('6a2c8e5508122023e78fe6fa', 'Rodrigo Alves Pereira', 'Rua Piauí, 12 - Santo André/SP', '(11) 92109-8765', 'Prata', 2500.00),
('6a2c8e5508122023e78fe6fb', 'Camila Oliveira Lima', 'Av. Central, 100 - Campinas/SP', '(19) 91098-7654', 'Latão', 400.00),
('6a2c8e5508122023e78fe6fc', 'Gabriel Barbosa Ribeiro', 'Rua Minas Gerais, 55 - Osasco/SP', '(11) 90987-6543', 'Ouro', 5500.00),
('6a2c8e5508122023e78fe6fd', 'Amanda Costa Carvalho', 'Av. do Estado, 4500 - São Paulo/SP', '(11) 89876-5432', 'Prata', 3500.00);

-- produtos
INSERT INTO PRODUTO (id_produto, nome_produto, preco, id_categoria) VALUES 
('C1', 'Detergente Líquido Neutro 500ml', 3.50, 1),
('C2', 'Sabão em Pó Primavera 1kg', 14.90, 2),
('C3', 'Sabonete em Barra Algodão 90g', 2.25, 3),
('C4', 'Desinfetante Lavanda 2L', 9.80, 4),
('C5', 'Amaciante de Roupas Toque de Seda 1L', 12.40, 2),
('C6', 'Detergente em Pasta Multiuso 500g', 5.10, 1),
('C7', 'Lava Roupas Líquido Concentrado 1L', 18.90, 2),
('C8', 'Sabonete Líquido Glicerina 400ml', 8.75, 3),
('C9', 'Água Sanitária Proteção Total 1L', 4.20, 4),
('C10', 'Limpa Vidros Brilho Intenso 500ml', 7.30, 4);

-- categorias
INSERT INTO CATEGORIA (id_categoria, nome_categoria) VALUES 
(1, 'Detergente'),
(2, 'Sabão em Pó'),
(3, 'Sabonete'),
(4, 'Desinfetante');

-- pedidos
INSERT INTO PEDIDO (num_pedido, data_elaboracao, id_cliente) VALUES 
(1001, '2026-06-01', '6a2c8e5508122023e78fe6f4'), -- Cliente: Carlos Eduardo Silva
(1002, '2026-06-03', '6a2c8e5508122023e78fe6f5'), -- Cliente: Ana Beatriz Rodrigues
(1003, '2026-06-05', '6a2c8e5508122023e78fe6f6'), -- Cliente: Marcos Vinícius Costa
(1004, '2026-06-10', '6a2c8e5508122023e78fe6f7'), -- Cliente: Juliana Mendes Almeida
(1005, '2026-06-14', '6a2c8e5508122023e78fe6f8');

-- itens_pedidos
INSERT INTO ITEM_PEDIDO (num_pedido, id_produto, quantidade) VALUES 
(1001, 'C1', 5),  -- Pedido 1001 levando 5 unidades do produto C1
(1001, 'C3', 2),  -- Pedido 1001 levando 2 unidades do produto C3
(1002, 'C2', 1),  -- Pedido 1002 levando 1 unidade do produto C2
(1002, 'C10', 3), -- Pedido 1002 levando 3 unidades do produto C10
(1003, 'C5', 2),  -- Pedido 1003 levando 2 unidades do produto C5
(1003, 'C7', 1),  -- Pedido 1003 levando 1 unidade do produto C7
(1004, 'C4', 4),  -- Pedido 1004 levando 4 unidades do produto C4
(1004, 'C6', 2),  -- Pedido 1004 levando 2 unidades do produto C6
(1005, 'C8', 3),  -- Pedido 1005 levando 3 unidades do produto C8
(1005, 'C9', 6);  -- Pedido 1005 levando 6 unidades do produto C9

