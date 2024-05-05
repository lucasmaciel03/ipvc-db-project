import { Sequelize } from 'sequelize';
import { dbInstance } from '../config/db.js';

const NiveisModel = dbInstance.define('tb_niveis', {
    id_nivel: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nivel: {
        type: Sequelize.STRING
    }
}, {
    timestamps: false
});

export { NiveisModel };