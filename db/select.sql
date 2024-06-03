-- ROW_NUMBER() - Retorna um número sequencial para cada linha de um conjunto de resultados.
SELECT ROW_NUMBER() OVER (ORDER BY r.id_referencia) AS row_num,
       r.id_referencia,
       r.ano,
       l.localizacao,
       g.genero,
       n.nivel,
       ae.area_estudo
FROM tb_referencias r
INNER JOIN tb_localizacoes l ON r.id_loc = l.id_loc
INNER JOIN tb_generos g ON r.id_genero = g.id_genero
INNER JOIN tb_niveis n ON r.id_nivel = n.id_nivel
INNER JOIN tb_area_estudos ae ON r.id_area_estudo = ae.id_area_estudo;
GO;

-- RANK() - Retorna um número de classificação para cada linha de um conjunto de resultados.
SELECT RANK() OVER (ORDER BY r.id_referencia) AS rank,
       r.id_referencia,
       r.ano,
       l.localizacao,
       g.genero,
       n.nivel,
       ae.area_estudo
FROM tb_referencias r
INNER JOIN tb_localizacoes l ON r.id_loc = l.id_loc
INNER JOIN tb_generos g ON r.id_genero = g.id_genero
INNER JOIN tb_niveis n ON r.id_nivel = n.id_nivel
INNER JOIN tb_area_estudos ae ON r.id_area_estudo = ae.id_area_estudo;
GO;

-- DENSE_RANK() - Retorna um número de classificação para cada linha de um conjunto de resultados, sem lacunas.
SELECT DENSE_RANK() OVER (ORDER BY r.id_referencia) AS dense_rank,
       r.id_referencia,
       r.ano,
       l.localizacao,
       g.genero,
       n.nivel,
       ae.area_estudo
FROM tb_referencias r 
INNER JOIN tb_localizacoes l ON r.id_loc = l.id_loc
INNER JOIN tb_generos g ON r.id_genero = g.id_genero
INNER JOIN tb_niveis n ON r.id_nivel = n.id_nivel
INNER JOIN tb_area_estudos ae ON r.id_area_estudo = ae.id_area_estudo;
GO;

-- PARTITION BY - Divide o conjunto de resultados em partições para as quais a função ROW_NUMBER() é aplicada.
SELECT ROW_NUMBER() OVER (PARTITION BY r.id_genero ORDER BY r.id_referencia) AS row_num,
       r.id_referencia,
       r.ano,
       l.localizacao,
       g.genero,
       n.nivel,
       ae.area_estudo
FROM tb_referencias r
INNER JOIN tb_localizacoes l ON r.id_loc = l.id_loc
INNER JOIN tb_generos g ON r.id_genero = g.id_genero
INNER JOIN tb_niveis n ON r.id_nivel = n.id_nivel
INNER JOIN tb_area_estudos ae ON r.id_area_estudo = ae.id_area_estudo;
GO;

