-- Active: 1709286079626@@localhost@1433@bd_project

-- Validation Trigger - Before inserting data into tb_referencias, ensure that the referenced ano (year) is within a valid range (e.g., not a future year).
CREATE TRIGGER validate_ano
ON tb_referencias
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS(SELECT 1 FROM inserted WHERE ano > YEAR(GETDATE()))
    BEGIN
        RAISERROR('Ano inválido. O ano não pode ser futuro.', 16, 1)
        RETURN;
    END;
    INSERT INTO tb_referencias(ano, id_loc, id_genero, id_nivel, id_area_estudo)
    SELECT ano, id_loc, id_genero, id_nivel, id_area_estudo
    FROM inserted;
END

-- Insert example to activate the trigger / won't work because the year is in the future
INSERT INTO tb_referencias(ano, id_loc, id_genero, id_nivel, id_area_estudo) VALUES (2027, 1, 1, 1, 1);
GO;

-- Trigger para a tabela tb_audit_log que regista as operações na tabela tb_area_estudos
CREATE TRIGGER tr_area_estudos
ON tb_area_estudos
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @operation_type VARCHAR(10);

    IF EXISTS(SELECT * FROM inserted)
    BEGIN 
        IF EXISTS(SELECT * FROM deleted)
            SET @operation_type = 'UPDATE';
        ELSE
            SET @operation_type = 'INSERT';
    END
    ELSE
    BEGIN
        SET @operation_type = 'DELETE';
    END

    INSERT INTO tb_audit_log (table_name, operation_type, username, old_data, new_data)
    VALUES ('tb_area_estudos', @operation_type, SUSER_NAME(), (SELECT * FROM deleted FOR XML AUTO), (SELECT * FROM inserted FOR XML AUTO));
END

-- Test trigger for tb_area_estudos (INSERT)
INSERT INTO tb_area_estudos(area_estudo) VALUES ('TEST');

-- Test trigger for tb_area_estudos (UPDATE)
UPDATE tb_area_estudos SET area_estudo = 'TEST 2' WHERE id_area_estudo = 1;

-- Test trigger for tb_area_estudos (DELETE)
DELETE FROM tb_area_estudos WHERE id_area_estudo = 1;

GO;

-- Trigger para a tabela tb_audit_log que regista as operações na tabela tb_genero
CREATE TRIGGER tr_generos
ON tb_generos
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @operation_type VARCHAR(10);
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
        IF EXISTS(SELECT * FROM deleted)
            SET @operation_type = 'UPDATE';
        ELSE
            SET @operation_type = 'INSERT';
    END
    ELSE
    BEGIN
        SET @operation_type = 'DELETE';
    END

    INSERT INTO tb_audit_log (table_name, operation_type, username, old_data, new_data)
    VALUES ('tb_generos', @operation_type, SUSER_NAME(), (SELECT * FROM deleted FOR XML AUTO), (SELECT * FROM inserted FOR XML AUTO));
END


-- Test trigger for tb_generos (INSERT)
INSERT INTO tb_generos(genero) VALUES ('TEST');

-- Test trigger for tb_generos (UPDATE)
UPDATE tb_generos SET genero = 'TEST 2' WHERE id_genero = 1;

-- Test trigger for tb_generos (DELETE)
DELETE FROM tb_generos WHERE id_genero = 1;

GO;

-- Trigger para a tabela tb_audit_log que regista as operações na tabela tb_localizacoes
CREATE TRIGGER tr_locations
ON tb_localizacoes
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @operation_type VARCHAR(10);
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
        IF EXISTS(SELECT * FROM deleted)
            SET @operation_type = 'UPDATE';
        ELSE
            SET @operation_type = 'INSERT';
    END
    ELSE
    BEGIN
        SET @operation_type = 'DELETE';
    END

    INSERT INTO tb_audit_log (table_name, operation_type, username, old_data, new_data)
    VALUES ('tb_localizacoes', @operation_type, SUSER_NAME(), (SELECT * FROM deleted FOR XML AUTO), (SELECT * FROM inserted FOR XML AUTO));
END

-- Test trigger for tb_localizacoes (INSERT)
INSERT INTO tb_localizacoes(localizacao) VALUES ('TEST');

-- Test trigger for tb_localizacoes (UPDATE)
UPDATE tb_localizacoes SET localizacao = 'TEST 2' WHERE id_loc = 1;

-- Test trigger for tb_localizacoes (DELETE)
DELETE FROM tb_localizacoes WHERE id_loc = 1;
GO;

-- Trigger para a tabela tb_audit_log que regista as operações na tabela tb_niveis
CREATE TRIGGER tr_niveis
ON tb_niveis
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @operation_type VARCHAR(10);
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
        IF EXISTS(SELECT * FROM deleted)
            SET @operation_type = 'UPDATE';
        ELSE
            SET @operation_type = 'INSERT';
    END
    ELSE
    BEGIN
        SET @operation_type = 'DELETE';
    END

    INSERT INTO tb_audit_log (table_name, operation_type, username, old_data, new_data)
    VALUES ('tb_niveis', @operation_type, SUSER_NAME(), (SELECT * FROM deleted FOR XML AUTO), (SELECT * FROM inserted FOR XML AUTO));
END

-- Test trigger for tb_niveis (INSERT)
INSERT INTO tb_niveis(nivel) VALUES ('TEST');

-- Test trigger for tb_niveis (UPDATE)
UPDATE tb_niveis SET nivel = 'TEST 2' WHERE id_nivel = 1;

-- Test trigger for tb_niveis (DELETE)
DELETE FROM tb_niveis WHERE id_nivel = 1;
GO;

-- Trigger para a tabela tb_audit_log que regista as operações na tabela tb_referencias
CREATE TRIGGER tr_referencias
ON tb_referencias
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @operation_type VARCHAR(10);
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
        IF EXISTS(SELECT * FROM deleted)
            SET @operation_type = 'UPDATE';
        ELSE
            SET @operation_type = 'INSERT';
    END
    ELSE
    BEGIN
        SET @operation_type = 'DELETE';
    END

    INSERT INTO tb_audit_log (table_name, operation_type, username, old_data, new_data)
    VALUES ('tb_referencias', @operation_type, SUSER_NAME(), (SELECT * FROM deleted FOR XML AUTO), (SELECT * FROM inserted FOR XML AUTO));
END

-- Test trigger for tb_referencias (INSERT)
INSERT INTO tb_referencias(ano, id_loc, id_genero, id_nivel, id_area_estudo) VALUES (2022, 1, 1, 1, 1);

-- Test trigger for tb_referencias (UPDATE)
UPDATE tb_referencias SET ano = '2024' WHERE id_referencia = 80004;

-- Test trigger for tb_referencias (DELETE)
DELETE FROM tb_referencias WHERE id_referencia = 1;
GO;


