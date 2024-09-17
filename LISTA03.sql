/*Lista de Exercícios Parte 03
1. Quantidade de Pedidos por país.*/

SELECT PaisDeDestino, count(NumeroDoPedido) as QtddPedidos
FROM fact_Pedidos
GROUP BY PaisDeDestino;

/*2. Total de frete da tabela pedidos por ano.*/

/*SELECT EXTRACT(YEAR FROM DataDoPedido) AS Ano, 
       SUM(Frete) AS TotalFreteAno
FROM fact_Pedidos
GROUP BY EXTRACT(YEAR FROM DataDoPedido);*/


/*
3. Total de frete e quantidade pedidos dos países Suíça e Suécia.*/

/*select SUM(frete) as TotalFrete
and count(numerodopedido) as TotalPedidos
FROM fact_Pedidos
WHERE pais IN ('Suíça', 'Suécia');*/