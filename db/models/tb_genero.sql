CREATE TABLE tb_generos (
    id_genero INT PRIMARY KEY IDENTITY(1,1),
    genero CHAR(1) CHECK (genero IN ('M','F')) NOT NULL
);

CREATE INDEX idx_genero ON tb_generos(id_genero);