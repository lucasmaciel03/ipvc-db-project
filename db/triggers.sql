-- Active: 1709286079626@@localhost@1433@bd_project

-- Validation Trigger - Before inserting data into tb_referencias, ensure that the referenced ano (year) is within a valid range (e.g., not a future year).
CREATE TRIGGER validate_ano
ON tb_referencias
INSTEAD OF INSERT
AS
BEGIN
    
    -- Checl if any inserted year is greater than the current year
    IF EXISTS(SELECT 1 FROM inserted WHERE ano > YEAR(GETDATE()))
    BEGIN
        RAISERROR('Ano inválido. O ano não pode ser futuro.', 16, 1)
        RETURN;
    END;

    -- If all checks pass, insert the data into tb_referencias
    INSERT INTO tb_referencias(ano, id_loc, id_genero, id_nivel, id_area_estudo)
    SELECT ano, id_loc, id_genero, id_nivel, id_area_estudo
    FROM inserted;
END

-- Insert example to activate the trigger
INSERT INTO tb_referencias(ano, id_loc, id_genero, id_nivel, id_area_estudo) VALUES (2027, 1, 1, 1, 1)
