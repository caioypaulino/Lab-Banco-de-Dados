-- CONSULTAS ESTRATÉGICAS
	-- Material mais vendido no mês/ano --
SELECT mat_nome AS NOME_MATERIAL, SUM(per_quantidade_vendida) AS QUANTIDADE_TOTAL
	FROM pertencem 
	INNER JOIN materiais ON materiais.mat_id = pertencem.materiais_mat_id
	INNER JOIN vendas ON vendas.vnd_id = pertencem.vendas_vnd_id
WHERE vendas.vnd_data_hora BETWEEN (add_months (SYSDATE, -1)) AND (SYSDATE)
GROUP BY mat_nome
HAVING SUM(per_quantidade_vendida) = 
(
	SELECT MAX(SUM(per_quantidade_vendida))
		FROM pertencem
		INNER JOIN materiais ON materiais.mat_id = pertencem.materiais_mat_id
		INNER JOIN vendas ON vendas.vnd_id = pertencem.vendas_vnd_id
	WHERE vendas.vnd_data_hora BETWEEN (add_months (SYSDATE, -1)) AND (SYSDATE)
	GROUP BY mat_nome
);

	-- Cliente que mais comprou no mês/ano --
SELECT vnd_cpf_cnpj AS CLIENTE, SUM(vnd_valor) AS VALOR_TOTAL
	FROM vendas
WHERE vendas.vnd_data_hora BETWEEN (add_months (SYSDATE, -1)) AND (SYSDATE)
GROUP BY vnd_cpf_cnpj
HAVING SUM(vnd_valor) =
(
    SELECT MAX(SUM(vnd_valor))
        FROM vendas
    WHERE vendas.vnd_data_hora BETWEEN (add_months (SYSDATE, -1)) AND (SYSDATE)
    GROUP BY vnd_cpf_cnpj
);

	-- Funcionário com maior valor de venda no mês/ano --
SELECT fun_primeiro_nome || ' ' || fun_nome_meio || ' ' || fun_sobrenome AS NOME_FUNCIONARIO, SUM(vnd_valor) AS VALOR_TOTAL
	FROM vendas 
	INNER JOIN funcionarios ON funcionarios.fun_id = vendas.funcionarios_fun_id
WHERE vendas.vnd_data_hora BETWEEN (add_months (SYSDATE, -1)) AND (SYSDATE)
GROUP BY fun_primeiro_nome, fun_nome_meio, fun_sobrenome
HAVING SUM(vnd_valor) = 
(
    SELECT MAX(SUM(vnd_valor))
        FROM vendas
        INNER JOIN funcionarios ON funcionarios.fun_id = vendas.funcionarios_fun_id
    WHERE vendas.vnd_data_hora BETWEEN (add_months (SYSDATE, -1)) AND (SYSDATE)
    GROUP BY fun_primeiro_nome, fun_nome_meio, fun_sobrenome
);

	-- Tipo de Material mais vendido no mês/ano --
SELECT tip_nome AS TIPO_MATERIAL, SUM(per_quantidade_vendida) AS QUANTIDADE_TOTAL
	FROM pertencem
		INNER JOIN materiais ON materiais.mat_id = pertencem.materiais_mat_id
		INNER JOIN tipos ON tipos.tip_id = materiais.tipos_tip_id
		INNER JOIN vendas ON vendas.vnd_id = pertencem.vendas_vnd_id
	WHERE vendas.vnd_data_hora BETWEEN (add_months (SYSDATE, -1)) AND (SYSDATE)
GROUP BY tip_nome
HAVING SUM(per_quantidade_vendida) =
(
    SELECT MAX(SUM(per_quantidade_vendida))
        FROM pertencem
            INNER JOIN materiais ON materiais.mat_id = pertencem.materiais_mat_id
            INNER JOIN tipos ON tipos.tip_id = materiais.tipos_tip_id
            INNER JOIN vendas ON vendas.vnd_id = pertencem.vendas_vnd_id
        WHERE vendas.vnd_data_hora BETWEEN (add_months (SYSDATE, -1)) AND (SYSDATE)
    GROUP BY tip_nome
);

	-- Tipo de Cliente que mais comprou no mês/ano --
SELECT decode(length(vnd_cpf_cnpj), 11, 'CPF', 'CNPJ') AS TIPO_CLIENTE, SUM(vnd_valor) AS VALOR_TOTAL
	FROM vendas
WHERE vendas.vnd_data_hora BETWEEN (add_months (SYSDATE, -1)) AND (SYSDATE)
GROUP BY decode(length(vnd_cpf_cnpj), 11, 'CPF', 'CNPJ')
HAVING SUM(vnd_valor) = 
(
    SELECT MAX(SUM(vnd_valor))
        FROM vendas
    WHERE vendas.vnd_data_hora BETWEEN (add_months (SYSDATE, -1)) AND (SYSDATE)
    GROUP BY decode(length(vnd_cpf_cnpj), 11, 'CPF', 'CNPJ')
);

	-- Valor em estoque de cada material --
SELECT mat_id AS ID, mat_nome AS NOME_MATERIAL, mat_quantidade AS QUANTIDADE_ESTOQUE, SUM(mat_preco) AS VALOR_ESTOQUE                            
	FROM materiais 
    INNER JOIN registros ON registros.materiais_mat_id = materiais.mat_id
    INNER JOIN fornecedores ON fornecedores.for_id = registros.fornecedores_for_id
GROUP BY mat_id, mat_nome, mat_quantidade
ORDER BY SUM(mat_preco) DESC;

	-- Valor médio das vendas no mês/ano --
SELECT round(AVG(vnd_valor),2) AS VALOR_VENDAS
	FROM vendas
WHERE vendas.vnd_data_hora BETWEEN (add_months (SYSDATE, -1)) AND (SYSDATE);

	-- Quanto foi vendido de cada material no último mês e representação em % equivalente ao estoque.
SELECT mat_nome AS NOME_MATERIAL, SUM(per_quantidade_vendida) AS QUANTIDADE_VENDA, mat_quantidade AS ESTOQUE, to_char(((SUM(per_quantidade_vendida) * 100 )/ (mat_quantidade)),'99999.99') || '%' AS PORCENTAGEM
	FROM pertencem
		INNER JOIN materiais ON materiais.mat_id = pertencem.materiais_mat_id
	    INNER JOIN vendas ON vendas.vnd_id = pertencem.vendas_vnd_id
GROUP BY mat_nome, mat_quantidade
ORDER BY to_char(((SUM(per_quantidade_vendida) * 100 )/ (mat_quantidade)),'9999.99') || '%' ASC;





