/*LISTA DE EXERCÍCIOS PARTE 01*/

/*1. Listar o Código, Nome da Empresa, Nome do Contato, Pais e
Telefone da tabela Tbl_Fornecedores, banco de dados db_Loja, e
classificar em ordem crescente por Pais.*/

SELECT DISTINCT codigodofornecedor, NomeDaEmpresa, NomeDoContato, Pais, Telefone 
FROM dim_Fornecedores
ORDER BY Pais ASC;

/*2. Listar todos os clientes da tabela clientes cujo país não seja
“Alemanha” ou “ Espanha”.*/

SELECT *
FROM dim_clientes
WHERE pais <> 'Alemanha' AND pais <> 'Espanha';

/*3. Listar todos os pedidos da tabela pedidos cujo data do pedido
esteja entre 01/06/2017 e 30/06/2017: 
obs: não há registro de dados neste periodo, então eu escolhi outro periododim_Produtos*/

SELECT * 
FROM fact_Pedidos
WHERE DataDoPedido BETWEEN '2017-04-01' and '2017-04-30';

/*4. Listar todos os produtos da tabela produtos cujo preço esteja
entre R$ 20,00 e R$ 50,00.*/

SELECT *
FROM dim_Produtos
WHERE PrecoUnitario BETWEEN 20.00 and 50.00;

/*5. Listar todos os produtos da tabela, produtos cuja categoria seja
2, 4 ou 6.*/

SELECT *
FROM dim_Produtos
where CodigoDaCategoria in (2,4,6);

/*6. Listar todos os clientes da tabela clientes cujo nome do contato
inicie com as letras “B”, “F” ou “S”.
select*/

SELECT *
FROM dim_clientes
WHERE nomeDoContato like 'B%'
OR  nomeDoContato like 'F%'
OR  nomeDoContato like 'S%';

/*7. Listar todos os clientes da tabela clientes cujo nome do contato
inicie com as letras entre “M” e “R”.
*/

SELECT *
FROM dim_clientes
WHERE nomeDoContato >= 'M'
AND nomeDoContato < 'S';


/*8. Retornar os nomes e preços dos cinco primeiros produtos da tabela
de produtos.
*/

SELECT nomeDoProduto, PrecoUnitario
FROM dim_Produtos
limit 5;

/*9. Selecionar os Cargos da tabela de Funcionários, porém exibir
apenas os registros distintos sem repetições.*/

select DISTINCT Cargo
from dim_Funcionarios;








