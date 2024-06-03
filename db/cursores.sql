DECLARE @id_referencia INT, @ano INT, @localizacao VARCHAR(255), @genero VARCHAR(10), @nivel VARCHAR(50), @area_estudo VARCHAR(50);
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
INNER JOIN tb_area_estudos ae ON r.id_area_estudo = ae.id_area_estudo;

OPEN cursor_info_completa;

PRINT 'id_referencia | ano | localizacao | genero | nivel | area_estudo';

FETCH NEXT FROM cursor_info_completa INTO @id_referencia, @ano, @localizacao, @genero, @nivel, @area_estudo;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT CAST(@id_referencia AS VARCHAR) + ' | ' + CAST(@ano AS VARCHAR) + ' | ' + @localizacao + ' | ' + @genero + ' | ' + @nivel + ' | ' + @area_estudo;

    FETCH NEXT FROM cursor_info_completa INTO @id_referencia, @ano, @localizacao, @genero, @nivel, @area_estudo;
END;

CLOSE cursor_info_completa;
DEALLOCATE cursor_info_completa;

go;

-- Cursor update tb_referencias set ano = 2025 where ano = 2024 and id_loc = 1 and id_genero = 1 and id_nivel = 1 and id_area_estudo = 1 
DECLARE @id_referencia INT, @ano INT, @localizacao VARCHAR(255), @genero VARCHAR(10), @nivel VARCHAR(50), @area_estudo VARCHAR(50);
DECLARE cursor_update_ano CURSOR READ_ONLY FOR
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
WHERE r.ano = 2023
AND r.id_loc = 2882
AND r.id_genero = 2
AND r.id_nivel = 4
AND r.id_area_estudo = 9;

OPEN cursor_update_ano;

FETCH NEXT FROM cursor_update_ano INTO @id_referencia, @ano, @localizacao, @genero, @nivel, @area_estudo;

WHILE @@FETCH_STATUS = 0

BEGIN
    PRINT 'Atualizando a referencia com id ' + CAST(@id_referencia AS VARCHAR) + ' para o ano de 2024';
    UPDATE tb_referencias
    SET ano = 2024
    WHERE id_referencia = @id_referencia;

    FETCH NEXT FROM cursor_update_ano INTO @id_referencia, @ano, @localizacao, @genero, @nivel, @area_estudo;
END;

CLOSE cursor_update_ano;
DEALLOCATE cursor_update_ano;
