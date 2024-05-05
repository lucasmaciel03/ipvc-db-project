import axios from 'axios';
import { LocationsModel } from '../models/tb_locations.js';

// Function to fetch data from an API
async function fetchData(url) {
    try {
        const response = await axios.get(url);
        return response.data;
    } catch (error) {
        console.error('Error fetching data:', error);
        return [];
    }
}

// Function to store locations in the database
async function storeLocations(locations) {
    for (const location of locations) {
        try {
            await LocationsModel.create({ localizacao: location });
            console.log('Location saved:', location);
        } catch (error) {
            console.error('Error saving location:', location, error);
        }
    }
}

// Controller function to fetch and store all locations
async function updateLocations() {
    // URLs for the APIs
    const urls = {
        freguesias: 'https://json.geoapi.pt/freguesias',
        municipios: 'https://json.geoapi.pt/municipios',
    };

    // Fetch and store freguesias
    const freguesias = await fetchData(urls.freguesias);
    await storeLocations(freguesias);

    // Fetch and store municipios
    const municipios = await fetchData(urls.municipios);
    await storeLocations(municipios);

    console.log('All locations have been updated.');
}

export { updateLocations };