import { Sequelize } from 'sequelize';
import { dbInstance } from '../config/db.js';

const GenerosModel = dbInstance.define('tb_genero', {
    id_genero: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    genero: {
        type: Sequelize.CHAR(1),
        allowNull: false,
        validate: {
            isIn: [['M', 'F']]
        }
    }
}, {
    timestamps: false
});

export { GenerosModel };