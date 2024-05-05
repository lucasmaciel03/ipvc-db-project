import { Sequelize } from "sequelize";;

const dbInstance = new Sequelize('bd_project', 'sa', 'ABCabc@123', {
    host: 'localhost',
    dialect: 'mssql'
});

export { dbInstance };