const db = require('../config/db');

const Budget = {
    async upsert({ userId, categoryId, limitAmount, monthYear }) {
        // monthYear is normalized to YYYY-MM-01 by service
        const query = `
            INSERT INTO budgets (user_id, category_id, limit_amount, month_year)
            VALUES ($1, $2, $3, $4)
            ON CONFLICT (user_id, category_id, month_year)
            DO UPDATE SET limit_amount = EXCLUDED.limit_amount, created_at = CURRENT_TIMESTAMP
            RETURNING *, (xmax > 0) as updated
        `;
        const { rows } = await db.query(query, [userId, categoryId, limitAmount, monthYear]);
        return rows[0];
    },

    async findAllByUser(userId, monthYear) {
        let query = 'SELECT b.*, c.name as category_name FROM budgets b LEFT JOIN categories c ON b.category_id = c.id WHERE b.user_id = $1';
        const values = [userId];

        if (monthYear) {
            query += ' AND b.month_year = $2';
            values.push(monthYear);
        }

        const { rows } = await db.query(query, values);
        return rows;
    },

    async delete(id, userId) {
        const query = 'DELETE FROM budgets WHERE id = $1 AND user_id = $2';
        await db.query(query, [id, userId]);
    },

    async getBudgetUsage(userId, monthYear) {
        // monthYear should be 'YYYY-MM-01'
        const query = `
            SELECT 
                b.id,
                b.limit_amount,
                b.category_id,
                COALESCE(c.name, 'Total') as category_name,
                COALESCE(SUM(e.amount), 0) as spent_amount,
                (b.limit_amount - COALESCE(SUM(e.amount), 0)) as remaining_amount,
                CASE 
                    WHEN b.limit_amount > 0 THEN (COALESCE(SUM(e.amount), 0) / b.limit_amount) * 100 
                    ELSE 0 
                END as percentage_used
            FROM budgets b
            LEFT JOIN categories c ON b.category_id = c.id
            LEFT JOIN expenses e ON e.user_id = b.user_id 
                AND (b.category_id IS NULL OR e.category_id = b.category_id)
                AND TO_CHAR(e.date, 'YYYY-MM') = TO_CHAR(b.month_year, 'YYYY-MM')
            WHERE b.user_id = $1 AND b.month_year = $2
            GROUP BY b.id, b.limit_amount, b.category_id, c.name
        `;
        const { rows } = await db.query(query, [userId, monthYear]);
        return rows;
    }
};

module.exports = Budget;
