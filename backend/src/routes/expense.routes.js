const express = require('express');
const expenseController = require('../controllers/expense.controller');
const authMiddleware = require('../middlewares/auth.middleware');
const { expenseValidation, expenseFilterValidation } = require('../middleware/expense_validation');
const validate = require('../middleware/validate.middleware');

const router = express.Router();

// All expense routes are protected
router.use(authMiddleware);

router.get('/', expenseFilterValidation, validate, expenseController.getExpenses);
router.get('/analytics', expenseController.getAnalytics);
router.get('/:id', expenseController.getExpense);
router.post('/', expenseValidation, validate, expenseController.createExpense);
router.put('/:id', expenseValidation, validate, expenseController.updateExpense);
router.delete('/:id', expenseController.deleteExpense);

module.exports = router;
