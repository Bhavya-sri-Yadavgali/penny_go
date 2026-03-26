const express = require('express');
const budgetController = require('../controllers/budget.controller');
const authMiddleware = require('../middlewares/auth.middleware');

const router = express.Router();

// All budget routes are protected
router.use(authMiddleware);

router.post('/', budgetController.setBudget);
router.get('/', budgetController.getBudgets);
router.get('/usage', budgetController.getBudgetUsage);
router.delete('/:id', budgetController.deleteBudget);

module.exports = router;
