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

-- Comando para usar o stored procedure
EXEC sp_inserir_referencia @id_loc = 1, @id_genero = 1,@id_nivel = 1,@id_area_estudo = 1, @ano = 2020;
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
go;

CREATE PROCEDURE sp_inserir_referencia_dinamico
    @id_loc INT,
    @id_genero INT,
    @id_nivel INT,
    @id_area_estudo INT,
    @ano INT,
    @nome_tabela NVARCHAR(255)
AS
BEGIN   
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);
    DECLARE @COUNTSQL NVARCHAR(MAX);

    SET @SQL = N'INSERT INTO ' + QUOTENAME(@nome_tabela) + N'(id_loc, id_genero, id_nivel, id_area_estudo,ano)
    VALUES (@id_loc, @id_genero, @id_nivel, @id_area_estudo, @ano)';

    EXEC sp_executarsql @SQL, N'@id_loc INT, @id_genero INT, @id_nivel INT, @id_area_estudo INT, @ano INT', @id_loc, @id_genero, @id_nivel, @id_area_estudo, @ano;

    SET @COUNTSQL = N'SELECT COUNT(*) AS TotalRegistos FROM ' + QUOTENAME(@nome_tabela);

    EXEC sp_executarsql @COUNTSQL;
END
go;

-- Comando para usar o stored procedure
EXEC sp_inserir_referencia_dinamico @id_loc = 1, @id_genero = 1,@id_nivel = 1,@id_area_estudo = 1, @ano = 2020, @nome_tabela = 'tb_referencias';
go;

-- Procedure que retorna e transforma dados de uma tabela num JSON
CREATE PROCEDURE sp_retornar_dados_json
    @nome_tabela NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = N'SELECT * FROM ' + QUOTENAME(@nome_tabela) + 'FOR JSON AUTO';

    --Tabela temporária para guardar os dados json
    CREATE TABLE #temp (json NVARCHAR(MAX));

    INSERT INTO #temp (json)
    EXEC sp_executesql @SQL;

    SELECT json FROM #temp;

    DROP TABLE #temp;
END
go;

-- Comando para usar o stored procedure
EXEC sp_retornar_dados_json @nome_tabela = 'tb_referencias';
go;

-- Procedure que insere dados numa tabela a partir de um dataset JSON
CREATE PROCEDURE sp_inserir_dados_json
    @json NVARCHAR(MAX),
    @nome_tabela NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = N'INSERT INTO ' + QUOTENAME(@nome_tabela) + ' SELECT * FROM OPENJSON(@json) WITH (' + @json + ')';

    EXEC sp_executesql @SQL, N'@json NVARCHAR(MAX)', @json;
END
go;

-- Comando para usar o stored procedure
EXEC sp_inserir_dados_json @json = N'{"ano":2020,"id_loc":1,"id_genero":1,"id_nivel":1,"id_area_estudo":1}', @nome_tabela = 'tb_referencias';
go;


-- Procedure que valida se o utilizador tem permissão para ler uma view e retornar mensagem de erro "Não tem permissão para utilizar esta view" caso não tenha
CREATE PROCEDURE sp_validar_permissao_view
    @nome_view NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = N'SELECT * FROM ' + QUOTENAME(@nome_view);

    BEGIN TRY
        EXEC sp_executesql @SQL;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT
        SELECT @ErrorMessage = "Você não tem permissão para utilizar esta view.",
               @ErrorSeverity = ERROR_SEVERITY()
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1)
    END CATCH
END
go;

