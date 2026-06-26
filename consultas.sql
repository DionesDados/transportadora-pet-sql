-- =====================================================
-- PROJETO: TRANSPORTADORA PET
-- ARQUIVO: consultas.sql
-- =====================================================

-- 1. LISTAR TODAS AS TABELAS
SELECT name 
FROM sqlite_master 
WHERE type='table';

-- 2. LISTAR TODOS OS MOTORISTAS
SELECT * FROM MOTORISTAS;

-- 3. LISTAR TODOS OS CLIENTES
SELECT * FROM CLIENTES;

-- 4. LISTAR TODOS OS VEÍCULOS
SELECT * FROM VEICULOS;

-- =====================================================
-- 5. INNER JOIN
-- Relaciona os motoristas com as notas fiscais emitidas.
-- =====================================================

SELECT
    M.nome_motorista,
    NF.numero_nota,
    NF.valor_nota
FROM NOTAS_FISCAIS NF
INNER JOIN MOTORISTAS M
ON NF.id_motorista = M.id_motorista;


-- 6. INNER JOIN ENTRE CLIENTES E ROTAS
SELECT
    C.nome_cliente,
    R.cidade_destino,
    NF.valor_nota
FROM NOTAS_FISCAIS NF
INNER JOIN CLIENTES C
ON NF.id_cliente = C.id_cliente
INNER JOIN ROTAS R
ON NF.id_rota = R.id_rota;

-- 7. LEFT JOIN
SELECT
    M.nome_motorista,
    T.dias_ida,
    T.dias_volta
FROM MOTORISTAS M
LEFT JOIN TEMPO_ENTREGA T
ON M.id_motorista = T.id_motorista;

-- 8. ORDER BY
SELECT *
FROM PRODUTOS
ORDER BY peso_kg DESC;

-- 9. GROUP BY
SELECT
    forma_pagamento,
    SUM(valor_parcela) AS total_recebido
FROM PAGAMENTOS_CLIENTES
GROUP BY forma_pagamento;

-- 10. HAVING
SELECT
    forma_pagamento,
    SUM(valor_parcela) AS total_recebido
FROM PAGAMENTOS_CLIENTES
GROUP BY forma_pagamento
HAVING SUM(valor_parcela) > 10000;

-- 11. COUNT
SELECT COUNT(*) AS quantidade_motoristas
FROM MOTORISTAS;

-- 12. AVG
SELECT AVG(valor_nota) AS media_notas
FROM NOTAS_FISCAIS;

-- 13. MAX
SELECT MAX(valor_nota) AS maior_nota
FROM NOTAS_FISCAIS;

-- 14. MIN
SELECT MIN(valor_nota) AS menor_nota
FROM NOTAS_FISCAIS;

-- 15. CONSULTAR UM MOTORISTA ESPECÍFICO

SELECT *
FROM MOTORISTAS
WHERE id_motorista = 1;


-- 16. BETWEEN CONSULTAR NOTAS FISCAIS ENTRE VALORES
SELECT *
FROM NOTAS_FISCAIS
WHERE valor_nota BETWEEN 15000 AND 30000;

-- 17. LIKE - CONSULTAR CLIENTES QUE CONTENHAM A PALAVRA "PET"
SELECT *
FROM CLIENTES
WHERE nome_cliente LIKE '%Pet%';

-- =====================================================
-- 18. UPDATE
-- Atualiza o telefone do motorista de código 1.
-- =====================================================

UPDATE MOTORISTAS
SET telefone = '11988887777'
WHERE id_motorista = 1;

-- =====================================================
-- 19. DELETE
-- Remove um pagamento específico.
-- =====================================================

DELETE FROM PAGAMENTOS_CLIENTES
WHERE id_pagamento = 3;

-- 20. VIEW
CREATE VIEW vw_notas_motoristas AS
SELECT
    M.nome_motorista,
    NF.numero_nota,
    NF.valor_nota
FROM NOTAS_FISCAIS NF
INNER JOIN MOTORISTAS M
ON NF.id_motorista = M.id_motorista;

SELECT * FROM vw_notas_motoristas;

-- 21. IN CONSULTA FILTRANDO VÁRIOS VALORES
SELECT *
FROM ROTAS
WHERE estado IN ('SP','RJ');

-- 22. DISTINCT REMOVE VALORES REPETIDOS

SELECT DISTINCT estado
FROM CLIENTES;

-- 23. INNER JOIN COMPLETO 

SELECT
    M.nome_motorista,
    C.nome_cliente,
    P.nome_produto,
    R.cidade_destino,
    NF.valor_nota
FROM NOTAS_FISCAIS NF
INNER JOIN MOTORISTAS M
ON NF.id_motorista = M.id_motorista
INNER JOIN CLIENTES C
ON NF.id_cliente = C.id_cliente
INNER JOIN PRODUTOS P
ON NF.id_produto = P.id_produto
INNER JOIN ROTAS R
ON NF.id_rota = R.id_rota
ORDER BY M.nome_motorista;


-- 24. SOMA DAS NOTAS 

SELECT
    SUM(valor_nota) AS valor_total_transportado
FROM NOTAS_FISCAIS;

-- 25. QUANTIDADE DE NOTAS POR MOTORISTA 

SELECT
    M.nome_motorista,
    COUNT(NF.id_nota) AS quantidade_notas
FROM MOTORISTAS M
INNER JOIN NOTAS_FISCAIS NF
ON M.id_motorista = NF.id_motorista
GROUP BY M.nome_motorista;
