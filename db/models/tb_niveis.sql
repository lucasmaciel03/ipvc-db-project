-- Active: 1709286079626@@localhost@1433@bd_project
CREATE TABLE tb_niveis (
    id_nivel INT PRIMARY KEY IDENTITY(1,1),
    nivel VARCHAR(255) NOT NULL
);

CREATE INDEX idx_nivel ON tb_niveis(id_nivel);
