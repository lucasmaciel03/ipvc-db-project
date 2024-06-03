-- Cria o utilizador userAPI
CREATE USER userAPI FOR LOGIN userAPI;
Go;
-- View with joins que retorna as pessoas da póvoa de varzim de género feminino com licenciatura em Medicina entre 2020 e 2024
CREATE VIEW vw_povoa_varzim_feminino_medicina AS
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
INNER JOIN tb_area_estudos ON r.id_area_estudo = ae.id_area_estudo
WHERE l.localizacao = 'Póvoa de Varzim'
AND g.genero = 'F'
AND n.nivel = 'Licenciatura'
AND ae.area_estudo = 'Medicina'
AND r.ano BETWEEN 2020 AND 2024;
GO;

-- Comando para utilizar a view
SELECT * FROM vw_povoa_varzim_feminino_medicina;

-- Concede permissão de SELECT na primeira view para o utilizador userAPI
GRANT SELECT ON vw_povoa_varzim_feminino_medicina TO userAPI;
GO;



-- View with union que retorna o numero total de referencias por localização para os dois géneros, para referencias feitas entre 2000 e 2012.
CREATE VIEW vw_referencias_por_localizacao_genero AS
SELECT
    l.localizacao,
    'M' as genero,
    COUNT(r.id_referencia) as num_referencias
FROM    
    tb_referencias r  
    INNER JOIN tb_localizacoes l ON r.id_loc = l.id_loc
    INNER JOIN tb_generos g ON r.id_genero = g.id_genero
    WHERE g.genero = 'M'
    AND r.ano BETWEEN 2000 AND 2012
    GROUP BY l.localizacao
UNION
SELECT
    l.localizacao,
    'F' as genero,
    COUNT(r.id_referencia) as num_referencias
FROM
    tb_referencias r     
    INNER JOIN tb_localizacoes l ON r.id_loc = l.id_loc
    INNER JOIN tb_generos g ON r.id_genero = g.id_genero
    WHERE g.genero = 'F'
    AND r.ano BETWEEN 2000 AND 2012
    GROUP BY l.localizacao;
GO;
--Concede permissão de SELECT na segunda view para o utilizador userAPI
GRANT SELECT ON vw_referencias_por_localizacao_genero TO userAPI;




