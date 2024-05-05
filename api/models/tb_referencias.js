import { Sequelize } from 'sequelize';
import { dbInstance } from '../config/db.js';

// SQL SCRIPT
// CREATE TABLE tb_referencias(
//     id_referencia INT PRIMARY KEY IDENTITY(1,1),
//     ano INT NOT NULL,
//     id_loc INT NOT NULL,
//     id_genero INT NOT NULL,
//     id_nivel INT NOT NULL,
//     id_area_estudo INT NOT NULL,
//     FOREIGN KEY (id_loc) REFERENCES tb_localizacoes(id_loc),
//     FOREIGN KEY (id_genero) REFERENCES tb_genero(id_genero),
//     FOREIGN KEY (id_nivel) REFERENCES tb_niveis(id_nivel),
//     FOREIGN KEY (id_area_estudo) REFERENCES tb_area_estudo(id_area_estudo)
// );

const ReferenciasModel = dbInstance.define('tb_referencias', {
    id_referencia: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    ano: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    id_loc: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    id_genero: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    id_nivel: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    id_area_estudo: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
}, {
    timestamps: false
});

export { ReferenciasModel };

