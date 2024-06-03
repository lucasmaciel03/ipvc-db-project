INSERT INTO tb_area_estudos(area_estudo) VALUES ('TEST');

UPDATE tb_area_estudos SET area_estudo = 'Agricultura, Silvicultura e Pescas' WHERE id_area_estudo = 1;

DELETE FROM tb_area_estudos WHERE id_area_estudo = 39;

INSERT INTO tb_generos(genero) VALUES ('M');

UPDATE tb_generos SET genero = 'F' WHERE id_genero = 5;

DELETE FROM tb_generos WHERE id_genero = 5;

INSERT INTO tb_localizacoes(localizacao) VALUES ('TEST');

UPDATE tb_localizacoes SET localizacao = 'TEST 2' WHERE id_loc = 3401;

DELETE FROM tb_localizacoes WHERE id_loc = 3401;

INSERT INTO tb_niveis(nivel) VALUES ('TEST');

UPDATE tb_niveis SET nivel = 'TESTE 2' WHERE id_nivel = 5;

DELETE FROM tb_niveis WHERE id_nivel = 7;

INSERT INTO tb_referencias(ano, id_loc, id_genero, id_nivel, id_area_estudo) VALUES (2022, 1, 1, 1, 1);

UPDATE tb_referencias SET ano = '2024' WHERE id_referencia = 80004;

DELETE FROM tb_referencias WHERE id_referencia = 80004;










