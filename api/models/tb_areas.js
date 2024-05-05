import { Sequelize } from 'sequelize';
import { dbInstance } from '../config/db.js';

const AreasModel = dbInstance.define('tb_area_estudo', {
    id_area_estudo: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    area_estudo: {
        type: Sequelize.STRING
    }
}, {
    timestamps: false
});

export { AreasModel };