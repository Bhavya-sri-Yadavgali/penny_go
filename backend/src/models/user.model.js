const db = require('../config/db');

const User = {
    async create({ name, email, password_hash }) {
        const query = 'INSERT INTO users(name, email, password_hash) VALUES($1, $2, $3) RETURNING id, name, email, created_at';
        const { rows } = await db.query(query, [name, email, password_hash]);
        return rows[0];
    },

    async findByEmail(email) {
        const query = 'SELECT * FROM users WHERE email = $1';
        const { rows } = await db.query(query, [email]);
        return rows[0];
    },

    async findById(id) {
        const query = 'SELECT id, name, email, created_at FROM users WHERE id = $1';
        const { rows } = await db.query(query, [id]);
        return rows[0];
    },

    // Refresh Token Management
    async saveRefreshToken(userId, token, expiresAt) {
        const query = 'INSERT INTO refresh_tokens(user_id, token, expires_at) VALUES($1, $2, $3)';
        await db.query(query, [userId, token, expiresAt]);
    },

    async findRefreshToken(token) {
        const query = 'SELECT * FROM refresh_tokens WHERE token = $1';
        const { rows } = await db.query(query, [token]);
        return rows[0];
    },

    async deleteRefreshToken(token) {
        const query = 'DELETE FROM refresh_tokens WHERE token = $1';
        await db.query(query, [token]);
    },

    async deleteAllUserRefreshTokens(userId) {
        const query = 'DELETE FROM refresh_tokens WHERE user_id = $1';
        await db.query(query, [userId]);
    }
};

module.exports = User;
