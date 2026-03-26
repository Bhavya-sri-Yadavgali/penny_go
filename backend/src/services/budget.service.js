const Budget = require('../models/budget.model');

const setBudget = async (userId, { categoryId, limitAmount, monthYear }) => {
    // Normalize monthYear to YYYY-MM-01
    const normalizedDate = `${monthYear}-01`;
    
    const budget = await Budget.upsert({
        userId,
        categoryId: categoryId || null,
        limitAmount,
        monthYear: normalizedDate
    });

    return {
        budget,
        isUpdate: budget.updated === true // updated is true if a record was actually updated
    };
};

const getBudgets = async (userId, monthYear) => {
    const normalizedDate = monthYear ? `${monthYear}-01` : null;
    return await Budget.findAllByUser(userId, normalizedDate);
};

const deleteBudget = async (id, userId) => {
    await Budget.delete(id, userId);
};

const getBudgetUsage = async (userId, monthYear) => {
    const normalizedDate = monthYear ? `${monthYear}-01` : `${new Date().toISOString().slice(0, 7)}-01`;
    return await Budget.getBudgetUsage(userId, normalizedDate);
};

module.exports = {
    setBudget,
    getBudgets,
    deleteBudget,
    getBudgetUsage
};
