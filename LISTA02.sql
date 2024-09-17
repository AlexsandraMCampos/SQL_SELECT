/*Lista de Exercícios Parte 02
1. Criar uma lista com os nomes completos dos funcionários em letras
maiúsculas.*/

SELECT UPPER(Nome) AS NomeMaiusculo
FROM dim_Funcionarios;

/*2. A quantidade de pedidos emitidos na tabela Pedidos.*/

SELECT COUNT(DISTINCT numerodopedido)
from fact_Pedidos;

/*
3. A quantidade de países cadastrados na tabela Pedidos sem
repetição.*/

SELECT COUNT(DISTINCT PaisDeDestino) AS QuantidadeDePaises
FROM fact_Pedidos;

/*
4. A soma dos valores de frete de todos os pedidos emitidos para o
país Brasil.*/

SELECT SUM(Frete) 
from fact_Pedidos
where PaisDeDestino like 'Brasil';

/*
5. Quantidade de pedidos emitidos entre as datas de 01-09-2015 a
30-09-2016.*/

SELECT SUM(numerodopedido)
FROM fact_Pedidos
WHERE DataDoPedido BETWEEN '2015-09-01' and '2016-09-30';

/*
6. Quantidade de clientes da tabela clientes cujo país seja
Argentina.*/

SELECT COUNT(codigocliente) as QuantidadeDeClientes
From dim_clientes
where pais = 'Argentina';