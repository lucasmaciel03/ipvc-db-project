-- Active: 1709286079626@@localhost@1433@bd_project
CREATE TABLE tb_localizacoes(
    id_loc INT PRIMARY KEY IDENTITY(1,1),
    localizacao VARCHAR(255) NOT NULL
);

CREATE INDEX idx_loc ON tb_localizacoes(id_loc);
