import { Sequelize } from 'sequelize';
import { dbInstance } from '../config/db.js';

const LocationsModel = dbInstance.define('tb_localizacoes', {
    id_loc: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    localizacao: {
        type: Sequelize.STRING
    }
}, {
    timestamps: false
});

export { LocationsModel };