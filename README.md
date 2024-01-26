# **Laboratório de Banco de Dados Oracle Modelado e Documentado**

## **Stack**
Oracle SQL Server, Data Modeler, Power BI, MS Word

## **Descrição do Sistema**
Uma loja de hardware e suplementos para informática deseja um sistema para o controle de suas vendas. A loja não possui um estoque grande de materiais, então é necessário um controle maior para saber a quantidade de cada material presente na loja. Seus fornecedores podem fornecer um ou mais materiais, os quais são fornecidos por um único fornecedor. Os fornecedores possuem nome, endereço, telefone fixo, telefone móvel e e-mail. Os clientes não são cadastrados, mas os detalhes das vendas devem ser armazenados no sistema. Cada venda pode possuir um ou mais produtos, é realizada em uma data/hora, contém um valor final e o cpf/cnpj do comprador e a identificação do funcionário responsável pela venda. Os materiais possuem nome, tipo e preço. Quando o fornecedor entrega os produtos para loja, é gerado um registro contendo a data de aquisição do material, e a quantidade adquirida de cada material. Os funcionários possuem matrícula, nome completo e data de contratação.

## **Sobre os Dados Armazenados**
Os dados são fictícios, criados manualmente e com revisões e ajustes para a consistência de dados.

## **Modelagem Lógica**
![Modelagem Lógica](https://github.com/caioypaulino/Lab-Banco-de-Dados/blob/main/Cen%C3%A1rio%2010/Modelo%20L%C3%B3gico.png)

## **Modelagem Relacional com Tabelas Temporais**
![Modelagem Relacional](https://github.com/caioypaulino/Lab-Banco-de-Dados/blob/main/Cen%C3%A1rio%2010/Modelo%20Relacional%2002.png)

## **Tabela de Auditoria**
![Tabela Auditoria](https://github.com/caioypaulino/Lab-Banco-de-Dados/blob/main/Cen%C3%A1rio%2010/Modelo%20Relacional%2003.png)

## **Tabela de Stage**
![Tabela Stage](https://github.com/caioypaulino/Lab-Banco-de-Dados/blob/main/Cen%C3%A1rio%2010/Modelo%20Relacional%2004.png)

## **Consultas Estratégicas**
Além de todo o trabalho de modelagem, população e administração da base de dados, foram feitos processos de análise com queries.

### **Exemplo:**

Quantidade vendida de cada material no último mês e representação em % equivalente ao estoque.

Query SQL: 
``` sql
SELECT mat_nome AS NOME_MATERIAL, SUM(per_quantidade_vendida) AS QUANTIDADE_VENDA, mat_quantidade AS ESTOQUE, to_char(((SUM(per_quantidade_vendida) * 100 )/ (mat_quantidade)),'99999.99') || '%' AS PORCENTAGEM
FROM pertencem
	INNER JOIN materiais ON materiais.mat_id = pertencem.materiais_mat_id
	INNER JOIN vendas ON vendas.vnd_id = pertencem.vendas_vnd_id
GROUP BY mat_nome, mat_quantidade
ORDER BY to_char(((SUM(per_quantidade_vendida) * 100 )/ (mat_quantidade)),'9999.99') || '%' ASC;
```

Resultado:

![Strategy Query 8](https://i.ibb.co/hC2gq6f/imagem-2024-01-26-121725222.png)

## **Power BI**
Por fim, foram realizadas algumas análises utilizando o Power BI como ferramenta de visualização.

![Power BI](https://github.com/caioypaulino/Lab-Banco-de-Dados/blob/main/Cen%C3%A1rio%2010/Power%20BI.png)
