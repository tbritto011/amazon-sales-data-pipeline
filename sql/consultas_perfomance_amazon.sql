#primeira consulta realizada

Select product_id, product_name,discounted_price, rating_count, SUM(discounted_price * rating_count) as faturamento_total
FROM `projeto-de-dados-da-amazon.Dados_Amazon.Tabela de Dados da Amazon`
GROUP BY 1, 2, 3, 4
ORDER BY faturamento_total DESC
LIMIT 10

#segunda consulta realizada 

Select product_name, ifnull(rating, 0) as rating, discount_percentage,
CASE
  WHEN discount_percentage >= 0 AND discount_percentage <= 20 THEN 'Baixo'
  WHEN discount_percentage >= 21 AND discount_percentage <= 50 THEN 'Medio'
  WHEN discount_percentage > 50 THEN 'Alto'
END AS discount_category
FROM `projeto-de-dados-da-amazon.Dados_Amazon.Tabela de Dados da Amazon`
GROUP BY product_name, rating, discount_percentage
ORDER BY rating DESC


#terceira coluna realizada 

Select  principal_category, AVG(rating_count) as rating_media, SUM(discounted_price * rating_count) as total_revenue
FROM `projeto-de-dados-da-amazon.Dados_Amazon.Tabela de Dados da Amazon`
GROUP BY principal_category
ORDER BY total_revenue DESC

