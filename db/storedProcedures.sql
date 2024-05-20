-- Procedure para inserção de dados
CREATE PROCEDURE sp_inserir_referencia
    @id_loc INT,
    @id_genero INT,
    @id_nivel INT,
    @id_area_estudo INT,
    @ano INT
AS
BEGIN
    INSERT INTO tb_referencias(id_loc, id_genero, id_nivel, id_area_estudo,ano)
    VALUES (@id_loc, @id_genero, @id_nivel, @id_area_estudo, @ano)
END
go;

-- Procedure para remoção de dados
CREATE PROCEDURE sp_remover_referencia
    @id_referencia INT
AS
BEGIN
    DELETE FROM tb_referencias
    WHERE id_referencia = @id_referencia
END
go;

-- Comando para usar o sp de remover
EXEC sp_remover_referencia @id_referencia = 1;
go;

-- Procedure para controlo de transação de erros
CREATE PROCEDURE sp_inserir_referencias_com_transacao
    @id_loc INT,
    @id_genero INT,
    @id_nivel INT,
    @id_area_estudo INT,
    @ano INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO tb_referencias(id_loc, id_genero, id_nivel, id_area_estudo,ano)
            VALUES (@id_loc, @id_genero, @id_nivel, @id_area_estudo, @ano)
        COMMIT
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY()
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1)
    END CATCH
END;

-- Comando para usar o stored procedure
EXEC sp_inserir_referencias_com_transacao @id_loc = 1, @id_genero = 1,@id_nivel = 1,@id_area_estudo = 1, @ano = 2020;