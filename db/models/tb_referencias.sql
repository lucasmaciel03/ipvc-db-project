-- Active: 1709286079626@@localhost@1433@bd_project
CREATE TABLE tb_referencias(
    id_referencia INT PRIMARY KEY IDENTITY(1,1),
    ano INT NOT NULL,
    id_loc INT NOT NULL,
    id_genero INT NOT NULL,
    id_nivel INT NOT NULL,
    id_area_estudo INT NOT NULL,
    FOREIGN KEY (id_loc) REFERENCES tb_localizacoes(id_loc),
    FOREIGN KEY (id_genero) REFERENCES tb_generos(id_genero),
    FOREIGN KEY (id_nivel) REFERENCES tb_niveis(id_nivel),
    FOREIGN KEY (id_area_estudo) REFERENCES tb_area_estudos(id_area_estudo)
);

