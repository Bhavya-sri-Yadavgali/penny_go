const db = require('../config/db');

const Expense = {
    async create({ userId, categoryId, title, amount, description, date }) {
        const query = 'INSERT INTO expenses(user_id, category_id, title, amount, description, date) VALUES($1, $2, $3, $4, $5, $6) RETURNING *';
        const { rows } = await db.query(query, [userId, categoryId, title, amount, description, date]);
        return rows[0];
    },

    async findById(id, userId) {
        const query = 'SELECT * FROM expenses WHERE id = $1 AND user_id = $2';
        const { rows } = await db.query(query, [id, userId]);
        return rows[0];
    },

    async update(id, userId, { categoryId, title, amount, description, date }) {
        const query = 'UPDATE expenses SET category_id = $1, title = $2, amount = $3, description = $4, date = $5 WHERE id = $6 AND user_id = $7 RETURNING *';
        const { rows } = await db.query(query, [categoryId, title, amount, description, date, id, userId]);
        return rows[0];
    },

    async delete(id, userId) {
        const query = 'DELETE FROM expenses WHERE id = $1 AND user_id = $2';
        await db.query(query, [id, userId]);
    },

    // ADVANCED FILTERING
    async findAllFiltered(userId, filters) {
        const { categoryId, startDate, endDate, sortBy = 'date', order = 'DESC' } = filters;
        
        let query = `
            SELECT e.*, c.name as category_name, c.color as category_color, c.icon as category_icon
            FROM expenses e
            LEFT JOIN categories c ON e.category_id = c.id
            WHERE e.user_id = $1
        `;
        const values = [userId];
        let paramCount = 1;

        if (categoryId) {
            paramCount++;
            query += ` AND e.category_id = $${paramCount}`;
            values.push(categoryId);
        }

        if (startDate) {
            paramCount++;
            query += ` AND e.date >= $${paramCount}`;
            values.push(startDate);
        }

        if (endDate) {
            paramCount++;
            query += ` AND e.date <= $${paramCount}`;
            values.push(endDate);
        }

        // Validate sortBy to prevent SQL Injection
        const allowedSort = ['date', 'amount', 'title'];
        const validSort = allowedSort.includes(sortBy) ? sortBy : 'date';
        const validOrder = order.toUpperCase() === 'ASC' ? 'ASC' : 'DESC';

        query += ` ORDER BY e.${validSort} ${validOrder}`;

        const { rows } = await db.query(query, values);
        return rows;
    },

    // ANALYTICS QUERIES
    async getCategorySummary(userId) {
        const query = `
            SELECT c.name, c.color, c.icon, SUM(e.amount) as total
            FROM expenses e
            JOIN categories c ON e.category_id = c.id
            WHERE e.user_id = $1
            GROUP BY c.id, c.name, c.color, c.icon
            ORDER BY total DESC
        `;
        const { rows } = await db.query(query, [userId]);
        return rows;
    },

    async getMonthlyStats(userId) {
        const query = `
            SELECT TO_CHAR(date, 'YYYY-MM') as month, SUM(amount) as total
            FROM expenses
            WHERE user_id = $1
            GROUP BY month
            ORDER BY month DESC
            LIMIT 12
        `;
        const { rows } = await db.query(query, [userId]);
        return rows;
    }
};

module.exports = Expense;
