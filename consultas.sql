-- =====================================================
-- PROJETO: TRANSPORTADORA PET
-- ARQUIVO: consultas.sql
-- =====================================================

-- 1. LISTAR TODOS OS MOTORISTAS
SELECT * FROM MOTORISTAS;

-- 2. LISTAR TODOS OS CLIENTES
SELECT * FROM CLIENTES;

-- 3. LISTAR TODOS OS VEÍCULOS
SELECT * FROM VEICULOS;

-- 4. INNER JOIN
SELECT
    M.nome_motorista,
    NF.numero_nota,
    NF.valor_nota
FROM NOTAS_FISCAIS NF
INNER JOIN MOTORISTAS M
ON NF.id_motorista = M.id_motorista;

-- 5. INNER JOIN ENTRE CLIENTES E ROTAS
SELECT
    C.nome_cliente,
    R.cidade_destino,
    NF.valor_nota
FROM NOTAS_FISCAIS NF
INNER JOIN CLIENTES C
ON NF.id_cliente = C.id_cliente
INNER JOIN ROTAS R
ON NF.id_rota = R.id_rota;

-- 6. LEFT JOIN
SELECT
    M.nome_motorista,
    T.dias_ida,
    T.dias_volta
FROM MOTORISTAS M
LEFT JOIN TEMPO_ENTREGA T
ON M.id_motorista = T.id_motorista;

-- 7. ORDER BY
SELECT *
FROM PRODUTOS
ORDER BY peso_kg DESC;

-- 8. GROUP BY
SELECT
    forma_pagamento,
    SUM(valor_parcela) AS total_recebido
FROM PAGAMENTOS_CLIENTES
GROUP BY forma_pagamento;

-- 9. HAVING
SELECT
    forma_pagamento,
    SUM(valor_parcela) AS total_recebido
FROM PAGAMENTOS_CLIENTES
GROUP BY forma_pagamento
HAVING SUM(valor_parcela) > 10000;

-- 10. COUNT
SELECT COUNT(*) AS quantidade_motoristas
FROM MOTORISTAS;

-- 11. AVG
SELECT AVG(valor_nota) AS media_notas
FROM NOTAS_FISCAIS;

-- 12. MAX
SELECT MAX(valor_nota) AS maior_nota
FROM NOTAS_FISCAIS;

-- 13. MIN
SELECT MIN(valor_nota) AS menor_nota
FROM NOTAS_FISCAIS;

-- 14. BETWEEN
SELECT *
FROM NOTAS_FISCAIS
WHERE valor_nota BETWEEN 15000 AND 30000;

-- 15. LIKE
SELECT *
FROM CLIENTES
WHERE nome_cliente LIKE '%Pet%';

-- 16. UPDATE
UPDATE MOTORISTAS
SET telefone = '11988887777'
WHERE id_motorista = 1;

-- 17. DELETE
DELETE FROM PAGAMENTOS_CLIENTES
WHERE id_pagamento = 3;

-- 18. VIEW
CREATE VIEW vw_notas_motoristas AS
SELECT
    M.nome_motorista,
    NF.numero_nota,
    NF.valor_nota
FROM NOTAS_FISCAIS NF
INNER JOIN MOTORISTAS M
ON NF.id_motorista = M.id_motorista;

SELECT * FROM vw_notas_motoristas;
