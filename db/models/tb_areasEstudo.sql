-- Active: 1709286079626@@localhost@1433@bd_project
CREATE TABLE tb_area_estudos(
    id_area_estudo INT PRIMARY KEY IDENTITY(1,1),
    area_estudo VARCHAR(255) NOT NULL
);

CREATE INDEX idx_area_estudo ON tb_area_estudos(id_area_estudo);