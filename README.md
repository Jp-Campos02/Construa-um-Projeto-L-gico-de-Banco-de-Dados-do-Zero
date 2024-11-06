##Sistema de Gerenciamento de Oficina Mecânica

Este projeto é um banco de dados relacional para o gerenciamento de uma oficina mecânica. O sistema armazena informações sobre clientes, veículos, ordens de serviço, mecânicos, equipes, pagamentos e o histórico de manutenção dos veículos. O modelo busca organizar o fluxo de trabalho da oficina, desde o registro dos clientes e veículos até o controle de serviços realizados, peças utilizadas e pagamento dos serviços.

Estrutura do Banco de Dados
O banco de dados foi desenvolvido com o PostgreSQL e está estruturado da seguinte forma:

Principais Tabelas
Cliente: Armazena informações sobre os clientes, incluindo nome, endereço e telefone.
Veiculo: Contém os dados dos veículos dos clientes, como placa, modelo e ano de fabricação. Esta tabela possui uma chave estrangeira que referencia o cliente dono do veículo.
Mecanico: Guarda informações sobre os mecânicos, incluindo nome, endereço e especialidade.
Equipe: Define as equipes de manutenção, com cada equipe podendo ser composta por múltiplos mecânicos.
Ordem_Servico: Representa as ordens de serviço emitidas para os veículos, incluindo o status, a data de início e de conclusão, e o valor do serviço.
Peca: Armazena as peças que podem ser utilizadas nos serviços, com descrição e valor unitário.
Servico: Define os tipos de serviço oferecidos pela oficina, com uma breve descrição e o valor.
Tabelas de Refinamento
Além das tabelas principais, o sistema possui tabelas de refinamento para controle adicional de informações, com destaque para:

1. Pagamento
A tabela de pagamento foi criada para registrar os detalhes financeiros associados a cada ordem de serviço. A estrutura da tabela inclui os seguintes campos:

Id_Pagamento: Identificador único do pagamento (chave primária).
Num_OS: Referência à ordem de serviço associada (chave estrangeira).
Data: Data em que o pagamento foi realizado.
Valor: Valor pago pela ordem de serviço.
Metodo: Método de pagamento (ex: cartão, dinheiro, transferência bancária).
Essa tabela permite à oficina manter um histórico de pagamentos, facilitando o controle financeiro e permitindo a emissão de relatórios de faturamento.

2. H_Manutencao (Histórico de Manutenção)
O histórico de manutenção é essencial para rastrear todos os serviços e revisões realizadas nos veículos ao longo do tempo. A tabela H_Manutencao inclui as seguintes colunas:

Id_Manutencao: Identificador único do registro de manutenção (chave primária).
Num_OS: Referência à ordem de serviço associada (chave estrangeira).
Placa: Placa do veículo (referencia a tabela de veículos).
Data: Data da manutenção.
Id_Equipe: Identificador da equipe responsável pela manutenção (chave estrangeira).
Descricao: Breve descrição do serviço realizado.
Com o histórico de manutenção, a oficina pode monitorar todos os serviços executados em cada veículo, facilitando a consulta de revisões anteriores e ajudando na tomada de decisões para serviços futuros.
