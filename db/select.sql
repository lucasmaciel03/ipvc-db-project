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

SELECT tb_referencias, tb_localizacoes, tb_generos, tb_niveis, tb_area_estudos, ROW_NUMBER() OVER (PARTITION BY r.id_loc ORDER BY r.id_referencia) AS row_num,
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

