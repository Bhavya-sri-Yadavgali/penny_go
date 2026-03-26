const Developer = require('../models/developer.model');

const getDevelopers = async () => {
    // Ensure table exists and data is seeded
    await Developer.createTable();
    await Developer.seed();
    
    return await Developer.getAll();
};

module.exports = {
    getDevelopers,
};
