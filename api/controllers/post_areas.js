import { AreasModel } from '../models/tb_areas.js';
// Todas as áreas de estudo do ensino superior em Portugal

const areas = [
    'Agricultura, Silvicultura e Pescas',
    'Arquitectura e Urbanismo',
    'Artes',
    'Ciências Biológicas',
    'Ciências da Comunicação',
    'Ciências da Educação',
    'Ciências da Saúde',
    'Ciências Empresariais',
    'Ciências Exatas e da Terra',
    'Ciências Sociais',
    'Ciências Veterinárias',
    'Contabilidade e Fiscalidade',
    'Desporto',
    'Direito',
    'Economia',
    'Educação Física e Desporto',
    'Engenharia Civil',
    'Engenharia e Técnicas Afins',
    'Engenharia Mecânica',
    'Engenharia Química',
    'Filosofia',
    'Física',
    'Geografia',
    'História',
    'Humanidades',
    'Informática',
    'Línguas e Literatura',
    'Matemática e Estatística',
    'Medicina',
    'Música',
    'Psicologia',
    'Química',
    'Serviço Social',
    'Tecnologia e Proteção do Ambiente',
    'Tecnologias de Informação e Comunicação',
    'Turismo'
];

// Função para guardar as áreas na base de dados
async function storeAreas() {
    for (const area of areas) {
        try {
            await AreasModel.create({ area_estudo: area });
            console.log('Area guardada:', area);
        } catch (error) {
            console.error('Erro ao guardar area:', area, error);
        }
    }
}

export { storeAreas };