DECLARE cursor_info_completa CURSOR READ_ONLY FOR
SELECT
    r.id_referencia,
    r.ano,
    l.localizacao,
    g.genero,
    n.nivel,
    ae.area_estudo
FROM
    tb_referencias r 
INNER JOIN tb_localizacoes l ON r.id_loc = l.id_loc
INNER JOIN tb_generos g ON r.id_genero = g.id_genero
INNER JOIN tb_niveis n ON r.id_nivel = n.id_nivel
INNER JOIN tb_area_estudos ae ON r.id_area_estudo = ae.id_area_estudo

OPEN cursor_info_completa;