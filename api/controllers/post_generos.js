import { GenerosModel } from "../models/tb_genero.js";

// Generos a guardar na base de dados
const generos = ['M', 'F'];

// Função para guardar os generos na base de dados
async function storeGeneros() {
    for (const genero of generos) {
        try {
            await GenerosModel.create({ genero });
            console.log('Genero guardado:', genero);
        } catch (error) {
            console.error('Erro ao guardar genero:', genero, error);
        }
    }
}

export { storeGeneros };
