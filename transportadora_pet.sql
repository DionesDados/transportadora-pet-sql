CREATE TABLE MOTORISTAS (
   id_motorista INT PRIMARY KEY,
   nome_motorista VARCHAR(100) NOT NULL,
   telefone VARCHAR(20) NOT NULL,
   email VARCHAR(100) NOT NULL,
   endereco VARCHAR(150) NOT NULL
);

CREATE TABLE ROTAS (
   id_rota INT PRIMARY KEY,
   cidade_destino VARCHAR(100),
   estado VARCHAR(2),
   regiao VARCHAR(50)
);

CREATE TABLE VEICULOS (
   id_veiculo INT PRIMARY KEY,
   placa VARCHAR(10),
   marca VARCHAR(50),
   modelo VARCHAR(50),
   ano INT
);

CREATE TABLE CLIENTES (
   id_cliente INT PRIMARY KEY,
   nome_cliente VARCHAR(100),
   cidade VARCHAR(100),
   estado VARCHAR(2)
);

CREATE TABLE PRODUTOS (
   id_produto INT PRIMARY KEY,
   nome_produto VARCHAR(100),
   categoria VARCHAR(50),
   peso_kg DECIMAL(10,2)
);

CREATE TABLE NOTAS_FISCAIS (
   id_nota INT PRIMARY KEY,
   numero_nota VARCHAR(50),
   valor_nota DECIMAL(10,2),
   id_motorista INT,
   id_rota INT,
   id_cliente INT,
   id_produto INT,
   FOREIGN KEY (id_motorista) REFERENCES MOTORISTAS(id_motorista),
   FOREIGN KEY (id_rota) REFERENCES ROTAS(id_rota),
   FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente),
   FOREIGN KEY (id_produto) REFERENCES PRODUTOS(id_produto)
);

CREATE TABLE CUSTOS_VIAGEM (
   id_custo INT PRIMARY KEY,
   valor_combustivel DECIMAL(10,2),
   valor_pedagio DECIMAL(10,2),
   valor_alimentacao DECIMAL(10,2),
   id_motorista INT,
   id_veiculo INT,
   FOREIGN KEY (id_motorista) REFERENCES MOTORISTAS(id_motorista),
   FOREIGN KEY (id_veiculo) REFERENCES VEICULOS(id_veiculo)
);

CREATE TABLE TEMPO_ENTREGA (
   id_tempo INT PRIMARY KEY,
   dias_ida INT,
   dias_volta INT,
   id_motorista INT,
   FOREIGN KEY (id_motorista) REFERENCES MOTORISTAS(id_motorista)
);

CREATE TABLE MANUTENCOES_VEICULO (
   id_manutencao INT PRIMARY KEY,
   data_manutencao DATE,
   tipo_manutencao VARCHAR(100),
   custo_manutencao DECIMAL(10,2),
   id_veiculo INT,
   FOREIGN KEY (id_veiculo) REFERENCES VEICULOS(id_veiculo)
);

CREATE TABLE PAGAMENTOS_CLIENTES (
   id_pagamento INT PRIMARY KEY,
   forma_pagamento VARCHAR(50),
   prazo_dias INT,
   valor_parcela DECIMAL(10,2),
   numero_parcela INT,
   id_nota INT,
   FOREIGN KEY (id_nota) REFERENCES NOTAS_FISCAIS(id_nota)
);

INSERT INTO MOTORISTAS VALUES
(1,'Carlos Silva','11999998888','carlos.silva@gmail.com','Rua Pedro Ribeiro Santana - Canal do Pino - Tatuapé - SP'),
(2,'Marcos Oliveira','11977776666','marcos.oliveira@gmail.com','Rua Pedro Ribeiro Santana - Campo Limpo - SP'),
(3,'Carmem Santana','11935882074','carmem.santana@gmail.com','Rua Pedro Ribeiro Santana - Vila Leopoldina - SP'),
(4,'Lucia Camargo','11905334496','lucia.camargo@gmail.com','Rua Pedro Ribeiro Santana - Jardim Ângela - SP');

INSERT INTO ROTAS VALUES
(1,'Manaus','AM','NORTE'),
(2,'Belém','PA','NORTE'),
(3,'São Paulo','SP','SUDESTE'),
(4,'Rio de Janeiro','RJ','SUDESTE');

INSERT INTO VEICULOS VALUES
(1,'ABC1D23','Volvo','FH 540',2022),
(2,'XYZ9K87','Scania','R 450',2021),
(3,'DEF5M44','Mercedes-Benz','Actros',2023);

INSERT INTO CLIENTES VALUES
(1,'Pet Shop Amigo Fiel','Manaus','AM'),
(2,'Distribuidora Quatro Patas','São Paulo','SP'),
(3,'Mundo Pet Ltda','Belém','PA');

INSERT INTO PRODUTOS VALUES
(1,'Ração Premium Cães Adultos','Alimentação',15.00),
(2,'Areia Sanitária Gatos','Higiene',4.00),
(3,'Brinquedo Mordedor de Borracha','Acessórios',0.30);

INSERT INTO NOTAS_FISCAIS VALUES
(1,'NF-1001',25000.00,1,1,1,1),
(2,'NF-1002',15000.00,2,3,2,2),
(3,'NF-1003',32000.00,3,2,3,1);

INSERT INTO CUSTOS_VIAGEM VALUES
(1,4500.00,350.00,600.00,1,1),
(2,1200.00,450.00,300.00,2,2),
(3,5100.00,200.00,700.00,3,3);

INSERT INTO TEMPO_ENTREGA VALUES
(1,5,4,1),
(2,1,1,2),
(3,6,5,3);

INSERT INTO MANUTENCOES_VEICULO VALUES
(1,'2026-05-10','Troca de Óleo e Filtros',1200.00,1),
(2,'2026-06-01','Revisão dos Freios',2500.00,2);

INSERT INTO PAGAMENTOS_CLIENTES VALUES
(1,'Boleto Bancário',30,25000.00,1,1),
(2,'Cartão de Crédito',0,7500.00,1,2),
(3,'Cartão de Crédito',30,7500.00,2,2);
