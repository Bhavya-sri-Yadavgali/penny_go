const db = require('../config/db');

const Category = {
    async create({ userId, name, icon, color }) {
        const query = 'INSERT INTO categories(user_id, name, icon, color) VALUES($1, $2, $3, $4) RETURNING *';
        const { rows } = await db.query(query, [userId, name, icon, color]);
        return rows[0];
    },

    async findAllByUser(userId) {
        const query = 'SELECT * FROM categories WHERE user_id = $1 ORDER BY name ASC';
        const { rows } = await db.query(query, [userId]);
        return rows[0];
    },

    async findById(id, userId) {
        const query = 'SELECT * FROM categories WHERE id = $1 AND user_id = $2';
        const { rows } = await db.query(query, [id, userId]);
        return rows[0];
    },

    async update(id, userId, { name, icon, color }) {
        const query = 'UPDATE categories SET name = $1, icon = $2, color = $3 WHERE id = $4 AND user_id = $5 RETURNING *';
        const { rows } = await db.query(query, [name, icon, color, id, userId]);
        return rows[0];
    },

    async delete(id, userId) {
        const query = 'DELETE FROM categories WHERE id = $1 AND user_id = $2';
        await db.query(query, [id, userId]);
    }
};

module.exports = Category;
