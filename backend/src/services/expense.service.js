const Expense = require('../models/expense.model');

const createExpense = async (userId, data) => {
    return await Expense.create({ userId, ...data });
};

const getExpenses = async (userId, filters) => {
    return await Expense.findAllFiltered(userId, filters);
};

const getExpenseById = async (id, userId) => {
    return await Expense.findById(id, userId);
};

const updateExpense = async (id, userId, data) => {
    const expense = await Expense.findById(id, userId);
    if (!expense) throw new Error('Expense not found');
    return await Expense.update(id, userId, data);
};

const deleteExpense = async (id, userId) => {
    const expense = await Expense.findById(id, userId);
    if (!expense) throw new Error('Expense not found');
    await Expense.delete(id, userId);
};

const getAnalytics = async (userId) => {
    const categorySummary = await Expense.getCategorySummary(userId);
    const monthlyStats = await Expense.getMonthlyStats(userId);
    
    return {
        categorySummary,
        monthlyStats
    };
};

module.exports = {
    createExpense,
    getExpenses,
    getExpenseById,
    updateExpense,
    deleteExpense,
    getAnalytics
};
