const expenseService = require('../services/expense.service');

const createExpense = async (req, res, next) => {
    try {
        const { title, amount, categoryId, date, description } = req.body;
        if (!title || !amount) {
            return res.status(400).json({ status: 'fail', message: 'Title and amount are required' });
        }

        const expense = await expenseService.createExpense(req.user.id, { title, amount, categoryId, date, description });
        res.status(201).json({ status: 'success', data: { expense } });
    } catch (error) {
        next(error);
    }
};

const getExpenses = async (req, res, next) => {
    try {
        const filters = {
            categoryId: req.query.categoryId,
            startDate: req.query.startDate,
            endDate: req.query.endDate,
            sortBy: req.query.sortBy,
            order: req.query.order
        };

        const expenses = await expenseService.getExpenses(req.user.id, filters);
        res.status(200).json({ status: 'success', data: { expenses } });
    } catch (error) {
        next(error);
    }
};

const getExpense = async (req, res, next) => {
    try {
        const expense = await expenseService.getExpenseById(req.params.id, req.user.id);
        if (!expense) return res.status(404).json({ status: 'fail', message: 'Expense not found' });
        res.status(200).json({ status: 'success', data: { expense } });
    } catch (error) {
        next(error);
    }
};

const updateExpense = async (req, res, next) => {
    try {
        const expense = await expenseService.updateExpense(req.params.id, req.user.id, req.body);
        res.status(200).json({ status: 'success', data: { expense } });
    } catch (error) {
        res.status(404).json({ status: 'fail', message: error.message });
    }
};

const deleteExpense = async (req, res, next) => {
    try {
        await expenseService.deleteExpense(req.params.id, req.user.id);
        res.status(204).json({ status: 'success', data: null });
    } catch (error) {
        res.status(404).json({ status: 'fail', message: error.message });
    }
};

const getAnalytics = async (req, res, next) => {
    try {
        const analytics = await expenseService.getAnalytics(req.user.id);
        res.status(200).json({ status: 'success', data: { analytics } });
    } catch (error) {
        next(error);
    }
};

module.exports = {
    createExpense,
    getExpenses,
    getExpense,
    updateExpense,
    deleteExpense,
    getAnalytics
};
