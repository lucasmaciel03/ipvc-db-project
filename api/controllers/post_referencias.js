import { ReferenciasModel } from '../models/tb_referencias.js';

// Para a tabela de referencias será necessário criar um controlador que gere 40 000 rows de dados aleatórios. 
// Para o cammpo ano, deverá ser gerado um número aleatório entre 2000 e 2024.
// Para o campo id_loc, deverá ser gerado um número aleatório entre 1 e 3400.
// Para o campo id_genero, deverá ser gerado um número aleatório entre 1 e 2.
// Para o campo id_nivel, deverá ser gerado um número aleatório entre 1 e 4.
// Para o campo id_area_estudo, deverá ser gerado um número aleatório entre 1 e 36.

// Função para guardar as referencias na base de dados
async function storeReferencias() {
    for (let i = 0; i < 500; i++) {
        try {
            await ReferenciasModel.create({
                ano: Math.floor(Math.random() * (2024 - 2000 + 1)) + 2000,
                id_loc: Math.floor(Math.random() * (3400 - 1 + 1)) + 1,
                id_genero: Math.floor(Math.random() * (2 - 1 + 1)) + 1,
                id_nivel: Math.floor(Math.random() * (4 - 1 + 1)) + 1,
                id_area_estudo: Math.floor(Math.random() * (36 - 1 + 1)) + 1
            });
            console.log('Referencia guardada:', i);
        } catch (error) {
            console.error('Erro ao guardar referencia:', i, error);
        }
    }
}

export { storeReferencias };

// Função para adicionar mais dados à tabela de referencias
async function addReferencias() {
    for (let i = 0; i < 500; i++) {
        try {
            await ReferenciasModel.create({
                ano: Math.floor(Math.random() * (2024 - 2000 + 1)) + 2000,
                id_loc: Math.floor(Math.random() * (3400 - 1 + 1)) + 1,
                id_genero: Math.floor(Math.random() * (2 - 1 + 1)) + 1,
                id_nivel: Math.floor(Math.random() * (4 - 1 + 1)) + 1,
                id_area_estudo: Math.floor(Math.random() * (36 - 1 + 1)) + 1
            });
            console.log('Referencia adicionada:', i);
        } catch (error) {
            console.error('Erro ao adicionar referencia:', i, error);
        }
    }
}