const categoryService = require('../services/category.service');

const createCategory = async (req, res, next) => {
    try {
        const { name, icon, color } = req.body;
        if (!name) return res.status(400).json({ status: 'fail', message: 'Category name is required' });

        const category = await categoryService.createCategory(req.user.id, { name, icon, color });
        res.status(201).json({ status: 'success', data: { category } });
    } catch (error) {
        next(error);
    }
};

const getCategories = async (req, res, next) => {
    try {
        const categories = await categoryService.getCategories(req.user.id);
        res.status(200).json({ status: 'success', data: { categories } });
    } catch (error) {
        next(error);
    }
};

const updateCategory = async (req, res, next) => {
    try {
        const category = await categoryService.updateCategory(req.params.id, req.user.id, req.body);
        res.status(200).json({ status: 'success', data: { category } });
    } catch (error) {
        res.status(404).json({ status: 'fail', message: error.message });
    }
};

const deleteCategory = async (req, res, next) => {
    try {
        await categoryService.deleteCategory(req.params.id, req.user.id);
        res.status(204).json({ status: 'success', data: null });
    } catch (error) {
        res.status(404).json({ status: 'fail', message: error.message });
    }
};

module.exports = {
    createCategory,
    getCategories,
    updateCategory,
    deleteCategory
};
