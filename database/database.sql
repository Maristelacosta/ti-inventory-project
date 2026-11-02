CREATE DATABASE inventario_ti;

USE inventario_ti;

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    cargo VARCHAR(100),
    departamento VARCHAR(100),
    telefone VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE setores (
    id_setor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    responsavel VARCHAR(100)
);

CREATE TABLE ativos (
    id_ativo INT PRIMARY KEY AUTO_INCREMENT,
    patrimonio VARCHAR(50) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    fabricante VARCHAR(100),
    modelo VARCHAR(100),
    numero_serie VARCHAR(100),
    status VARCHAR(30) DEFAULT 'Disponivel',
    data_aquisicao DATE,
    valor DECIMAL(10,2),
    id_setor INT,

    CONSTRAINT fk_ativo_setor
    FOREIGN KEY (id_setor)
    REFERENCES setores(id_setor)
);

CREATE TABLE movimentacoes (
    id_movimentacao INT PRIMARY KEY AUTO_INCREMENT,
    id_ativo INT NOT NULL,
    id_usuario INT NOT NULL,
    origem VARCHAR(100),
    destino VARCHAR(100),
    data_movimentacao DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_mov_ativo
    FOREIGN KEY (id_ativo)
    REFERENCES ativos(id_ativo),

    CONSTRAINT fk_mov_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios(id_usuario)
);

CREATE TABLE manutencoes (
    id_manutencao INT PRIMARY KEY AUTO_INCREMENT,
    id_ativo INT NOT NULL,
    tipo VARCHAR(50),
    descricao TEXT,
    custo DECIMAL(10,2),
    data_manutencao DATE NOT NULL,

    CONSTRAINT fk_manutencao_ativo
    FOREIGN KEY (id_ativo)
    REFERENCES ativos(id_ativo)
);

CREATE TABLE chamados (
    id_chamado INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_ativo INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    status VARCHAR(30) DEFAULT 'Aberto',
    data_abertura DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_chamado_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios(id_usuario),

    CONSTRAINT fk_chamado_ativo
    FOREIGN KEY (id_ativo)
    REFERENCES ativos(id_ativo)
);

CREATE TABLE licencas (
    id_licenca INT
