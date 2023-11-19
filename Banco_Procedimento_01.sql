-- Script para criação de tabelas no SQL Server 


-- Tabela de Usuários 

CREATE TABLE Usuarios ( 

    idUsuario INT PRIMARY KEY IDENTITY, 

    nome VARCHAR(50) NOT NULL, 

    userName VARCHAR(20) UNIQUE NOT NULL, 

    senha VARCHAR(100) NOT NULL 

); 

  

-- Tabela de Produtos 

CREATE TABLE Produtos ( 

    idProduto INT PRIMARY KEY IDENTITY, 

    nome VARCHAR(255) NOT NULL, 

    quantidade INT NOT NULL CHECK (quantidade >= 0), 

    precoVenda DECIMAL(10, 2) NOT NULL CHECK (precoVenda >= 0) 

); 

  

-- Tabela de Pessoas 

CREATE TABLE Pessoa ( 

    idPessoa INT PRIMARY KEY IDENTITY, 

    nome VARCHAR(255) NOT NULL, 

    logradouro VARCHAR(255) NOT NULL, 

    cidade VARCHAR(255) NOT NULL, 

    estado CHAR(2) NOT NULL CHECK (LEN(estado) = 2), 

    telefone VARCHAR(15), 

    email VARCHAR(255) 

); 

  

-- Tabela Pessoa Física 

CREATE TABLE PessoaFisica ( 

    Pessoa_idPessoa INT PRIMARY KEY, 

    CPF CHAR(11) UNIQUE NOT NULL, 

    FOREIGN KEY (Pessoa_idPessoa) REFERENCES Pessoa (idPessoa) 

); 

  

-- Tabela Pessoa Jurídica 

CREATE TABLE PessoaJuridica ( 

    Pessoa_idPessoa INT PRIMARY KEY, 

    CNPJ VARCHAR(14) UNIQUE NOT NULL, 

    FOREIGN KEY (Pessoa_idPessoa) REFERENCES Pessoa (idPessoa) 

); 

  

-- Tabela de Movimentos 

CREATE TABLE Movimento ( 

    idMovimento INT PRIMARY KEY IDENTITY, 

    Usuarios_idUsuario INT NOT NULL, 

    Pessoa_idPessoa INT NOT NULL, 

    Produtos_idProduto INT NOT NULL, 

    quantidade INT NOT NULL CHECK (quantidade > 0), 

    tipo CHAR(1) NOT NULL CHECK (tipo = 'E' OR tipo = 'S'), 

    valorUnitario DECIMAL(10, 2) NOT NULL CHECK (valorUnitario >= 0), 

    FOREIGN KEY (Usuarios_idUsuario) REFERENCES Usuarios (idUsuario), 

    FOREIGN KEY (Pessoa_idPessoa) REFERENCES Pessoa (idPessoa), 

    FOREIGN KEY (Produtos_idProduto) REFERENCES Produtos (idProduto) 

); 

 
