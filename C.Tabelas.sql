-- Criação das Tabelas
-- Criação da Tabela Cliente
CREATE TABLE Cliente (
    Id_Cliente SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(150),
    Telefone VARCHAR(15)
);

-- Criação da Tabela Veiculo
CREATE TABLE Veiculo (
    Placa VARCHAR(10) PRIMARY KEY,
    Modelo VARCHAR(50),
    Ano INT,
    Id_Cliente INT,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);

-- Criação da Tabela Mecanico
CREATE TABLE Mecanico (
    Id_Mecanico SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(150),
    Especialidade VARCHAR(100)
);

-- Criação da Tabela Equipe
CREATE TABLE Equipe (
    Id_Equipe SERIAL PRIMARY KEY,
    Nome VARCHAR(50)
);

-- Criação da Tabela Ordem_Servico
CREATE TABLE Ordem_Servico (
    Numero_OS SERIAL PRIMARY KEY,
    Placa VARCHAR(10),
    Status VARCHAR(50),
    Data DATE,
    Data_Conclusao DATE,
    Valor DECIMAL,
    FOREIGN KEY (Placa) REFERENCES Veiculo(Placa)
);

-- Criação da Tabela Compo_Servico para relacionamento entre Ordem_Servico e Serviço
CREATE TABLE Compo_Servico (
    Num_OS INT,
    Id_Servico INT,
    Quantidade INT,
    PRIMARY KEY (Num_OS, Id_Servico),
    FOREIGN KEY (Num_OS) REFERENCES Ordem_Servico(Numero_OS),
    FOREIGN KEY (Id_Servico) REFERENCES Servico(Id_Servico)
);

-- Criação da Tabela Compo_Peca para relacionamento entre Ordem_Servico e Peca
CREATE TABLE Compo_Peca (
    Num_OS INT,
    Id_Peca INT,
    Quantidade INT,
    PRIMARY KEY (Num_OS, Id_Peca),
    FOREIGN KEY (Num_OS) REFERENCES Ordem_Servico(Numero_OS),
    FOREIGN KEY (Id_Peca) REFERENCES Peca(Id_Peca)
);

-- Criação da Tabela Servico
CREATE TABLE Servico (
    Id_Servico SERIAL PRIMARY KEY,
    Descricao VARCHAR(150),
    Valor DECIMAL
);

-- Criação da Tabela Peca
CREATE TABLE Peca (
    Id_Peca SERIAL PRIMARY KEY,
    Descricao VARCHAR(150),
    Valor DECIMAL
);

-- Criação da Tabela Pagamento
CREATE TABLE Pagamento (
    Id_Pagamento SERIAL PRIMARY KEY,
    Num_OS INT,
    Data DATE,
    Valor DECIMAL,
    Metodo VARCHAR(50),
    FOREIGN KEY (Num_OS) REFERENCES Ordem_Servico(Numero_OS)
);

-- Criação da Tabela H_Manutencao para histórico de manutenção
CREATE TABLE H_Manutencao (
    Id_Manutencao SERIAL PRIMARY KEY,
    Placa VARCHAR(10),
    Id_Equipe INT,
    Data DATE,
    Descricao VARCHAR(150),
    FOREIGN KEY (Placa) REFERENCES Veiculo(Placa),
    FOREIGN KEY (Id_Equipe) REFERENCES Equipe(Id_Equipe)
);
