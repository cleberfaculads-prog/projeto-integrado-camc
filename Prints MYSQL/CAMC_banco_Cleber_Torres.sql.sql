-- Aluno:Cleber Luiz de Torres
-- Projeto Integrado - Análise e Desenvolvimento de Sistemas
-- Projeto Integrado - CAMC (Cadeia Alimentar do Mel e Chia)
-- Script do banco de dados (DDL + dados de teste) - MySQL 26.10
-- Baseado no arquivo "Modelo de BD em MySQL - Proj Integ"
-- =========================================================================

-- 1. Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS camc
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE camc;

-- Apaga as tabelas caso o script seja executado de novo (ordem inversa das chaves estrangeiras)
DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS posts_blog;
DROP TABLE IF EXISTS leads_newsletter;
DROP TABLE IF EXISTS produto;  -- tabela de teste criada anteriormente

-- =========================================================================
-- 2. CRIAÇÃO DAS TABELAS (Estrutura DDL)
-- =========================================================================

-- Tabela de Categorias de Produtos
CREATE TABLE categorias (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  slug VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Tabela de Produtos (peso/unidades e destaque da Home)
CREATE TABLE produtos (
  id_produto INT AUTO_INCREMENT PRIMARY KEY,
  id_categoria INT NOT NULL,
  nome VARCHAR(150) NOT NULL,
  descricao TEXT NULL,
  preco DECIMAL(10,2) NOT NULL,
  peso_volume VARCHAR(50) NOT NULL,
  imagem_url VARCHAR(255) NULL,
  destaque BOOLEAN DEFAULT FALSE,
  estoque INT DEFAULT 0,
  FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Tabela de Clientes
CREATE TABLE clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nome_completo VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  senha_hash VARCHAR(255) NOT NULL,
  telefone VARCHAR(20) NULL,
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabela de Pedidos
CREATE TABLE pedidos (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
  status ENUM('Pendente', 'Pago', 'Enviado', 'Cancelado') DEFAULT 'Pendente',
  valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Tabela Associativa (Muitos para Muitos) - Itens do Pedido
CREATE TABLE itens_pedido (
  id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT NOT NULL,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL CHECK (quantidade > 0),
  preco_unitario DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
  FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE RESTRICT,
  UNIQUE KEY uq_pedido_produto (id_pedido, id_produto)
) ENGINE=InnoDB;

-- Tabela para os Artigos do Blog
CREATE TABLE posts_blog (
  id_post INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  conteudo TEXT NOT NULL,
  imagem_capa_url VARCHAR(255) NULL,
  slug VARCHAR(200) NOT NULL UNIQUE,
  data_publicacao DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabela para captura de Leads (Newsletter do rodapé)
CREATE TABLE leads_newsletter (
  id_lead INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(150) NOT NULL UNIQUE,
  data_inscricao DATETIME DEFAULT CURRENT_TIMESTAMP,
  ativo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- =========================================================================
-- 3. INSERÇÃO DE DADOS DE TESTE
-- =========================================================================

INSERT INTO categorias (nome, slug) VALUES
('Mel Orgânico', 'mel-organico'),
('Sementes de Chia', 'sementes-de-chia'),
('Barras Energéticas', 'barras-energeticas');

INSERT INTO produtos (id_categoria, nome, descricao, preco, peso_volume, destaque, estoque) VALUES
(1, 'Mel Orgânico Puro CAMC', 'Mel orgânico puro produzido artesanalmente na nossa fazenda.', 45.00, '150g', TRUE, 50),
(1, 'Mel de Lavanda CAMC', 'Mel aromatizado com lavanda natural.', 48.50, '100g', TRUE, 35),
(3, 'Barra Energética Mel e Chia', 'Energia natural e saudável feita com mel e chia.', 18.00, '3 unidades', TRUE, 120),
(2, 'Sementes de Chia CAMC', 'Superalimento: sementes de chia ricas em nutrientes.', 22.00, '100g', TRUE, 80);

INSERT INTO posts_blog (titulo, conteudo, slug) VALUES
('Benefícios da Chia', 'Superalimento Chia traz diversos benefícios para a mesa saudável...', 'beneficios-da-chia'),
('Colheita de Mel', 'Produção natural direto das colmeias da nossa fazenda sustentável...', 'colheita-de-mel');

-- =========================================================================
-- 4. CONFERÊNCIA (mostra o resultado no final)
-- =========================================================================
SHOW TABLES;
SELECT p.id_produto, p.nome, c.nome AS categoria, p.preco, p.estoque
FROM produtos p
JOIN categorias c ON c.id_categoria = p.id_categoria;
SELECT titulo, slug FROM posts_blog;
