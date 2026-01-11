-- ============================================
-- SCHEMA DO BANCO DE DADOS: assistencia_saude
-- Sistema de Assistência à Saúde
-- ============================================

-- Criar banco de dados (executar como superusuario)
-- CREATE DATABASE assistencia_saude;

-- Tabela Agencia
CREATE TABLE IF NOT EXISTS Agencia (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200)
);

-- Tabela Profissional
CREATE TABLE IF NOT EXISTS Profissional (
    id SERIAL PRIMARY KEY,
    agencia_id INTEGER NOT NULL REFERENCES Agencia(id),
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14),
    telefone VARCHAR(20),
    email VARCHAR(100),
    especialidade VARCHAR(50)
);

-- Tabela Familia
CREATE TABLE IF NOT EXISTS Familia (
    id SERIAL PRIMARY KEY,
    codigo_familiar VARCHAR(20),
    responsavel VARCHAR(100),
    situacao_vulnerabilidade VARCHAR(50)
);

-- Tabela Endereco
CREATE TABLE IF NOT EXISTS Endereco (
    id SERIAL PRIMARY KEY,
    familia_id INTEGER NOT NULL REFERENCES Familia(id),
    logradouro VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(10)
);

-- Tabela Pessoa
CREATE TABLE IF NOT EXISTS Pessoa (
    id SERIAL PRIMARY KEY,
    familia_id INTEGER NOT NULL REFERENCES Familia(id),
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14),
    data_nascimento DATE,
    sexo CHAR(1),
    gestante BOOLEAN DEFAULT FALSE,
    deficiencia VARCHAR(50),
    telefone VARCHAR(20)
);

-- Tabela UnidadeSaude
CREATE TABLE IF NOT EXISTS UnidadeSaude (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    endereco VARCHAR(200)
);

-- Tabela Medicamento
CREATE TABLE IF NOT EXISTS Medicamento (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    principio_ativo VARCHAR(100)
);

-- Tabela Consulta
CREATE TABLE IF NOT EXISTS Consulta (
    id SERIAL PRIMARY KEY,
    pessoa_id INTEGER NOT NULL REFERENCES Pessoa(id),
    profissional_id INTEGER NOT NULL REFERENCES Profissional(id),
    data_consulta DATE,
    hora_consulta TIME,
    tipo_consulta VARCHAR(50)
);

-- Tabela Atendimento
CREATE TABLE IF NOT EXISTS Atendimento (
    id SERIAL PRIMARY KEY,
    pessoa_id INTEGER NOT NULL REFERENCES Pessoa(id),
    profissional_id INTEGER NOT NULL REFERENCES Profissional(id),
    unidade_saude_id INTEGER REFERENCES UnidadeSaude(id),
    data_atendimento DATE,
    tipo_atendimento VARCHAR(50),
    descricao TEXT
);

-- Tabela Prescricao
CREATE TABLE IF NOT EXISTS Prescricao (
    id SERIAL PRIMARY KEY,
    pessoa_id INTEGER NOT NULL REFERENCES Pessoa(id),
    profissional_id INTEGER NOT NULL REFERENCES Profissional(id),
    medicamento_id INTEGER NOT NULL REFERENCES Medicamento(id),
    data_prescricao DATE,
    dosagem VARCHAR(50),
    frequencia VARCHAR(50),
    instrucoes TEXT
);

-- Tabela Diagnostico
CREATE TABLE IF NOT EXISTS Diagnostico (
    id SERIAL PRIMARY KEY,
    pessoa_id INTEGER NOT NULL REFERENCES Pessoa(id),
    descricao TEXT,
    data_diagnostico DATE
);

-- Tabela Prontuario
CREATE TABLE IF NOT EXISTS Prontuario (
    id SERIAL PRIMARY KEY,
    pessoa_id INTEGER NOT NULL REFERENCES Pessoa(id),
    profissional_id INTEGER NOT NULL REFERENCES Profissional(id),
    data_registro DATE,
    historico TEXT,
    observacoes TEXT
);

-- Tabela Procedimento
CREATE TABLE IF NOT EXISTS Procedimento (
    id SERIAL PRIMARY KEY,
    atendimento_id INTEGER NOT NULL REFERENCES Atendimento(id),
    descricao TEXT
);
