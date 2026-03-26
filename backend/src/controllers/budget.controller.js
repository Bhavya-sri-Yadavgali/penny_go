const budgetService = require('../services/budget.service');

const setBudget = async (req, res, next) => {
    try {
        const { categoryId, limitAmount, monthYear } = req.body;
        if (!limitAmount || !monthYear) {
            return res.status(400).json({ status: 'fail', message: 'Limit amount and monthYear (YYYY-MM) are required' });
        }

        const data = await budgetService.setBudget(req.user.id, { categoryId, limitAmount, monthYear });
        
        // If the budget was updated, return a specific message as requested
        const message = data.isUpdate ? 'Existing budget updated successfully' : 'New budget set successfully';
        
        res.status(200).json({ status: 'success', message, data: data.budget });
    } catch (error) {
        next(error);
    }
};

const getBudgets = async (req, res, next) => {
    try {
        const budgets = await budgetService.getBudgets(req.user.id, req.query.monthYear);
        res.status(200).json({ status: 'success', data: { budgets } });
    } catch (error) {
        next(error);
    }
};

const deleteBudget = async (req, res, next) => {
    try {
        await budgetService.deleteBudget(req.params.id, req.user.id);
        res.status(204).json({ status: 'success', data: null });
    } catch (error) {
        res.status(404).json({ status: 'fail', message: 'Budget not found' });
    }
};

const getBudgetUsage = async (req, res, next) => {
    try {
        // Automatically uses current month if no monthYear is provided
        const usage = await budgetService.getBudgetUsage(req.user.id, req.query.monthYear);
        res.status(200).json({ status: 'success', data: { usage } });
    } catch (error) {
        next(error);
    }
};

module.exports = {
    setBudget,
    getBudgets,
    deleteBudget,
    getBudgetUsage
};
