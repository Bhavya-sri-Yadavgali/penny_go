const Category = require('../models/category.model');

const createCategory = async (userId, data) => {
    return await Category.create({ userId, ...data });
};

const getCategories = async (userId) => {
    return await Category.findAllByUser(userId);
};

const updateCategory = async (id, userId, data) => {
    const category = await Category.findById(id, userId);
    if (!category) throw new Error('Category not found');
    return await Category.update(id, userId, data);
};

const deleteCategory = async (id, userId) => {
    const category = await Category.findById(id, userId);
    if (!category) throw new Error('Category not found');
    await Category.delete(id, userId);
};

module.exports = {
    createCategory,
    getCategories,
    updateCategory,
    deleteCategory
};
