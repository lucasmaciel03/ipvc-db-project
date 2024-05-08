-- Função que calcula a média das pessoas do sexo feminino com licenciatura em biologia na póvoa de varzim
CREATE FUNCTION AVGFemininaLicenciaturaBiologiaPovoaVarzim(
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @average FLOAT;

    SELECT @average = AVG(CAST((CASE WHEN g.genero = 'F' THEN 1 ELSE 0 END) AS FLOAT))
    FROM tb_referencias r
    INNER JOIN tb_generos g ON r.id_genero = g.id_genero
    INNER JOIN tb_niveis n ON r.id_nivel = n.id_nivel
    INNER JOIN tb_area_estudos ON r.id_area_estudo = ae.id_area_estudo
    INNER JOIN tb_localizacoes ON r.id_loc = l.id_loc
    WHERE ae.area_estudo = 'biologia'
    AND n.nivel = 'Ensino Superior - Licenciatura'
    AND l.localizacao = 'Póvoa de Varzim'

    RETURN @average;
END
GO;