const { body, query } = require('express-validator');

const expenseValidation = [
    body('title').trim().notEmpty().withMessage('Title is required'),
    body('amount').isNumeric().withMessage('Amount must be a number'),
    body('categoryId').optional().isUUID().withMessage('Invalid Category ID format'),
    body('date').optional().isISO8601().withMessage('Invalid date format (YYYY-MM-DD or ISO8601)'),
];

const expenseFilterValidation = [
    query('startDate').optional().isISO8601().withMessage('Invalid start date format'),
    query('endDate').optional().isISO8601().withMessage('Invalid end date format'),
    query('sortBy').optional().isIn(['date', 'amount', 'title']).withMessage('Invalid sort field'),
];

module.exports = {
    expenseValidation,
    expenseFilterValidation,
};
