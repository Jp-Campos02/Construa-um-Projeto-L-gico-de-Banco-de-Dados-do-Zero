-- Inserçoes de Tuplas
-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Nome, Endereco, Telefone) VALUES 
('Carlos Silva', 'Rua A, 123', '11987654321'),
('Ana Costa', 'Rua B, 456', '21987654321'),
('Marcos Santos', 'Rua C, 789', '31987654321'),
('Julia Souza', 'Rua D, 101', '41987654321'),
('Fernanda Lima', 'Rua E, 202', '51987654321');

-- Inserindo dados na tabela Veiculo
INSERT INTO Veiculo (Placa, Modelo, Ano, Id_Cliente) VALUES 
('ABC1234', 'Gol', 2018, 1),
('DEF5678', 'Civic', 2020, 2),
('GHI9012', 'Corolla', 2019, 3),
('JKL3456', 'Palio', 2017, 4),
('MNO7890', 'Focus', 2021, 5);

-- Inserindo dados na tabela Mecanico
INSERT INTO Mecanico (Nome, Endereco, Especialidade) VALUES 
('Pedro Almeida', 'Rua F, 303', 'Motor'),
('Lucas Oliveira', 'Rua G, 404', 'Suspensão'),
('Rafael Mendes', 'Rua H, 505', 'Freios'),
('Tiago Lima', 'Rua I, 606', 'Elétrica'),
('Gabriel Silva', 'Rua J, 707', 'Pneus');

-- Inserindo dados na tabela Equipe
INSERT INTO Equipe (Nome) VALUES 
('Equipe A'),
('Equipe B'),
('Equipe C'),
('Equipe D'),
('Equipe E');

-- Inserindo dados na tabela Ordem_Servico
INSERT INTO Ordem_Servico (Placa, Status, Data, Data_Conclusao, Valor) VALUES 
('ABC1234', 'Concluída', '2024-01-01', '2024-01-02', 300.00),
('DEF5678', 'Em andamento', '2024-02-01', NULL, 150.00),
('GHI9012', 'Concluída', '2024-03-01', '2024-03-03', 500.00),
('JKL3456', 'Cancelada', '2024-04-01', NULL, 0.00),
('MNO7890', 'Concluída', '2024-05-01', '2024-05-02', 250.00);

-- Inserindo dados na tabela Servico
INSERT INTO Servico (Descricao, Valor) VALUES 
('Troca de óleo', 50.00),
('Alinhamento', 80.00),
('Balanceamento', 60.00),
('Revisão geral', 300.00),
('Troca de pneus', 400.00);

-- Inserindo dados na tabela Peca
INSERT INTO Peca (Descricao, Valor) VALUES 
('Filtro de óleo', 20.00),
('Amortecedor', 150.00),
('Pneu', 200.00),
('Bateria', 300.00),
('Velas de ignição', 80.00);

-- Inserindo dados na tabela Pagamento
INSERT INTO Pagamento (Num_OS, Data, Valor, Metodo) VALUES 
(1, '2024-01-02', 300.00, 'Cartão de Crédito'),
(2, '2024-02-01', 150.00, 'Boleto'),
(3, '2024-03-03', 500.00, 'Dinheiro'),
(4, '2024-04-01', 0.00, 'Cancelado'),
(5, '2024-05-02', 250.00, 'Transferência');

-- Inserindo dados na tabela H_Manutencao
INSERT INTO H_Manutencao (Placa, Id_Equipe, Data, Descricao) VALUES 
('ABC1234', 1, '2024-01-02', 'Revisão completa'),
('DEF5678', 2, '2024-02-01', 'Troca de amortecedores'),
('GHI9012', 3, '2024-03-01', 'Substituição de bateria'),
('JKL3456', 4, '2024-04-01', 'Alinhamento e balanceamento'),
('MNO7890', 5, '2024-05-01', 'Troca de velas');

-- Inserindo dados na tabela Compo_Servico
INSERT INTO Compo_Servico (Num_OS, Id_Servico, Quantidade) VALUES 
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- Inserindo dados na tabela Compo_Peca
INSERT INTO Compo_Peca (Num_OS, Id_Peca, Quantidade) VALUES 
(1, 1, 2),
(2, 2, 4),
(3, 3, 1),
(4, 4, 1),
(5, 5, 4);
