import { NiveisModel } from '../models/tb_niveis.js';

// Todos os niveis do ensino superior em Portugal
const niveis = [
    'Ensino Superior - CTESP',
    'Ensino Superior - Licenciatura',
    'Ensino Superior - Mestrado',
    'Ensino Superior - Doutoramento'
];

// Função para guardar os niveis na base de dados
async function storeNiveis() {
    for (const nivel of niveis) {
        try {
            await NiveisModel.create({ nivel });
            console.log('Nivel guardado:', nivel);
        } catch (error) {
            console.error('Erro ao guardar nivel:', nivel, error);
        }
    }
}

export { storeNiveis };