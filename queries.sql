-- Criaç-- Criação das tabelas
-- Criação das tabelas
CREATE TABLE clientes ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL
);  

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL, 
    preco DECIMAL(10, 2) NOT NULL 
);  

CREATE TABLE pedidos ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    cliente_id INT,
    produto_id INT, 
    quantidade INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
);  

CREATE TABLE fornecedores ( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL, 
    telefone VARCHAR(20) NOT NULL 
);  

CREATE TABLE funcionarios ( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL, 
    cargo VARCHAR(50) NOT NULL 
);  

-- Inserção de dados
-- Adicione registros ao banco de dados
INSERT INTO clientes (nome, email)
VALUES ('Ana Costa', 'ana.costa@example.com'); 

INSERT INTO produtos (nome, preco)
VALUES ('Cadeira Gamer', 800.00); 

-- Para garantir que você insira um pedido corretamente, você precisa garantir que os IDs dos clientes e produtos existam
-- Neste exemplo, supomos que os IDs são 1. Verifique os IDs gerados com os SELECTs subsequentes.
INSERT INTO pedidos (cliente_id, produto_id, quantidade)
VALUES (1, 1, 2);   

INSERT INTO fornecedores (nome, telefone)
VALUES ('Fornecedor X', '1234-5678'); 

INSERT INTO funcionarios (nome, cargo)
VALUES ('João Almeida', 'Analista');  

-- Verifique as inserções
SELECT * FROM clientes WHERE email = 'ana.costa@example.com'; 
SELECT * FROM produtos WHERE nome = 'Cadeira Gamer'; 
SELECT * FROM pedidos WHERE cliente_id = 1 AND produto_id = 1; 
SELECT * FROM fornecedores WHERE nome = 'Fornecedor X'; 
SELECT * FROM funcionarios WHERE nome = 'João Almeida';  

-- Atualizações
-- Atualize registros existentes
UPDATE clientes
SET email = 'ana.novo@example.com'
WHERE id = 1; -- Utilize o ID para garantir que o cliente correto seja atualizado

UPDATE produtos
SET preco = 850.00
WHERE id = 1; -- Utilize o ID para garantir que o produto correto seja atualizado

UPDATE pedidos
SET quantidade = 3
WHERE id = 1; -- Utilize o ID para garantir que o pedido correto seja atualizado

UPDATE fornecedores
SET telefone = '8765-4321'
WHERE nome = 'Fornecedor X'; 

UPDATE funcionarios
SET cargo = 'Coordenador'
WHERE nome = 'João Almeida';  

-- Verifique as atualizações
SELECT * FROM clientes WHERE id = 1; 
SELECT * FROM produtos WHERE id = 1; 
SELECT * FROM pedidos WHERE id = 1;  
SELECT * FROM fornecedores WHERE nome = 'Fornecedor X'; 
SELECT * FROM funcionarios WHERE nome = 'João Almeida';  

-- Exclusões
-- Antes de excluir registros, remova dependências (pedidos relacionados ao cliente ou produto)
DELETE FROM pedidos WHERE cliente_id = 1;
DELETE FROM pedidos WHERE produto_id = 1;

-- Exclua registros
DELETE FROM clientes WHERE id = 1;
DELETE FROM produtos WHERE id = 1;
DELETE FROM fornecedores WHERE nome = 'Fornecedor X'; 
DELETE FROM funcionarios WHERE nome = 'João Almeida'; 

-- Verifique as exclusões
SELECT * FROM clientes WHERE id = 1; 
SELECT * FROM produtos WHERE id = 1; 
SELECT * FROM pedidos WHERE id = 1;  
SELECT * FROM fornecedores WHERE nome = 'Fornecedor X'; 
SELECT * FROM funcionarios WHERE nome = 'João Almeida';
