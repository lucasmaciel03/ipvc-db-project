CREATE FUNCTION AVGMasculina_Mestrado_TIC()
RETURNS FLOAT
AS
BEGIN
    DECLARE @average FLOAT;

    SELECT @average = AVG(CAST((CASE WHEN g.genero = 'M' THEN 1 ELSE 0 END) AS FLOAT))
    FROM tb_referencias r
    INNER JOIN tb_generos g ON r.id_genero = g.id_genero
    INNER JOIN tb_niveis n ON r.id_nivel = n.id_nivel
    INNER JOIN tb_area_estudos ae ON r.id_area_estudo = ae.id_area_estudo  -- Corrected alias
    INNER JOIN tb_localizacoes l ON r.id_loc = l.id_loc  -- Corrected alias
    WHERE ae.area_estudo = 'Tecnologias da Informação e Comunicação'
    AND n.nivel = 'Ensino Superior - Mestrado'

    RETURN @average;
END;
GO;

SELECT dbo.AVGMasculina_Mestrado_TIC() AS MEDIA_MASCULINA_MESTRADO_TIC;