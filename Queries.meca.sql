-- Queries

--1. Recuperações Simples com SELECT Statement
Recupera o nome de todos os clientes e os modelos de veículos que eles possuem.
SELECT Nome AS Nome_Cliente, Modelo AS Modelo_Veiculo
FROM Cliente
JOIN Veiculo ON Cliente.Id_Cliente = Veiculo.Id_Cliente;

--2. Filtros com WHERE Statement
--Seleciona as ordens de serviço com valor acima de R$ 300,00.
SELECT Num_OS, Placa, Valor
FROM Ordem_Servico
WHERE Valor > 300;
--3. Expressões para Gerar Atributos Derivados
--Calcula o valor total dos serviços prestados em cada ordem de serviço, incluindo um imposto de 10%.
SELECT Num_OS, Valor, 
       Valor * 1.10 AS Valor_Com_Imposto
FROM Ordem_Servico;
--4. Ordenação dos Dados com ORDER BY
--Lista os mecânicos ordenados pela especialidade em ordem alfabética.
SELECT Nome, Especialidade
FROM Mecanico
ORDER BY Especialidade ASC;
--5. Condições de Filtros aos Grupos – HAVING Statement
--Recupera as equipes que fizeram mais de 2 manutenções.
SELECT Id_Equipe, COUNT(*) AS Total_Manutencoes
FROM H_Manutencao
GROUP BY Id_Equipe
HAVING COUNT(*) > 2;
--6. Junções entre Tabelas para Perspectiva mais Complexa
--Consulta que exibe detalhes de cada ordem de serviço, incluindo o nome do cliente, o modelo do veículo,
--o valor do serviço e o nome do mecânico responsável.

SELECT OS.Num_OS, C.Nome AS Nome_Cliente, V.Modelo AS Modelo_Veiculo, 
       OS.Valor AS Valor_Servico, M.Nome AS Nome_Mecanico
FROM Ordem_Servico AS OS
JOIN Veiculo AS V ON OS.Placa = V.Placa
JOIN Cliente AS C ON V.Id_Cliente = C.Id_Cliente
JOIN H_Manutencao AS HM ON OS.Placa = HM.Placa
JOIN Equipe AS E ON HM.Id_Equipe = E.Id_Equipe
JOIN Mecanico AS M ON M.Id_Mecanico = E.Id_Equipe;
--7. Consulta com Subquery e Junções
--Consulta que exibe o nome dos clientes que possuem veículos com ordens de serviço concluídas nos últimos 30 dias.
SELECT C.Nome AS Nome_Cliente, V.Modelo AS Modelo_Veiculo
FROM Cliente C
JOIN Veiculo V ON C.Id_Cliente = V.Id_Cliente
JOIN Ordem_Servico OS ON V.Placa = OS.Placa
WHERE OS.Status = 'Concluída' AND OS.Data_Conclusao >= CURRENT_DATE - INTERVAL '30 days';
--8. Consulta com Funções de Agregação
--Calcula a média dos valores das ordens de serviço para cada cliente.
SELECT C.Nome AS Nome_Cliente, AVG(OS.Valor) AS Media_Valor_Ordem_Servico
FROM Cliente C
JOIN Veiculo V ON C.Id_Cliente = V.Id_Cliente
JOIN Ordem_Servico OS ON V.Placa = OS.Placa
GROUP BY C.Nome;
--9. Consulta com Cláusula CASE para Categorização
--Exibe a lista de ordens de serviço com uma categorização baseada no valor do serviço.
SELECT Num_OS, Valor,
       CASE
           WHEN Valor < 200 THEN 'Baixo'
           WHEN Valor BETWEEN 200 AND 500 THEN 'Médio'
           ELSE 'Alto'
       END AS Categoria_Valor
FROM Ordem_Servico;